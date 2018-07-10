<?php
/**
 * @category   App
 * @package    Controller
 */
class IndexController extends Geo_Controller_Action
{
    /**
     * コントローラ名
     *
     * @var string コントローラ名
     */
    protected $_controllerTitle = '';

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
    protected $_uses         = array('rss', 'info', 'event', 'voice', 'product', 'faq');

    /**
     * このコントローラーで使用するヘルパー
     *
     * @var array ヘルパー名を配列で指定
     */
    protected $_helpers      = null;

    /**
     * このコントローラーのリソース
     *
     * @var array [アクションメソッド名=>リソース名]の連想配列で指定　defaultはデフォルト値として、未指定のすべてのアクションメソッドに適用
     */
    protected $_aclResources = array('default' => 'D1Page');


    /**
     * このコントローラーでSSLを利用するリソース
     *
     * @var array [アクションメソッド名=>bool]の連想配列で指定　defaultはデフォルト値として、未指定のすべてのアクションメソッドに適用
     */
    protected $_sslRequirements = array('default' => false);

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
    protected $_pageCache     = array('default' => 'no-cache', 'index' => '180'); // トップページは3分

    /**
     * 初期化処理
     */
    public function init()
    {
        //ページキャッシュを利用しない場合は parent::init() の前に $this->_pageCache を指定（正確にはparent::init()内のpreDispache()の前）
        if($this->_getParam('_reload')){
            $this->_pageCache = array('default' => 'no-cache');
        }

        // そのコントローラの $_delPageCache() にあるアクションを走らせると$this->view->delCache()が実行される
        //（デフォルト：'save', 'delete', 'imageup', 'delimage', 'fileup', 'delfile', 'caption'）
        // Smartyのページキャッシュをすべて削除する場合 → $this->view->delCache();

        parent::init();

        //キャッシュオブジェクト（RSS用）
        $fOptions['automatic_serialization'] = true;
        $fOptions['lifetime']                = 300; //５分(デフォルト値　RSSの実際のキャッシュ時間は管理画面から設定)
        $bOptions['cache_dir']               = TEMP_PATH . 'cache';
        $this->_cache = Zend_Cache::factory('Core', 'File', $fOptions, $bOptions);
    }

    /**
     * トップページ
     *
     */
    public function indexAction()
    {
        //?_reload=1 とするとブログRSS含めすべてリロード
        if($this->_getParam('_reload')){
           $this->view->delCache();
           $_blogCacheTime  = 0;
           $_mBlogCacheTime = 0;

        } else {

            if(!$_blogCacheTime = $this->config->meta->blog_cache){
                $_blogCacheTime = 300; //５分
            }
            if(!$_mBlogCacheTime = $this->config->meta->maintenance_blog_cache){
                $_mBlogCacheTime = 300; //５分
            }
        }

        //イベント（3.イベント 4.見学会 5.勉強会のうち近いものから）
        $this->view->_events = $this->eventModel->getFutureEventList(array('status'=>'1', 'top'=>'1', '_event_type'=>'2'), $this->config->meta->event_top);

        //杜の家カレンダー（1.カルチャー 2.展示 のうち近いものから）
        $this->view->_calendar = $this->eventModel->getFutureEventList(array('status'=>'1', 'top'=>'1', '_event_type'=>'1'), $this->config->meta->event_top);

        //News
        $this->view->_infos = $this->infoModel->getList(array('status'=>'1', 'order'=>'created:d id:d'), $this->config->meta->info_top_1);

        //施工事例カテゴリ（データのあるもののみ）
        $this->view->_specialities = $this->_getProductSp();

        //お客様の声
        $this->view->_voices = $this->voiceModel->getList(array('status'=>'1', 'order'=>'created:d id:d'), $this->config->meta->voice_top);

        //代表ブログ
        $this->view->_blog = $this->_fetchRss($this->config->meta->blog_rss_url, //設定機能に追加
                                               array(),
                                               $_blogCacheTime); //キャッシュ時間（秒）1800秒 = 30分

        //よくあるご質問（カテゴリ）
        $this->view->_faq_categories = $this->_getFaqCate();

        //メンテナンスブログ
        $this->view->_maintenance_blog = $this->_fetchRss($this->config->meta->maintenance_blog_rss_url, //設定機能に追加
                                                          array(),
                                                          $_mBlogCacheTime); //キャッシュ時間（秒）1800秒 = 30分
        //生成時刻
        $this->view->_cacheTime = date('Y-m-d H:i:s');

        if($this->_getParam('sample')){
            return  $this->_render('sample.tpl');
        }

        return $this->_render();
    }

    //FAQカテゴリ（データのあるもののみ）
    private function _getFaqCate()
    {
        if($values = $this->faqModel->getList(array('status'=>'1', 'action'=>'listup'))){

            //カテゴリ別にまとめる
            foreach($values as &$value){
                $sortValue[$value['type']][] = $value;
            }

            //情報のあるカテゴリを列挙
            foreach($sortValue as $key=>$val){
                $categories[$key] = $this->view->metafile['faqs'][$key];
            }
        }

        return $categories;
    }

    //施工事例カテゴリ（データのあるもののみ）
    private function _getProductSp()
    {
        foreach($this->view->metafile['product_specialities'] as $key=>$sp){

            $param = array('speciality_' . sprintf('%02d', $key) => 1,
                    'status'=>1
            );

            if($this->productModel->getList($param)){

                $specialities[$key] = $sp;
            }
        }

        return $specialities;
    }

    /**
     * RSSの取得
     * トップページ用
     *
     */
    private function _fetchRss($url, $params, $cacheTime=1800, $items=5)
    {
        //キャッシュ寿命の再セット
        $cacheTime += rand(-(ceil($cacheTime / 2)), ceil($cacheTime / 2));
        $this->_cache->setLifetime($cacheTime);

        //ここでURLとパラメータが一致するキャッシュを確認・取得
        if($result = $this->_cache->load(md5($url . http_build_query($params)))){

            return $result;

        } else {

            $result = $this->rssModel->getFeed(array('url'=>$url, 'items'=> $items));
            $this->_cache->save($result, md5($url . http_build_query($params)));

            return $result;
        }
    }

}