{include file='../adminHeader.tpl'}

	<div id="contentContainer">
		<div id="content">

			{include file='usage_menu.tpl'}

			<div class="pageContents">

				<div class="editForm">
					<table>
						<tbody>
							<tr class="topHead">
								<th class="topleft">{qry_link col='user_id'     alt='ユーザー'}</th>
								<th>
									{qry_link col='created'     alt='アクセス日時'} /
									{qry_link col='login_ip'    alt='IP'} /
									{qry_link col='remote_host' alt='REMOTE HOST'} /
									{qry_link col='user_agent'  alt='USER AGENT'}
								<th>{qry_link col='login_key'   alt='自動ログイン'}</th>
								<th>{qry_link col='login_mov'   alt='携帯アクセス'}</th>
								<th class="ctr topright">操作</th>
							</tr>

					{foreach from=$users item=user}

							<tr class="{cycle values='odd,even'}">
								<td>
									<a href="{$appPath}/user/edit/?id={$user.user_id}">{$user.user_name|escape}</a>
								</td>
								<td>
									{$user.created|date_format:'Y年m月d日H時i分s秒'}<br />
									{$user.login_ip|escape|cat:'/'}{$user.remote_host|escape}<br />
									{$user.user_agent|escape}
								</td>
								<td class="ctr">
									{if $user.login_key}<img src="{$appPath}/images/sys/tick.png" />{/if}
								</td>
								<td class="ctr">
									{if $user.login_mov}<img src="{$appPath}/images/sys/tick.png" />{/if}
								</td>
								<td class="nowrap_ctr">
									<a href="{$appPath}/usage/deleteloginrecord/?id={$user.user_id|escape}" onclick="return diag('ユーザー名：{$user.user_name|escape}\nこのユーザーのすべてのログイン記録を削除してよろしいですか？')" class="delete">削除</a>
								</td>
							</tr>

					{foreachelse}

							<tr>
								<td colspan="10" class="nodata">
									現在ログインしているユーザーはいません。
								</td>
							</tr>

					{/foreach}

						</tbody>
					</table>
				</div>

				<div id="helpDescription">
					<div class="helpSpace">
						<ul>
							<li>※<a href="{$appPath}/admin/config/?type=login">ログイン設定</a>の「自動ログインの有効期限」で指定した時間が経過したレコードは当該のユーザーがログインした時点で自動的に削除されます。</li>
							<li>※レコードを削除すると、自動ログイン機能を利用していたユーザーは、次回のログイン時に自動ログインできなくなります。</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}