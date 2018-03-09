{include file='../adminHeader.tpl' _title='ログイン'}

<div id="contentContainer">
	<div id="content">

		<div class="loginForm">

			<form action="{$appPath}/auth/auth/" method="post" name="auth_login">

					<table>
						<tbody>
							<tr>
								<th class="topHead" colspan="2">ログイン</th>
							</tr>
							<tr>
								<td>
									{if $isError}
									<div class="loginError">
										メールアドレスまたはパスワードが違います
									</div>
									{/if}

									<div class="fieldTitle">メールアドレス</div>
									{$error.class.user_mail}
									<input type="text" name="user_mail" value="{$value.user_mail|escape}" class="textBox ime-inactive focus" />
									{$error.msg.user_mail}
								</td>
							</tr>
							<tr>
								<td>
									<div class="fieldTitle">パスワード</div>
									{$error.class.user_pwd}
									<input type="password" name="user_pwd" value="{$value.user_pwd|escape}" class="textBox ime-inactive" />
									{$error.msg.user_pwd}

									<div class="radio">

											パスワードをお忘れの方は<a href="{$appPath}/auth/forgot/admin/reset/">こちら</a>

										{if $meta.autologin_term}
										<br/>

										<input type="checkbox" name="autologin" id="autologin" value="1" />
										<label for="autologin">
											次回から自動的にログイン
										</label>
										{/if}
									</div>
								</td>
							</tr>
							<tr>
								<th colspan="2" class="bottomHead">
									<input type="hidden" name="admin" value="1" />
									<input type="hidden" name="targetUrl" value="{$targetUrl}" />
									<input type="submit" value="ログイン" class="btn" />
								</th>
							</tr>
						</tbody>
					</table>
			</form>

			<ul>
				{if $meta.autologin_term}
				<li>※[次回から自動的にログイン] にチェックを入れてログインすると、次回からID（メールアドレス）とパスワードの入力が不要になります。</li>
				<li>※自動ログイン機能を利用する場合は、終了時に [ログアウト] をクリックせずに、そのままブラウザを閉じてください。</li>
				<li>※自動ログインの有効期限は最後にログインしてから{$autologinTerm|time_format:'h2d'}日間です。</li>
				<li>※自動ログイン機能を利用しない場合、{$sessionTerm}分間なにも操作しないと自動的にログアウトします。</li>
				<li>※不特定多数が利用するパソコンでは自動ログイン機能を利用しないでください。</li>
				{/if}
				<li>※正しいID（メールアドレス）・パスワードを入力してもログインできない場合は、ご利用のブラウザでクッキーが有効になっているかご確認ください。</li>
				<li>※JavaScriptを有効にしてご利用ください。JavaScriptが無効の場合は、一部の機能がご利用できない場合がございます。</li>
			</ul>

		</div>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}
