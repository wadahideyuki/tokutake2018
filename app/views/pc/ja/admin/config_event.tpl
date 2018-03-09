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
							<th colspan="2" class="topHead top">■見学会・イベント表示設定</th>
						</tr>
						<tr>
							<th class="sideHead">トップページに表示する数<span class="required">*</span></th>
							<td>
								{$error.class.event_top}
								<input type="text" name="event_top" value="{$value.event_top|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.event_top}
							</td>
						</tr>
						<tr>
							<th class="sideHead">一覧ページに表示する数<span class="required">*</span></th>
							<td>
								{$error.class.event_list}
								<input type="text" name="event_list" value="{$value.event_list|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.event_list}
							</td>
						</tr>
						<tr>
							<th class="sideHead">添付ファイル数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.event_files}
								<input type="text" name="event_files" value="{$value.event_files|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.event_files}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.event_images}
								<input type="text" name="event_images" value="{$value.event_images|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.event_images}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サイズ<span class="required">*</span></th>
							<td>
								{$error.class.event_image_size}
								<input type="text" name="event_image_size" value="{$value.event_image_size|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.event_image_size_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サムネールサイズ<span class="required">*</span></th>
							<td>
								{$error.class.event_image_s_size}
								<input type="text" name="event_image_s_size" value="{$value.event_image_s_size|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.event_image_s_size}
							</td>
						</tr>
						<tr>
							<th colspan="2" class="topHead top">■見学会・イベント申込メールフォーム設定</th>
						</tr>
						<tr>
							<th class="sideHead">メール送信元アドレス<span class="required">*</span>
								<br/>
								(From:)
							</th>
							<td>
								{$error.class.event_mailform_from}
								<input type="text" name="event_mailform_from" value="{$value.event_mailform_from|escape}" class="w256 ime-inactive" />
								{$error.msg.event_mailform_from}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール送信者名<span class="required">*</span></th>
							<td>
								{$error.class.event_mailform_from_name}
								<input type="text" name="event_mailform_from_name" value="{$value.event_mailform_from_name|escape}" class="w256 ime-active" />
								{$error.msg.event_mailform_from_name}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール題名の接頭文字列</th>
							<td>
								{$error.class.event_mailform_sub_prefix}
								<input type="text" name="event_mailform_sub_prefix" value="{$value.event_mailform_sub_prefix|escape}" class="w256 ime-active" />
								{$error.msg.event_mailform_sub_prefix}
								<p class="note">
									※メール題名の先頭に常に付与する文字列を設定できます。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">メールの件名<span class="required">*</span><br />（管理者あてメール）</th>
							<td>
								{$error.class.event_mailform_subject}
								<input type="text" name="event_mailform_subject" value="{$value.event_mailform_subject|escape}" class="w256 ime-active" />
								{$error.msg.event_mailform_subject}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メールの件名<span class="required">*</span><br />（お客さまあてメール）</th>
							<td>
								{$error.class.event_mailform_copy_subject}
								<input type="text" name="event_mailform_copy_subject" value="{$value.event_mailform_copy_subject|escape}" class="w256 ime-active" />
								{$error.msg.event_mailform_copy_subject}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メール送信先アドレス<span class="required">*</span>
								<br/>
								(To:)
							</th>
							<td>
								{$error.class.event_mailform_to}
								<input type="text" name="event_mailform_to" value="{$value.event_mailform_to|escape}" class="w100p ime-inactive" />
								{$error.msg.event_mailform_to}
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
								{$error.class.event_mailform_returnpath}
								<input type="text" name="event_mailform_returnpath" value="{$value.event_mailform_returnpath|escape}" class="w256 ime-inactive" />
								{$error.msg.event_mailform_returnpath}
							</td>
						</tr>
						<tr>
							<th class="sideHead">自動返信メール本文の<br />共通ヘッダー</th>
							<td>
								{$error.class.event_mailform_header}
								<textarea name="event_mailform_header" style="height:64px;" class="ime-active monospace">{$value.event_mailform_header|escape}</textarea>
								{$error.msg.event_mailform_header}
								<p class="note">
									※お申込メールフォームより送信していただいたお客さまへ自動送信するメールのレターヘッドを設定してください。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">自動返信メール本文の<br />共通フッター</th>
							<td>
								{$error.class.event_mailform_footer}
								<textarea name="event_mailform_footer" style="height:64px;" class="ime-active monospace">{$value.event_mailform_footer|escape}</textarea>
								{$error.msg.event_mailform_footer}
								<p class="note">
									※お申込メールフォームより送信していただいたお客さまへ自動送信するメールのフッターを設定してください。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								二重送信チェック
							</th>
							<td>
								<label>
									<input name="event_check_double_sending" type="checkbox" value="1"{checked var=$value.event_check_double_sending  value='1'} />
									する
								</label>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="type" value="{$param.type|escape}" />
								<input type="submit" name="_mode_admin_save_" value="更　新"/>
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
					<li>※ここで設定した表示条件は、一覧ページに表示する数以外は、次回の更新時に反映されます。</li>
					<li>※添付ファイル数や画像数、画像サイズにつきましては、既存の登録内容は変更されません。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}
