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
							<th colspan="2" class="topHead top">■メール基本設定</th>
						</tr>
						<tr>
							<th class="sideHead">メール送信元アドレス<span class="required">*</span>
								<br/>
								(From:)
							</th>
							<td>
								{$error.class.mail_from}
								<input type="text" name="mail_from" value="{$value.mail_from|escape}" class="w256 ime-inactive" />
								{$error.msg.mail_from}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール送信者名<span class="required">*</span></th>
							<td>
								{$error.class.mail_from_name}
								<input type="text" name="mail_from_name" value="{$value.mail_from_name|escape}" class="w256 ime-active" />
								{$error.msg.mail_from_name}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール題名の接頭文字列</th>
							<td>
								{$error.class.mail_sub_prefix}
								<input type="text" name="mail_sub_prefix" value="{$value.mail_sub_prefix|escape}" class="w256 ime-active" />
								{$error.msg.mail_sub_prefix}
								<p class="note">
									※メール題名の先頭に常に付与する文字列を設定できます。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール送信先アドレス<span class="required">*</span>
								<br/>
								(To:)
							</th>
							<td>
								{$error.class.mail_to}
								<input type="text" name="mail_to" value="{$value.mail_to|escape}" class="w100p ime-inactive" />
								{$error.msg.mail_to}
								<p class="note">
									※カンマで区切って複数設定できます。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール戻り先アドレス<span class="required">*</span>
								<br/>
								(Return-Path:)
							</th>
							<td>
								{$error.class.mail_returnpath}
								<input type="text" name="mail_returnpath" value="{$value.mail_returnpath|escape}" class="w256 ime-inactive" />
								{$error.msg.mail_returnpath}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール本文の共通ヘッダー</th>
							<td>
								{$error.class.mail_header}
								<textarea name="mail_header" style="height:64px;" class="ime-active monospace">{$value.mail_header|escape}</textarea>
								{$error.msg.mail_header}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール本文の共通フッター</th>
							<td>
								{$error.class.mail_footer}
								<textarea name="mail_footer" style="height:64px;" class="ime-active monospace">{$value.mail_footer|escape}</textarea>
								{$error.msg.mail_footer}
							</td>
						</tr>
						<tr>
							<th class="sideHead">Bcc</th>
							<td>
								{$error.class.admin_bcc_mail}
								<input type="text" name="admin_bcc_mail" value="{$value.admin_bcc_mail|escape}" class="w256 ime-inactive" />
								{$error.msg.admin_bcc_mail}
								<p class="note">
									※システムから送信されるすべてのメールにBccを設定できます。
								</p>
							</td>
						</tr>

						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="type" value="{$param.type|escape}" />
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
					<li>※ここではパスワードアシスト機能やエラー通知などシステムから送信されるメールに関する設定を行います。</li>
					<li>※[メール送信元アドレス]は、システムから送信されるメールの送信元アドレスを設定してください。</li>
					<li>※[メール送信者名]は、システムから送信されるメールの送信元名を設定してください。 </li>
					<li>※[メール題名の接頭文字列]は、システムから送信されるメールの題名の接頭文字列を設定してください。</li>
					<li>※[メール戻り先アドレス]で指定したメールアドレスは、システムから送信されるメールが送信先サーバーのエラーなどにより返信される不着通知メールの戻り先になります。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}
