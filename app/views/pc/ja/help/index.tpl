{include file='../adminHeader.tpl' title='ヘルプ'}

	<div id="contentContainer">
		<div id="content">

			{include file='help_menu.tpl' active1='true'}

			<div class="pageContents">

				<ul class="pageMenu">
					<li>Zend Frameworkのバージョン：{$zend_varsion}</li>
					<li>ライブラリのバージョン：{$geo_varsion}</li>
					<li>デバッグモード：{if $display_app_error}ON{else}OFF{/if}</li>
				</ul>

				<iframe src="{$appPath}/help/phpinfo.html"></iframe>

					<ul>

						{foreach from=$users item=user}

							<li>
								{$user.filetime|date_format:'h時i分s秒'}
								<a href="{$appPath}/user/edit/?id={$user.userId}">{$user.userName}</a>　（{$user.within}以内）{$user.ff}秒前
							</li>

						{/foreach}

					</ul>

			</div>

		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}

