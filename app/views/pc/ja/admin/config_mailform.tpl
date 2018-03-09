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
							<th colspan="2" class="topHead top">■お問い合わせメールフォーム基本設定</th>
						</tr>
						<tr>
							<th class="sideHead">メール送信元アドレス<span class="required">*</span>
								<br/>
								(From:)
							</th>
							<td>
								{$error.class.inquiry_mailform_from}
								<input type="text" name="inquiry_mailform_from" value="{$value.inquiry_mailform_from|escape}" class="w256 ime-inactive" />
								{$error.msg.inquiry_mailform_from}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール送信者名<span class="required">*</span></th>
							<td>
								{$error.class.inquiry_mailform_from_name}
								<input type="text" name="inquiry_mailform_from_name" value="{$value.inquiry_mailform_from_name|escape}" class="w256 ime-active" />
								{$error.msg.inquiry_mailform_from_name}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール題名の接頭文字列</th>
							<td>
								{$error.class.inquiry_mailform_sub_prefix}
								<input type="text" name="inquiry_mailform_sub_prefix" value="{$value.inquiry_mailform_sub_prefix|escape}" class="w256 ime-active" />
								{$error.msg.inquiry_mailform_sub_prefix}
								<p class="note">
									※メール題名の先頭に常に付与する文字列を設定できます。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">メールの件名<span class="required">*</span><br />（管理者あてメール）</th>
							<td>
								{$error.class.inquiry_mailform_subject}
								<input type="text" name="inquiry_mailform_subject" value="{$value.inquiry_mailform_subject|escape}" class="w256 ime-active" />
								{$error.msg.inquiry_mailform_subject}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メールの件名<span class="required">*</span><br />（お客さまあてメール）</th>
							<td>
								{$error.class.inquiry_mailform_copy_subject}
								<input type="text" name="inquiry_mailform_copy_subject" value="{$value.inquiry_mailform_copy_subject|escape}" class="w256 ime-active" />
								{$error.msg.inquiry_mailform_copy_subject}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール送信先アドレス<span class="required">*</span>
								<br/>
								(To:)
							</th>
							<td>
								{$error.class.inquiry_mailform_to}
								<input type="text" name="inquiry_mailform_to" value="{$value.inquiry_mailform_to|escape}" class="w100p ime-inactive" />
								{$error.msg.inquiry_mailform_to}
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
								{$error.class.inquiry_mailform_returnpath}
								<input type="text" name="inquiry_mailform_returnpath" value="{$value.inquiry_mailform_returnpath|escape}" class="w256 ime-inactive" />
								{$error.msg.inquiry_mailform_returnpath}
							</td>
						</tr>
						<tr>
							<th class="sideHead">自動返信メール本文の<br />共通ヘッダー</th>
							<td>
								{$error.class.inquiry_mailform_header}
								<textarea name="inquiry_mailform_header" style="height:64px;" class="ime-active monospace">{$value.inquiry_mailform_header|escape}</textarea>
								{$error.msg.inquiry_mailform_header}
								<p class="note">
									※お問い合わせメールフォームより送信していただいたお客さまへ自動送信するメールのレターヘッドを設定してください。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">自動返信メール本文の<br />共通フッター</th>
							<td>
								{$error.class.inquiry_mailform_footer}
								<textarea name="inquiry_mailform_footer" style="height:64px;" class="ime-active monospace">{$value.inquiry_mailform_footer|escape}</textarea>
								{$error.msg.inquiry_mailform_footer}
								<p class="note">
									※お問い合わせメールフォームより送信していただいたお客さまへ自動送信するメールのフッターを設定してください。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								二重送信チェック
							</th>
							<td>
								<label>
									<input name="check_double_sending" type="checkbox" value="1"{checked var=$value.check_double_sending  value='1'} />
									する
								</label>
							</td>
						</tr>
						<tr>

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
