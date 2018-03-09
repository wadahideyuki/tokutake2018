{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		<div id="pageHeaderTitle">
			パスワード再設定
		</div>

		<div class="pageContents">
			このURLは無効です。
			パスワードを再設定する場合は、再度パスワードリセットを行ってください。
			<br />
			尚、パスワードアシスタンスのメールを受け取りましたら、すぐにパスワードの再設定を行ってください。
			<div class="btn">
				<input type="button" value="パスワードリセット" onClick="location.href='{$basePath}{$appPath}/auth/forgot/';" />
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}
