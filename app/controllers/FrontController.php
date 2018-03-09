<?php
/**
 * フロントコントローラ
 *
 * @category   App
 * @package    Controller
 *
 */
class FrontController
{
    /**
     * ライブラリディレクトリ名
     *
     * @var str ディレクトリ名
     */
    protected $_libName = null;

    /**
     * コンストラクタ
     */
    public function __construct($appDir, $libName='lib')
    {
        global $_start;
        global $DEBUG_MODE;

        $this->_libName = $libName;

        try {

            $_start = microtime(true);

            $this->_define($appDir);   //定数設定
            $this->_setTempDir();      //テンポラリーディレクトリ作成
            $this->_setLocale();       //ロケール設定
            $this->_iniSet();          //php.ini 設定
            $this->_includeFiles();    //ファイル読み込み
            $this->_setErrorHandler(); //ユーザーエラーハンドラー・ユーザーシャットダウンハンドラー読み込み（各ハンドラー関数はGeo/Static.phpにあり）
            $this->_setConfig();       //設定値取得
            $this->_setLogger();       //ロガー（_sessionStart()でモデルインスタンスを作る都合上、予めレジストリにloggerを入れておかないとモデル生成できない）
            $this->_sessionStart();    //セッションスタート
            $this->_run();             //アプリケーション実行

        //以下は低レベル（コントローラ外）でスローされた例外の処理

        //例外
        } catch (Exception $e) {

            if($e instanceof Zend_Db_Adapter_Exception or $e instanceof PDOException){
                $error_msg = 'データベース に接続できません。';
            } elseif ($e instanceof Zend_Config_Exception){
                $error_msg = '設定ファイルが読み込めません。';
            } else {
                $error_msg = 'システムエラーが発生しました。';
            }

            //ロガーが無ければ生成
            if(!is_object($this->logger)){
                $this->_setLogger();
            }
            //エラー内容をロギング
            $this->logger->emerg($e);

            //セッションが無い場合スタート
            if(!$this->_session){
                ini_set('session.name', PHPSESSID);            // フロントコントローラで指定しているセッション名と同じものを指定
                session_save_path(APP_ROOT . '/tmp/session/'); // フロントコントローラで指定しているセッション保存パスと同じものを指定
                session_start();
            }

            $_SESSION['app']['error_msg'] = $error_msg;

            if($DEBUG_MODE){
               $_SESSION['app']['exception'] = serialize($e);
            } else {
                unset($_SESSION['app']['exception']);
            }

            //エラーページへリダイレクト
            header('Location:' . BASE_URL . APP_PATH . '/apperror.php');
        }
    }

    /**
     * php.ini設定
     *
     * php.iniの設定を実行時変更したい場合はここに記入
     * 但し、ディレクティブ設定変更の属性が"PHP_INI_ALL"の項目のみ
     */
    private function _iniSet()
    {
        ini_set('memory_limit','512M');

        if(!ini_get('error_log')){
            ini_set('error_log', APP_ROOT . '/log/php_error.dat');
        }

        //セッションファイルガーベージコレクション
        if (isset($_GET['gc_divisor'])) {
            ini_set('session.gc_divisor', 1);
        }
        if (get_magic_quotes_gpc()) {

            function stripslashes_gpc(&$value)
            {
                $value = stripslashes($value);
            }
            array_walk_recursive($_GET, 'stripslashes_gpc');
            array_walk_recursive($_POST, 'stripslashes_gpc');
            array_walk_recursive($_COOKIE, 'stripslashes_gpc');
            array_walk_recursive($_REQUEST, 'stripslashes_gpc');
        }
    }
    /**
     * 定数設定
     *
     * APP_DIR          ドキュメントルートからアプリケーション実行ファイル（index.php）までのパス（/some_directry）
     * BASE_URL         ベースURL（http://www.example.com）
     * SSL_BASE_URL     SSLベースURL（https://www.example.com）
     * ROOT/APP_ROOT    アプリケーションディレクトリまでのフルパス（/var/www/vhosts/www.example.com/app）
     * MODEL_PATH       モデルクラスのパス
     * PLUGIN_PATH      プラグインパス
     * IOCONFIG_PATH    入出力設定ファイルパス
     * VIEW_SCRIPT_PATH ビュースクリプトパス
     * DS               セパレータ"/"または"\"(Windowsの場合)
     * SIGNAL_FILE      シグナルファイル（サーバールートからのパス）
     *
     */
    private function _define($appDir)
    {
        define('APP_DIR',      dirname($appDir));

        //ドキュメントルート直下に置く場合は'APP_PATH'は空
        if(dirname($_SERVER['SCRIPT_NAME']) == '/') {
            define('APP_PATH', '');
            define('APP_UP_PATH', '');
        } else {
            define('APP_PATH',    dirname($_SERVER['SCRIPT_NAME']));
            define('APP_UP_PATH', '');
        }

        define('BASE_URL',        'http://'  . $_SERVER['HTTP_HOST']); // 定数-ベースURL
        define('SSL_BASE_URL',    'https://' . $_SERVER['HTTP_HOST']); // 定数-SSLベースURL
        define('ROOT',             dirname(dirname(__FILE__)));        // 定数-appディレクトリ
        define('APP_ROOT',         dirname(dirname(__FILE__)));        // 定数-appディレクトリ
        define('DOCUMENT_ROOT',    dirname($appDir));                  // 実際のドキュメントルート
        define('DS',               DIRECTORY_SEPARATOR);               // ディレクトリセパレータ
        define('MODEL_PATH',       ROOT . DS . 'models' . DS);         // modelパス
        define('PLUGIN_PATH',      ROOT . DS . 'plugins' . DS);        // プラグインパス
        define('IOCONFIG_PATH',    ROOT . DS . 'config' . DS . 'ioconfig' . DS); // IOコンフィグファイルパス
        define('VIEW_SCRIPT_PATH', ROOT . DS . 'views' . DS);          // ビュースクリプトパス
        define('TEMP_PATH',        ROOT . DS . 'tmp' . DS)  ;          // テンポラリーフォルダ
        define('DEFAULT_UA',      'pc');                               // デフォルトUA
        define('DEFAULT_LANG',    'ja');                               // デフォルト言語
        define('SIGNAL_FILE',      TEMP_PATH . 'signal.dat');          // シグナルファイル
        define('PHPSESSID',        '_S_S_I_D_');                       // PHPSESSID
        define('D_MODE',           0644);                              // ディレクトリのパーミッション
        define('F_MODE',           0755);                              // ファイルのパーミッション

        define('REMOVE',           1);                                 // 削除

        //ライブラリパス指定
        $dir = __FILE__;

        for($si=0;$si<10;$si++){

            $dir = dirname($dir);

            if(is_dir($libDir = $dir . DS . $this->_libName)){

                define('LIB_PATH', $libDir);
                break;
            }
        }
        if(!defined('LIB_PATH')){
            throw new Exception('No LIB_PATH');
        }
    }

