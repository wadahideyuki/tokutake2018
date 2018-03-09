<?php
/**
 * @category   App
 * @package    Controller
 */
class ProductController extends Geo_Controller_Action
{
    /**
     * コントローラ名
     *
     * @var str コントローラ名
     */
    protected $_controllerTitle = '施工事例';

    /**
     * このコントローラーで読み込むレジストリ
     *
     * @var array レジストリ名を配列で指定
     */
    protected $_registries   = array();

    /**
     * このコントローラーで使用するモデル
     *
     * @var array モデル名を配列で指定
     */
    protected $_uses         = array('product');

    /**
     * このコントローラーで使用するヘルパー
     *
     * @var array ヘルパー名を配列で指定
     */
    protected $_helpers      = array('Resizeup', 'Fileup');

    /**
     * このコントローラーのリソース
     *
     * @var array [アクションメソッド名=>リソース名]の連想配列で指定
     * 　         defaultはデフォルト値として、未指定のすべての
     *            アクションメソッドに適用されます。
     */
    protected $_aclResources = array('default' => 'D3Page',
                                     'listup'  => 'D1Page',
                                     'detail'  => 'D1Page',
                                     'index'   => 'D1Page',
                                     'file'    => 'D1Page'
                                    );
    /**
     * このコントローラーでSSLを利用するリソース
     *
     * @var array [アクションメソッド名=>bool]の連想配列で指定　defaultはデフォルト値として、未指定のすべてのアクションメソッドに適用
     */
    protected $_sslRequirements = array('default' => true,
                                        'index'   => false,
                                        'listup'  => false,
                                        'detail'  => false,
                                        'file'    => false
    );

    /**
     * このコントローラーのキャッシュコントロール
     *
     * クライアントのブラウザやプロキシのキャッシュ制御条件を設定します
     * 設定例：
     * 'listup'  => 'public:3600'   //この場合、listupアクションは １時間有効のpublicキャッシュコントロール指定となる
     * 'detail'  => 'private:86400' //この場合、detailアクションは 24時間有効のprivateキャッシュコントロール指定となる
     * 'default' => 'no-cache'      //アクション別の指定がない場合のデフォルトは、no-cache
     * @var array [アクションメソッド名=>キャッシュコントロール名]の連想配列で指定　defaultはデフォルト値として、未指定のすべてのアクションメソッドに適用
     */
    protected $_cacheControls = array('default' => 'no-cache');

    /**
     * このコントローラーのページキャッシュ
     *
     * アクションにキャッシュ指定がある場合、コントローラ基底クラスでのビューインスタンス生成時に
     * キャッシュ生成指示を出します。
     * （※ページキャッシュ機能が利用できるのは、テンプレートが「アクション名.tpl」の場合のみとなります）
     * 設定例：
     * 'listup'  => '3600'      //この場合、listupアクションは、１時間有効のページキャッシュで表示される
     * 'detail'  => '-1'        //この場合、detailアクションは、二度目の表示以降ずっとページキャッシュで表示される
     * 'default' => 'no-cache'  //アクション別の指定がない場合のデフォルトは、no-cache
     * @var array レンダリング後のページキャッシュ制御設定
     */
    protected $_pageCache     = array('default' => 'no-cache');

    /**
     * コントローラーのデフォルトアクション
     *
     * アクションの指定なしでアクセスした場合のデフォルトアクション。
     * 未指定の場合はindexActionがデフォルトです。
     *
     * @var string
     */
//    protected $_index         = 'index';
    protected $_index         = 'listup';

    /**
     * 初期化処理
     */
    public function init()
    {
        parent::init();

        $this->_Nimg = $this->config->meta->product_images;
        $this->_getImages($this->_Nimg);
    }

    /**
     * リスト（管理者）
     * ：
     */
    public function listAction()
    {
        $this->_extractRedirect();
        $this->_setRequestUrl(); //このURLを記憶（$_SERVER['REQUEST_URI']）
        $this->view->value = $this->defaultModel->getList($this->_getAllParams(), $this->_presetParam('rows', $this->config->meta->list_rows, $this->reqController . '_' . $this->reqAction));

        return $this->_render();
    }

