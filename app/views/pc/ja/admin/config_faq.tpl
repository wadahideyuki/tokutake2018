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
							<th colspan="2" class="topHead top">■よくある質問表示設定</th>
						</tr>
						<tr>
							<th class="sideHead">添付ファイル数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.faq_files}
								<input type="text" name="faq_files" value="{$value.faq_files|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.faq_files}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.faq_images}
								<input type="text" name="faq_images" value="{$value.faq_images|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.faq_images}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サイズ<span class="required">*</span></th>
							<td>
								{$error.class.faq_image_size}
								<input type="text" name="faq_image_size" value="{$value.faq_image_size|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.faq_image_size}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サムネールサイズ<span class="required">*</span></th>
							<td>
								{$error.class.faq_image_s_size}
								<input type="text" name="faq_image_s_size" value="{$value.faq_image_s_size|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.faq_image_s_size}
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
					<li>※添付ファイル数や画像数、画像サイズにつきましては、既存の登録内容は変更されません。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}