    /**
    * テンポラリーディレクトリ作成
    */
    private function _setTempDir()
    {
        if (!file_exists($cacheSavePath = TEMP_PATH . 'cache')) {
            mkdir($cacheSavePath);
            chmod($cacheSavePath, F_MODE);
        }
    }

    /**
     * ロケール設定
     */
    private function _setLocale()
    {
        setlocale(LC_ALL,         'ja_JP.UTF-8'); // ロケール
        date_default_timezone_set('Asia/Tokyo');  // タイムゾーン設定（php.ini::date.timezone = Asia/Tokyo）//America/Los_Angeles

        mb_language('Japanese');
        mb_internal_encoding('UTF-8');
    }

    /**
     * ファイル読み込み
     */
    private function _includeFiles()
    {
        // インクルードパス（ライブラリのパスをセット）
        ini_set('include_path',    LIB_PATH);

        require_once 'Geo/Debug.php';  // デバッグクラス・関数

        require_once 'Geo/Static.php'; // スタティッククラス staticClass::function();でアクセス（クラスの自動読み込み“__autoload()”含む））

        require_once  MODEL_PATH . 'metaModel.php';
    }

    /**
     * ユーザーエラーハンドラー・ユーザーシャットダウンハンドラー読み込み
     */
    private function _setErrorHandler()
    {
        if(ini_get('display_errors') == 0){
            //set_error_handler("userErrorHandler", E_ALL ^ E_NOTICE);
            register_shutdown_function( 'userShutdownHandler' );
        }
    }

    /**
     * ユーザー情報の更新チェックと再読込
     */
    private function _checkChanged()
    {
        require_once MODEL_PATH . 'authModel.php';
        $authModel = new authModel;
        $authModel->checkUpdate();
    }

    /**
     * クライアント情報
     */
    private function _setClient()
    {
        $this->_client = new Geo_Client; //クライアントオブジェクト生成
    }

    /**
     * 設定値取得
     */
    private function _setConfig()
    {
        try {

            $this->_config = new Zend_Config_Ini(ROOT . '/config/config.ini', $_SERVER['HTTP_HOST'], array('allowModifications'=>true));

        } catch (Zend_Config_Exception $e) {

            $this->_config = new Zend_Config_Ini(ROOT . '/config/config.ini', 'production', array('allowModifications'=>true));
        }

        //開発モードの場合
        if($this->_config->display->app_error){

            global $DEBUG_MODE;
            $DEBUG_MODE = 1;
        }

        Zend_Registry::set('config',  $this->_config);
    }

