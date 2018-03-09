{include file='../adminHeader.tpl' _title='エラーログ'}

<div id="contentContainer">
	<div id="content">

		{include file='../help/help_menu.tpl' log='true'}

		<div id="subTabs" class="clearfix">
			<h4>ログ</h4>
			<ul>
				{foreach from=$logfiles item=log}
				<li{if $param.log == $log or (!$param.log && $log == 'error')} class="active"{/if}><a href="{$appPath}/error/log/?log={$log}"><span>{$log}</span></a></li>
				{/foreach}
			</ul>
		</div>

		<form action="{$appPath}/error/" method="post" name="extract">
			<div class="right_btn">
				<input type="hidden" name='logfile' value="{$logfile|escape}" />
				<input type="submit" value="ログ削除" name="_mode_error_logdelete_"/>
			</div>
		</form>

		<div class="pageContents">
			<pre>{$log_str}</pre>
		</div>

		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>※ログファイルは、/app/log/に保存されています。</li>
					<li>※ログファイルは、定期的に削除してください。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}