<?php
/*
 * @category Page エラーページ
 */

    error_reporting(0);
    ini_set('display_errors', 'Off');

    search_dir('lib', 'LIB_PATH');
    search_dir('app', 'APP_ROOT');

    ini_set('include_path', LIB_PATH);

    require_once 'Geo/Debug.php';                  // デバッグクラス・関数
    require_once 'Geo/Static.php';                 // スタティッククラス staticClass::function();でアクセス（クラスの自動読み込み“__autoload()”含む））
    require_once 'Smarty/libs3/Smarty.class.php';  // オートロード不可のため記載必須
    spl_autoload_register('__autoload');

    ini_set('session.name', '_S_S_I_D_');          // フロントコントローラで指定しているセッション名と同じものを指定
    session_save_path(APP_ROOT . '/tmp/session/'); // フロントコントローラで指定しているセッション保存パスと同じものを指定
    session_start();

    $_smarty = new Smarty;
    $_smarty->setPluginsDir(LIB_PATH   . '/Geo/View/userplugins');
    $_smarty->addPluginsDir(SMARTY_DIR . 'plugins');
    $_smarty->setTemplateDir(APP_ROOT  . '/views/pc/ja/error/');
    $_smarty->compile_dir  = APP_ROOT  . '/tmp/smarty_compile_err/';

    $_smarty->assign('session', $_SESSION['app']);
    $_smarty->assign('title',   'エラー');
    $_smarty->assign('message', $_SESSION['app']['error_msg']);
    
    if(dirname($_SERVER['SCRIPT_NAME']) == '/'){
        $_smarty->assign('appPath', '');
    } else {
        $_smarty->assign('appPath', dirname($_SERVER['SCRIPT_NAME']));
    }

    if($exception = unserialize($_SESSION['app']['exception'])){

        $_smarty->assign('exception_file',  $exception->getFile());
        $_smarty->assign('exception_line',  $exception->getLine());
        $_smarty->assign('exception_trace', $exception->getTraceAsString());
    }

    header('Content-Type: text/html; charset=UTF-8');
    echo $_smarty->fetch('error.tpl');

    function search_dir($dirName, $define) {

        $dir = __FILE__;

        for($si=0;$si<10;$si++){

            $dir = dirname($dir);

            if(is_dir($foundDir = $dir . '/' . $dirName)){

                define($define, $foundDir);
                break;
            }
        }
    }
