{include file='../adminHeader.tpl'}

{literal}
<script type="text/javascript">
<!--
    setInterval("gotoLoginLocation()", 2000);
    function gotoLoginLocation() {

        location.href='{/literal}{$sslBasePath}{$appPath}{literal}/auth/login/admin/moved/';
    }
//-->
</script>
{/literal}

<div id="contentContainer">
	<div id="content">

		<div id="pageHeaderTitle">
			パスワード更新
		</div>

		<div class="pageContents">
			パスワードを更新しました。ログインページに移動します。
			移動しない場合は<a href="{$appPath}/auth/login/admin/moved/">こちら</a>をクリック。
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}
