{include file='../adminHeader.tpl'}

	<div id="contentContainer">
		<div id="content">

			{include file='usage_menu.tpl'}

			<div class="pageContents">

      <form action="{$appPath}/usage/" method="post" name="extract">
        <div class="right_btn">
          <input type="submit" name="_mode_usage_logoutall_" value="全ユーザー強制ログアウト" />&nbsp;
        </div>
      </form>


				現在ログインしているユーザー：{$num|escape}名<br />

				<div class="editForm">
					<table>
						<tbody>
							<tr class="topHead">
								<th class="ctr topleft">ユーザー</th>
								<th>最終アクセス日時</th>
								<th class="ctr topright">操作</th>
							</tr>

					{foreach from=$users item=user}

							<tr class="{cycle values='odd,odd,odd,even,even,even'}">
								<td rowspan="3">
									<a href="{$appPath}/user/edit/?id={$user.userId}">{$user.userName|escape}</a>
								</td>
								<td>
									{$user.filetime|date_format:'Y年m年d月H時i分s秒'}（{$user.latestaccess|escape}前）
								</td>
								<td class="nowrap_ctr">
									<a href="{$appPath}/usage/logout/?id={$user.userId|escape}" onclick="return diag('本当に強制ログアウトしてよろしいですか？')" class="logout">強制ログアウト</a>
								</td>
							</tr>
							<tr class="{cycle values='odd,odd,odd,even,even,even'}">
								<td colspan="2">
									{$user.ua|escape}
								</td>
							</tr>
							<tr class="{cycle values='odd,odd,odd,even,even,even'}">
								<td colspan="2">
									{$user.userIp}/{$user.userHost|escape}
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
							<li>※現在ログインしているユーザーを表示しています。</li>
							<li>※[全ユーザー強制ログアウト] ボタンをクリックすると、ログイン中のユーザーのセッションを破棄し、全ての自動ログインキーも削除されます。但し、この操作を実行する管理ユーザーは対象外となります。</li>
							<li>※[強制ログアウト] をクリックすると、当該ユーザーのセッションを破棄し、自動ログインキーも削除します。</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}

