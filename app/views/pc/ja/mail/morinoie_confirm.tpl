{include file='../userHeader.tpl' title='お問い合わせ'}
<!--パンくずリスト-->
<ul id="footpath">
	<li class="fp"><a href="{$basePath}{$appPath}/">トップページ</a></li>
	<li>お問い合わせ</li>
</ul>

<h2 class="h2s"><span>お問い合わせ</span><img src="{$appPath}/images/h2/inquiry.png" width="720" height="98" alt="お問い合わせ" /></h2>

<div id="sub-c">
	<p class="pd_b30 mar_l5">
		※ 以下の内容でよろしければ[送信]ボタンをクリックしてください。<br />
		※ 修正する場合は[修正]ボタンをクリックしてください。
	</p>

	<form action="{self}" method="post" autocomplete="off" name="form">
		
	<table id="t-contact">
		<tr valign="top">
			<th class="th-f">氏名</th>
			<td>
				{$value.name|escape}
				<input name="name" type="hidden" value="{$value.name|escape}" />
			</td>
		</tr>
		<tr valign="top">
			<th>メールアドレス</th>
			<td>
				{$value.mail|escape}
				<input name="mail" type="hidden" value="{$value.mail|escape}" />
			</td>
		</tr>
		<tr valign="top">
			<th>郵便番号</th>
			<td>
				{$value.zip|escape}
				<input name="zip" type="hidden" value="{$value.zip|escape}" />
			</td>
		</tr>
		<tr valign="top">
			<th>住所</th>
			<td>
				{select_pref name='pref' pref=$value.pref mode='conf'}<br />
				{$value.address|escape}
				<input name="address" type="hidden" value="{$value.address|escape}" />
			</td>
		</tr>
		<tr valign="top">
			<th>電話番号</th>
			<td>
				{$value.phone|escape}
				<input name="phone" type="hidden" value="{$value.phone|escape}" />
			</td>
		</tr>
		<tr valign="top">
			<th>FAX番号</th>
			<td>
				{$value.fax|escape}
				<input name="fax" type="hidden" value="{$value.fax|escape}" />
			</td>
		</tr>
		<tr valign="top">
			<th>件名</th>
			<td>
				{html_options name='subject' options=$metafile.inquiry_subjects selected=$value.subject mode='conf'}
			</td>
		</tr>
		<tr valign="top">
			<th>具体的な内容</th>
			<td>
				{$value.body|escape|nl2br}
				<input name="body" type="hidden" value="{$value.body|escape}" />
			</td>
		</tr>
		<tr>
			<td colspan="2" class="b-none tc">
				<span class="red">再度記入内容をご確認の上、「送信」ボタンを押してください。</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="b-none tc">
				{$_token_input}
				<input type="hidden" name="id" value="{$value.id|escape}" />
				<input type="submit" name="_mode_mail_submit_"        value="　送　信　" />
				<input type="submit" name="_mode_mail_submit_reedit_" value="　修　正　" />
			</td>
		</tr>
	</table>
	</form>
</div>

{include file='../userFooter.tpl' pagetopLink='1'}
