<?php
/**
 * WordPress の基本設定
 *
 * このファイルは、インストール時に wp-config.php 作成ウィザードが利用します。
 * ウィザードを介さずにこのファイルを "wp-config.php" という名前でコピーして
 * 直接編集して値を入力してもかまいません。
 *
 * このファイルは、以下の設定を含みます。
 *
 * * MySQL 設定
 * * 秘密鍵
 * * データベーステーブル接頭辞
 * * ABSPATH
 *
 * @link http://wpdocs.osdn.jp/wp-config.php_%E3%81%AE%E7%B7%A8%E9%9B%86
 *
 * @package WordPress
 */

// 注意:
// Windows の "メモ帳" でこのファイルを編集しないでください !
// 問題なく使えるテキストエディタ
// (http://wpdocs.osdn.jp/%E7%94%A8%E8%AA%9E%E9%9B%86#.E3.83.86.E3.82.AD.E3.82.B9.E3.83.88.E3.82.A8.E3.83.87.E3.82.A3.E3.82.BF 参照)
// を使用し、必ず UTF-8 の BOM なし (UTF-8N) で保存してください。

// ** MySQL 設定 - この情報はホスティング先から入手してください。 ** //
/** WordPress のためのデータベース名 */
define('DB_NAME', 'wp');

/** MySQL データベースのユーザー名 */
define('DB_USER', 'tokutake');

/** MySQL データベースのパスワード */
define('DB_PASSWORD', 'tokutake');

/** MySQL のホスト名 */
define('DB_HOST', 'localhost');

/** データベースのテーブルを作成する際のデータベースの文字セット */
define('DB_CHARSET', 'utf8mb4');

/** データベースの照合順序 (ほとんどの場合変更する必要はありません) */
define('DB_COLLATE', '');
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);
define('DOMAIN_CURRENT_SITE', 'www.tokutake-kensetsu.co.jp');
define('PATH_CURRENT_SITE', '/blog/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);

define('FS_METHOD','direct');
/**#@+
 * 認証用ユニークキー
 *
 * それぞれを異なるユニーク (一意) な文字列に変更してください。
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org の秘密鍵サービス} で自動生成することもできます。
 * 後でいつでも変更して、既存のすべての cookie を無効にできます。これにより、すべてのユーザーを強制的に再ログインさせることになります。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'z@8.LV&(qo,*QH^eui0sE*1/5*c@zY>yMaTj#b.q|BCx{FME!NTihM8/R8XW[f=e');
define('SECURE_AUTH_KEY',  '}isl+YvgADjVk7&u{%t8<T-1EWcmEc^fi=E7p z!2NTtQ;lo?*:%<Gum/@hz-fJx');
define('LOGGED_IN_KEY',    '_+T>KKl.UC*y1O~;CCDQRhU?y~/?OB7I;rgJm14>ZWsK-,wDZi^l4b>oerTPP4?*');
define('NONCE_KEY',        'E@@9b=aSFX>!5l~&(Qw<|OK{p1xk;m=3}i_;{G?9g6}yuLOj$GQ[U(i%#N($b]oq');
define('AUTH_SALT',        'd(aP-f^-ktulS)Q/U}nwV^k%fLy?ZZ%Bg85T+oFa8|Q,t9#nq5GTh%=,N!wHeQb,');
define('SECURE_AUTH_SALT', '<t~.m %iaG%IeWt,f;ad?X/Fh{@iw:&7{a%SJL`(L{hs8<=K6LI r+l0g:wr{4SZ');
define('LOGGED_IN_SALT',   'E|Gwe0a]JBKqovW0jCA!F}#& h@:4sM9t+dpb=?-ga c8TD(g7J+4tjpB~vCQ$<%');
define('NONCE_SALT',       'N7V8S,yTDy?ylg/7zl<iz7c{66tzN`8c$tC8(mp#apfk;6Tbs0t!q;$|Go^Z(G+B');

/**#@-*/

/**
 * WordPress データベーステーブルの接頭辞
 *
 * それぞれにユニーク (一意) な接頭辞を与えることで一つのデータベースに複数の WordPress を
 * インストールすることができます。半角英数字と下線のみを使用してください。
 */
$table_prefix  = 'wp_';

/**
 * 開発者へ: WordPress デバッグモード
 *
 * この値を true にすると、開発中に注意 (notice) を表示します。
 * テーマおよびプラグインの開発者には、その開発環境においてこの WP_DEBUG を使用することを強く推奨します。
 *
 * その他のデバッグに利用できる定数については Codex をご覧ください。
 *
 * @link http://wpdocs.osdn.jp/WordPress%E3%81%A7%E3%81%AE%E3%83%87%E3%83%90%E3%83%83%E3%82%B0
 */
define('WP_DEBUG', false);

/* 編集が必要なのはここまでです ! WordPress でブログをお楽しみください。 */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
