<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="ja" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
	<head>
		<meta name="robots"                    content="noindex,nofollow" />
		<meta http-equiv="Content-Type"        content="text/html; charset={$charset|escape|default:'UTF-8'}" />
		<meta http-equiv="Content-Language"    content="ja" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type"  content="text/css" />
		<meta http-equiv="imagetoolbar"        content="no" />
{if $cache_expires}
		<meta http-equiv="Expires"             content="{$cache_expires|escape}" />
{else}
		<meta http-equiv="Cache-Control"       content="no-cache" />
		<meta http-equiv="Pragma"              content="no-cache" />
		<meta http-equiv="Expires"             content="0" />
{/if}
		<link rel="stylesheet" type="text/css" href="{$appPath}/css/default_preset.css"       media="all" />
		<link rel="stylesheet" type="text/css" href="{$appPath}/css/default_admin_layout.css" media="all" />
{if $popup}
		<link rel="stylesheet" type="text/css" href="{$appPath}/css/default_admin_popup.css"  media="all" />
{/if}
		<link rel="stylesheet" type="text/css" href="{$appPath}/css/default_admin_print.css"  media="{if $param._print}all{else}print{/if}" />
{if $param._print}
		<link rel="stylesheet" type="text/css" href="{$appPath}/css/default_admin_print_preview.css"  media="screen" />
{/if}
		<link rel="stylesheet" type="text/css" href="{$appPath}/js/dialog/dialog_box.css" />

		<link rel="shortcut icon" href="{$appPath}/images/sys/favicon.ico" />
		<!--[if IE 6.0]>
			<link rel="stylesheet" type="text/css" href="{$appPath}/css/admin_ie6.css" media="all" />
		<![endif]-->

		{*
		<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.min.css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
		*}

		<link type="text/css" rel="stylesheet" href="{$appPath}/js/jquery-ui.min.css" />
		<script type="text/javascript" src="{$appPath}/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="{$appPath}/js/jquery-ui.min.js"></script>

		<script type="text/javascript" src="{$appPath}/js/utility.js"></script>
		<script type="text/javascript" src="{$appPath}/js/ui.datepicker-ja.js"></script>

		{literal}<style type="text/css"><!-- body {font-size:{/literal}{$font_size|default:'84'}{literal}%} --></style>{/literal}
		{dialogbox flashMsg=$flashMsg  msgType=$msgType}
		{scroll_to id=$scroll_to}
		<title>{$_title|escape|cat:'｜'}{$cName|escape}</title>
	</head>
	<body{if $param._print} onload="window.print();"{/if}>
		<div id="container">
			<!-- ページヘッダ -->
			<div id="pageHeader">
				<a href="{$appPath}/"><img src="{$appPath}/images/sys/logo.png" alt="{$cName|escape}" /></a>
				<div id="pageTitle">
					{if $session.login}{$systemTitle}{else}{$cName|escape}{/if}
				</div>
			</div>
			<!-- /ページヘッダ -->