    /**
     * 編集（管理者）
     * ：
     */
    public function editAction()
    {
        $this->_setViewValue($this->defaultModel->read($this->_getId()),         // 編集の場合の値
                             array('top'=>'1','newmark'=>'1','status'=>'1'),     // 新規の場合のプリセット値
                             array('imageup','fileup','delimage','delfile','caption'), 1); // 除外アクション（指定されたアクションの場合、パラメータをそのまま保持する）
        $this->_setRequestUrl(); //このURLを記憶

        return $this->_render('edit.tpl');
    }

    /**
     * インデックス・タイプ(speciality)別（ユーザー）
     * ：
     */
    public function indexAction()
    {
        foreach($this->view->metafile['product_specialities'] as $key=>$sp){

            //6(シーン別)は除外する
            if($key == 6){
                break;
            }

            $param = array('speciality_' . sprintf('%02d', $key) => 1,
                           'status'=>1
            );

            if($this->defaultModel->getList($param)){

                $specialities[$key] = $sp;
            }
        }

        $this->view->specialities = $specialities;

        //名称（シーン名）一覧を取り出してビューに入れる
        $scene = $this->defaultModel->getList(array('status'=>1, 'order'=>'created', 'speciality_06'=>1));
        //画像追加
        $this->_addImage($scene);
        $this->view->scene = $scene;

        //サンプルテンプレートで出す
        if($this->_getParam('sample')){
            return  $this->_render('index_sample.tpl');
        }
        return $this->_render();
    }

    /**
     * リスト（ユーザー）
     * ：
     */
    public function listupAction()
    {
        //カテゴリ指定がある場合
        if($this->_getParam('category')){
            $this->_setParam('speciality_' . sprintf('%02d', $this->_getParam('category')), '1');
        }

        $this->_setParam('status', '1');
        $this->_setParam('order', 'created');
        $values = $this->defaultModel->getList($this->_getAllParams(), $this->config->meta->product_list);

        //画像追加
        $this->_addImage($values);
        $this->view->values = $values;

        //カテゴリ名
        $this->view->_category_name = $this->view->metafile['product_specialities'][$this->_getParam('category')];

        return $this->_render();
    }

    /**
     * 各レコードにメイン画像追加
     * ：
     */
    private function _addImage(&$values)
    {
        foreach($values as &$value){

            if(file_exists(DOCUMENT_ROOT . '/images/' . $this->controller . '/' . $value['id'] . '/img1.jpg')){
                $value['img'] = APP_PATH . '/images/' . $this->controller . '/' . $value['id'] . '/img1.jpg';
            } else {
                $value['img'] = APP_PATH . '/images/' . $this->controller . '/noimage_s.jpg';
            }
            $this->defaultModel->col2arr($value, 'feature');
        }
    }

    /**
     * 編集（管理者）
     * ：
     */
    public function detailAction($preview=null)
    {
        $value = $this->defaultModel->read($this->_getId());

        if(!empty($value['status']) or $preview){

            $this->view->value = $value;
            $this->view->images = $this->ResizeupHelper->getDetailFilesCapt($this->imageBaseDir . DS . $this->_getParam('id'), $this->_Nimg);

            //次の家・前の家
            $param = array('stattus'=>1);

            if($this->_getParam('category')){
                $param['speciality_' . sprintf('%02d', $this->_getParam('category'))] = 1;
            }

            $this->view->next = $this->defaultModel->getNext($this->_getId(), 'id', $param);
            $this->view->prev = $this->defaultModel->getPrev($this->_getId(), 'id', $param);

            if($this->_getParam('category') == 6){
                return $this->_render('scene.tpl');
            }

            return $this->_render('detail.tpl');

        } else {

            return $this->_notFound();
        }
    }

    /**
     * previewAction
     *
     * プレビュー表示（管理者）
     * 管理者は、その記事が表示/非表示にかかわらずプレビュー表示できる
     */
    public function previewAction()
    {
        return $this->detailAction('preview');
    }

