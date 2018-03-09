{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		<div id="pageHeaderTitle">
			パスワード再設定
		</div>

		<form action="{$appPath}/auth/reset/" method="post" name="auth_forgot">
			{if $isError}
			<div class="error">
				エラー ： 赤枠で表示中の項目をご確認ください
			</div>
			{else}
			<div class="notice">
				メールアドレスを入力してください。
			</div>
			{/if}
			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th class="sideHead">メールアドレス</th>
							<td> {$error.class.user_mail}
							<input type="text" name="user_mail" value="{$value.user_mail|escape}" class="w256" />
							{$error.msg.user_mail} </td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
							<input type="hidden" name="admin" value="1" />
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
					<li>※ご登録のメールアドレスを入力して、[パスワード再設定] ボタンをクリックしてください。
						メールでパスワード再設定ページのＵＲＬをお知らせいたします。</li>
					<li>※メールが届きましたら、メールの手順に従い、速やかにパスワード再設定を行ってください。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}