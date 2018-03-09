{include file='../adminHeader.tpl' _title='403 Forbidden'}

<div id="contentContainer">
	<div id="content">
		<div id="pageHeaderTitle">
			このページへはアクセスできません
		</div>
		<div class="pageContents">
			<p>
				あなたのユーザー権限ではこのページの表示は認められていません。
			</p>
			<div class="btn">
				<input type="button" value="トップページへ" onClick="location.href='{$basePath}{$appPath}/';"　/>
				<input type="button" value="戻　る"         onClick="javascript:history.back();" />
			</div>
		</div>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}