    /**
     * imageupAction
     *
     * 画像アップ
     */
    public function imageupAction()
    {
        //画像サイズ指定
        $imagesSize  = $this->config->meta->product_image_size;
        $imagesSSize = $this->config->meta->product_image_s_size;

        //画像アップ（一枚ずつ送信）
        $this->ResizeupHelper->uploadFiles($this->imageBaseDir . DS . $this->_getDir(),        // ファイルフォルダ
                                           array(100000  . 'x' . $imagesSize => '',
                                                 100000 . 'x' . $imagesSSize => '_s',
                                                 100000 . 'x' . 100000 => '_l')); // 指定縮小サイズと拡張子

        $this->view->error     = $this->ResizeupHelper->getError();
        $this->_getImages($this->_Nimg);
        $this->view->scroll_to = 'imageUp';
        $this->editAction();
        return;
    }

    /**
     * delimageAction
     *
     * 画像削除
     */
    public function delimageAction()
    {
        $this->ResizeupHelper->delfile($this->imageBaseDir . DS . $this->_getDir(), $this->_getParam('param1')); //ファイル削除

        $this->_getImages($this->_Nimg);
        $this->view->scroll_to = 'imageUp';
        $this->editAction();
        return;
    }

    /**
     * captionAction
     *
     * キャプション登録
     */
    public function captionAction()
    {
        $caption = $this->_getParam('caption' . $this->_getParam('param1'));

        @file_put_contents($this->imageBaseDir . DS . $this->_getDir() . DS . 'img' . $this->_getParam('param1') . '.dat', $caption);

        $this->_setParam('param1', '');
        $this->_getImages($this->_Nimg);
        $this->view->scroll_to = 'imageUp';
        $this->editAction();
        return;
    }

    /**
     * saveAction
     *
     * 新規登録/編集
     */
    public function saveAction()
    {
        //バリデータスタート
        $this->setValidate();

        //バリデーションエラーの場合=false
        if(!$this->doValidate()){

            if($this->_getParam('param1') == 'confirm'){
                $this->_setParam('param1', null);
            }
            $this->_getImages($this->_Nimg);

            $this->_forward('edit');
            return;
        }

        //確認プロセス
        $this->_nextStep(); //引数は戻り先アクション //_nextStep()を画像表示用にオーバーロード

        // 情報保存
        if(!$id = $this->defaultModel->save($this->validData)){

            return $this->_back('登録できませんでした。', 'list');
        }

        //画像・ファイルアップ臨時フォルダをリネーム
        if ($tempDir = $this->_getParam('tempdir')) {

            //画像フォルダ名変更
            if (file_exists($this->imageBaseDir . DS . $tempDir)) {

                rename($this->imageBaseDir . DS . $tempDir,
                $this->imageBaseDir . DS . $id);
            }
        }

        return $this->_back('登録しました。', 'list');
    }

    /**
     * deleteAction
     *
     * 削除
     */
    public function deleteAction()
    {
        if (!$row = $this->defaultModel->read($id = $this->_getId())) {

            return $this->_notFound();
        }

        // 削除
        if ($id = $this->defaultModel->del($id)) {

            //画像削除
            $this->ResizeupHelper->deleteDir($this->imageBaseDir . DS . $id);
            return $this->_back('削除しました。', 'list');

        } else {

            return $this->_back('削除できませんでした。', 'list');
        }

    }

    /**
     * ファイル取得
     *
     * @param int    $files アップロードできるファイル数の上限
     * @param string $dir アップロードするベースディレクトリ（フルパス）※指定しなければデフォルトのディレクトリ
     */
    protected function _getImages($files, $dir=null)
    {
        if ($this->_getParam('param1') === 'confirm') {
            //確認モードの場合
            $confirm = 'confirm';
        } else {
            $confirm = false;
        }

        //画像アップパス（ドキュメントルートからのパスとルートからのパス）
        $this->imageDir     = DS . 'images' . DS . $this->controller . DS . $this->_getDir();
        $this->imageBaseDir = APP_DIR  . DS . 'images' . DS . $this->controller; //画像ディレクトリパス
        $this->view->images = $this->ResizeupHelper->getFilesForm($this->imageDir, $confirm, $files, null,1,1);
    }
}
