{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		<div id="pageHeaderTitle">
			パスワード再設定
		</div>

		<form action="{$appPath}/auth/renew/" method="post" name="auth_setpwd">
			{if $isError}
			<div class="error">
				エラー ： 赤枠で表示中の項目をご確認ください
			</div>
			{else}
			<div class="notice">
				新しいパスワードを入力してください。
			</div>'
			{/if}

			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th class="sideHead">新しいパスワード</th>
							<td>{$error.class.new_pwd}
							<input type="password" name="new_pwd" value="{$value.new_pwd|escape}" class="w160" />
							{$error.msg.new_pwd}
							<br />
							{$error.class.conf_pwd}
							<input type="password" name="conf_pwd" value="{$value.conf_pwd|escape}" class="w160" />
							※確認用にもう一度入力してください
							{$error.msg.conf_pwd} </td>
						</tr>

						<tr>
							<th colspan="2" class="bottomHead">
							<input type="hidden" name="admin" value="1" />
							<input type="hidden" name="key" value="{$value.key|escape}" />
							<input type="submit" value="パスワード再設定" />
							</th>
						</tr>

					</tbody>
				</table>
			</div>
		</form>

		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>
						※パスワードは6文字以上12文字以内で設定してください。
							利用できる文字は、半角英数字・アンダーバー・ハイフンで、最低ひとつ以上の数字・英大文字・英小文字を含めてください。
					</li>
					<li>※パスワードは他人から推測されにくい文字列を使用してください。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}

