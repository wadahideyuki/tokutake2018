{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		{include file='config_menu.tpl'}

		<form action="{self}" method="post" name="config">

			{if $isError}
			<div class="error">
				エラー ： 赤枠で表示中の項目をご確認ください
			</div>
			{/if}

			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th colspan="2" class="topHead top">■ログイン設定</th>
						</tr>
						<tr>
							<th class="sideHead">自動ログインの有効期限<span class="required">*</span>
								<br/>
								（単位：時間）
							</th>
							<td>
								{$error.class.autologin_term}
								<input type="text" name="autologin_term" value="{$value.autologin_term|escape}" class="w32 ime-inactive" />
								時間
								{$error.msg.autologin_term}
								<p class="note">
									※自動ログイン機能を使用しない場合は、0を設定してください。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">自動ログイン時のIPチェック</th>
							<td>
								<input name="autologin_ipcheck" type="checkbox" value="1"{checked  var=$value.autologin_ipcheck value='1'} />
								<ul class="note">
									<li>※チェックを入れた場合、前回ログイン時のクライアントIPアドレスが異なると自動的ログインできません。</li>
									<li>※携帯端末でアクセスの場合は、いずれの設定の場合もIPチェックは行いません。</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th class="sideHead">セッション持続時間<span class="required">*</span>
								<br/>
								（単位：分）
							</th>
							<td>
								{$error.class.session_term}
								<input type="text" name="session_term" value="{$value.session_term|escape}" class="w32 ime-inactive" />
								分
								{$error.msg.session_term}
								<p class="note">
									※自動ログイン機能を使用していない場合、こちらで指定した時間何も操作しないと自動的にログアウトします。
								</p>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="type" value="{$param.type|default:'login'|escape}" />
								<input type="submit" name="_mode_admin_save_" value="更　新" />
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</form>

		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>※<span class="required">*</span>印は必須項目です。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}
