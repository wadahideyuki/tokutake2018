<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		{if $_fixedTitle}
		<title>{$_fixedTitle|escape}</title>
		{else}
		<title>{if $_subTitle}{$_subTitle|replace:'<br />':''|escape} | {/if}{if $_title}{$_title|escape} | {/if}うれし徳武建設株式会社{if $param.controller == 'index' && $param.action == 'index'} | 長野で木の家を注文住宅で建てる地元工務店{/if}</title>
		{/if}
		<meta name="keywords" content="長野市・須坂市・小布施町・中野市・千曲市周辺エリアを中心に木の家注文住宅を建てています。木曽桧・北信杉材・無垢材・モイス・自然塗料・エコ素材で健康住宅を、長期優良住宅・低炭素住宅・リノベーションで長持ちするエコな家を、ＯＭソーラーシステムと太陽光発電で省エネルギー・ゼロエネルギー住宅を提案します。" />
		<meta name="description" content="{if $_description}{$_description|escape}{else}長野市・須坂市・小布施町・中野市・千曲市周辺エリアを中心に木の家注文住宅を建てています。木曽桧・北信杉材・無垢材・モイス・自然塗料・エコ素材で健康住宅を、長期優良住宅・低炭素住宅・リノベーションで長持ちするエコな家を、ＯＭソーラーシステムと太陽光発電で省エネルギー・ゼロエネルギー住宅を提案します。{/if}" />
		{if $session.viewType == 'pc'}
		{else}
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
		{/if}
		<link rel="shortcut icon" href="{$appPath}/favicon.ico" />
{*
		<link rel="apple-touch-icon" href="{$appPath}/apple-touch-icon.png" />
*}
		<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />

		<link rel="stylesheet" href="{$appPath}/css/reset.css" />
		<link rel="stylesheet" href="{$appPath}/css/slick.css" />
		<link rel="stylesheet" href="{$appPath}/css/slick-theme.css" />
		<link rel="stylesheet" href="{$appPath}/css/layout.css" />
		<link rel="stylesheet" href="{$appPath}/css/style.css" />
		<link rel="stylesheet" href="{$appPath}/css/class.css" />
		{if $meta.info_rss_generate_1}
		<link rel="alternate"  type="application/rss+xml" title="徳武建設株式会社　新着情報 (RSS1.0)"  href="{$baseUrl}{$appPath}{$meta.info_rss_filepath_1}.rdf" />
		<link rel="alternate"  type="application/rss+xml" title="徳武建設株式会社　新着情報 (RSS2.0)"  href="{$baseUrl}{$appPath}{$meta.info_rss_filepath_1}.xml" />
		<link rel="alternate"  type="application/rss+xml" title="徳武建設株式会社　新着情報 (ATOM1.0)" href="{$baseUrl}{$appPath}{$meta.info_rss_filepath_1}.atom.xml" />
		{/if}
		
{literal}
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-58771457-1', 'auto');
		ga('require', 'linkid', 'linkid.js');
		ga('send', 'pageview');

	</script>
	
{/literal}
	</head>
	<body id="pagetop">

		<!-- header_wrapper //-->
		<div class="header_wrapper">

			<!-- header //-->
			<header class="cf">
				<div class="inner">
					{if $param.controller == 'index' && $param.action == 'index'}<h1 class="homepage">{/if}
					<a href="{$appPath}/" class="logo"><img src="{$appPath}/img/logo.png" alt="長野市で新築、注文住宅、木の家建てるならうれし徳武建設です" width="100%" /></a>
					{if $param.controller == 'index' && $param.action == 'index'}</h1>{/if}
					<div class="headInfo">
						<p class="catch_phrase">長野県で注文住宅の木の家工務店 県産材で木造住宅　OMソーラーでゼロエネルギー住宅</p>
						<ul class="contact">
							<li class="phone">
								<div class="pcBrows">
									<div><span>TEL</span><em>026-265-6166</em></div>
									<small>受付時間：9:00～18:00</small>
								</div>
								<div class="spDevice"><a href="#"><img class="imgover" src="{$appPath}/img/sp_hd_btn_tel.png" width="100%" alt="TEL" /></a></div>
							</li>
							<li>
								<a href="{$appPath}/mail/form/?id=inquiry">
									<span class="pcBrows"><img class="imgover" src="{$appPath}/img/contact.png" alt="資料請求・お問い合わせ" /></span>
									<span class="spDevice"><img src="{$appPath}/img/sp_hd_btn_contact.png" width="100%" alt="資料請求・お問い合わせ" /></span>
								</a>
							</li>
							<li class="spBtnMenu"><a href="#"><img src="{$appPath}/img/sp_hd_btn_menu.png" width="100%" alt="MENU" /></a></li>
						</ul>
					</div>
				</div>
			</header>
			<!-- /header //-->

			<!-- navigation //-->
			<nav class="navMain posHd">
				<div class="inner">
					<ul>
						<li class="product"><a href="{$appPath}/lineup/"  ><span>商品ラインナップ</span></a></li>
						<li class="product"><a href="{$appPath}/product/"><span>施工事例</span></a></li>
						<li class="builder"><a href="{$appPath}/housing/" ><span>うれし徳武いえづくり</span></a></li>
						<li class="aboutus" ><a href="{$appPath}/event/listup/"  ><span>見学会・セミナー</span></a></li>
						<li class="aboutus" ><a href="{$appPath}/voice/listup/"  ><span>お客様の声</span></a></li>
						<li class="voice"><a href="{$appPath}/reform/" ><span>リフォーム</span></a></li>
						<li class="process"><a href="{$appPath}/design/"><span>店舗デザイン</span></a></li>
						<li class="process"><a href="{$appPath}/faq/"><span>よくある質問</span></a></li>
						<li class="blog"><a href="{$appPath}/company/"><span>会社情報</span></a></li>
					</ul>
				</div>
			</nav>
			<!-- /navigation //-->

		</div>

		<!-- container //-->
		<div class="container clearfix">