    /**
     * セッション開始
     */
    private function _sessionStart()
    {
        ini_set('session.gc_probability', 1);
        ini_set('session.gc_divisor', 1000);
        ini_set('session.name', PHPSESSID);
        ini_set('session.gc_maxlifetime', 24 * 60 * 60);//24ｈ

        if (!file_exists($sessionSavePath = TEMP_PATH . 'session')) {
            mkdir($sessionSavePath);
            chmod($sessionSavePath, F_MODE);
        }

        session_save_path($sessionSavePath);

        //携帯端末対応の場合
        if ($this->_config->mobilesite) {

            $this->_setClient(); //クライアントオブジェクト生成

            //携帯端末でクッキーが利用できない場合
            if ($this->_client->uaType == 'mobile' && !$this->_client->acceptCookie) {

                //ini_set
                Zend_Session::setOptions(array('use_trans_sid'    => 1,
                                               'use_cookies'      => 0,
                                               'use_only_cookies' => 0));
                define('USE_TRANS_SID', '1'); //!important;

                if (!empty($_REQUEST[PHPSESSID])) {
                    session_id($_REQUEST[PHPSESSID]);
                }
            }
        }

        //セッション
        if (!$sessionSpaceName = $this->_config->session_name) {
            $sessionSpaceName = 'app';
        }
        $this->_session = new Zend_Session_Namespace($sessionSpaceName);      // セッション名前空間定義

        //クッキーに保存したユーザー固有値をマージ
        //$this->_session->userConfig ='';
        //$this->_session->userConfig = array_merge((array)$this->_session->userConfig, (array)unserialize($_COOKIE['ucfg']));

        if ($this->_config->mobilesite) {

            if ($this->_client->isIe6()) {
                $this->_session->ie6 = true;
            }
        }

        $this->_session->client = $this->_client; //セッションにクライアントオブジェクトをセット

        Zend_Registry::set('session', $this->_session);

        //ユーザー情報に変更があったらセッションのユーザー情報更新
        $this->_checkChanged();

        //メタテーブルより追加設定値取得・レジストリにセット
        metaModel::setMetaConfig($this->_config, 1);

        //セッションに時間制限がある場合
        if ($this->_session->setExpiration) {

            //セッション継続時間セット
            if (!$sessionTerm = $this->_config->meta->session_term) {
                $sessionTerm = 1;
            }

            //通常ログインの場合期限をセット（自動ログインの場合時間制限無し）
            $this->_session->setExpirationSeconds($sessionTerm * 60);
            Zend_Registry::set('session', $this->_session);
        }
    }

    /**
     * ロガーインスタンス生成
     *
     * EMERG   = 0;  // 緊急事態 (Emergency): システムが使用不可能です
     * ALERT   = 1;  // 警報 (Alert): 至急対応が必要です
     * CRIT    = 2;  // 危機 (Critical): 危機的な状況です
     * ERR     = 3;  // エラー (Error): エラーが発生しました
     * WARN    = 4;  // 警告 (Warning): 警告が発生しました
     * NOTICE  = 5;  // 注意 (Notice): 通常動作ですが、注意すべき状況です
     * INFO    = 6;  // 情報 (Informational): 情報メッセージ
     * DEBUG   = 7;  // デバッグ (Debug): デバッグメッセージ
     */
    private function _setLogger()
    {
        global $LOGGER;

        //設定ファイル読み込み
        try {
            $this->_logConfig = new Zend_Config_Ini(APP_ROOT . '/config/log.ini', $_SERVER['HTTP_HOST'], array('allowModifications'=>true));

        } catch (Zend_Config_Exception $e) {

            $this->_logConfig = new Zend_Config_Ini(APP_ROOT . '/config/log.ini', 'production', array('allowModifications'=>true));
        }

        foreach($this->_logConfig->log as $logCongfig){

            if(dirname($logCongfig->writerParams->stream) != '.' && is_dir(dirname($logCongfig->writerParams->stream))){

            } else {
                $logCongfig->writerParams->stream = APP_ROOT . '/log/' . $logCongfig->writerParams->stream;
            }
        }

        //メールオブジェクト（指定しない場合はデフォルトでZend_Mailになります）
        //$this->_logConfig->log->mail->writerParams->mail = new Geo_Mail();

        //ロガーインスタンス
        $this->logger = Geo_Log::factory($this->_logConfig->log);

        //ステータスコード404エラー時のプライオリティ追加
        $this->logger->addPriority('HTTP404', 8);

        //ステータスコード405エラー時のプライオリティ追加
        $this->logger->addPriority('HTTP403', 9);

        //CLI用のプライオリティ追加
        $this->logger->addPriority('CLI', 10);

        //ロガーインスタンスをレジストリにセットする。
        Zend_Registry::set('logger', $this->logger);

        $LOGGER = $this->logger;
    }

    /**
     * アプリケーション実行
     */
    private function _run()
    {
        //ヘルパーのパス指定
        Zend_Controller_Action_HelperBroker::addPrefix('Geo_Controller_Action_Helper');
        //アプリケーションを実行する（自動レンダリングモードOFF）
        $FRONT = Zend_Controller_Front::getInstance()->setParam('noViewRenderer',true);
        //プラグイン登録
        $FRONT->registerPlugin(new Geo_Controller_Action_Plugin_Default());
        //アプリケーション実行
        Zend_Controller_Front::run(ROOT . DS . 'controllers');
    }
}
