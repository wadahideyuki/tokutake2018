<?php
/**
 * WordPress の基本設定
 *
 * このファイルは、インストール時に wp-config.php 作成ウィザードが利用します。
 * ウィザードを解ｸにこのファイルを "wp-config.php" という名前でコピーして
 * 直接編集して値を入力してＤまいません。
 *
 * このファイルは、以下の設定を含みます。
 *
 * * MySQL 設定
 * * 碑ｌｮ
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

// ** MySQL 設定 - この情報はホスティング数Yら入手してください。 ** //
/** WordPress のためのデータベース名 */
define('DB_NAME', 'wp2');

/** MySQL データベースのユーザー名 */
define('DB_USER', 'root');

/** MySQL データベースのパスワード */
define('DB_PASSWORD', '');

/** MySQL のホスト名 */
define('DB_HOST', 'localhost');

/** データベースのテーブルを作成する際のデータベースの文字セット */
define('DB_CHARSET', 'utf8mb4');

/** データベースの照合順序 (ほとんどの場合変更する必要はありません) */
define('DB_COLLATE', '');

define('WP_ALLOW_MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);
define('DOMAIN_CURRENT_SITE', 'local.tokutake-kensetsu.co.jp');
define('PATH_CURRENT_SITE', '/blog/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);
define('WP_ALLOW_REPAIR', true);
/**#@+
 * 認証用ユニークキー
 *
 * それぞれを異なるユニーク (一意) な文字列に変更してください。
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org の碑ｌｮサービス} で自動生成すらｷともできます。
 * 後でいつでも変更して、既存のすべての cookie を無効にできます。これにより、すべてのユーザーを強制的に再ログインさせらｷとになります。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '$_3Tmt~;zqN#s8k.48Pupb`+&cYHRznK8;*ty DvUz-v(T_%o?Cc|GL[G@H4X#JC');
define('SECURE_AUTH_KEY',  '+V2X&d4#L&$^QtByFJ05yR<lIn2 {Iqc8; =KTVr;nMxtNr%t #v`J6Q}5q[wSGz');
define('LOGGED_IN_KEY',    '?p}Qsbb2+Fe/Sv v}H8-Mzup9U+X_l|La./NN-;]{rMIaBkJ.SZKXvvQZ=M?D,!W');
define('NONCE_KEY',        '{f2Odga1R_)%o9SZ~[W}qkMMQykll!t0d;9r[,cudgCsYE?*2g8`wI%:l#4OF<<o');
define('AUTH_SALT',        'wik-Qm]%bWQN|cD(q7Rs2ITHMo=s#JK;f$YPw,BYw**V@`q2VoTvM]>qsB}mZrw#');
define('SECURE_AUTH_SALT', 'Gi@C{|L/]Br(xnH2_X(JM5OX~))1r%/$luxISOh1TI7~?2 Xg9]fS_Ekv&xZk8Xz');
define('LOGGED_IN_SALT',   'aF8Todf$k3} HTrYv$BCM[Il-irr(TD^0nMZ]`tjsEBM4<[0ap82(q D~IPN1r)0');
define('NONCE_SALT',       '[!!ZvQuC==t5prJF&?% OTLcNw:w.K=o|+{,.(aK7Uw7WQ/r>%W9xsj1<7A]BfkE');

/**#@-*/

/**
 * WordPress データベーステーブルの接頭辞
 *
 * それぞれにユニーク (一意) な接頭辞を与えらｷとで一つのデータベースに複数の WordPress を
 * インストールすらｷとができます。半角英数字と下線のみを使用してください。
 */
$table_prefix  = 'wp_';

/**
 * 開発者へ: WordPress デバッグモード
 *
 * この値を true にすると、開発中に注意 (notice) を表示します。
 * テーマおよｄ・ラグインの開発者には、その開発環境においてこの WP_DEBUG を使用すらｷとを強く推奨します。
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
