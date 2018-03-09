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
							<th colspan="2" class="topHead top">■お客様の声設定</th>
						</tr>
						<tr>
							<th class="sideHead">トップページに表示する数<span class="required">*</span></th>
							<td>
								{$error.class.voice_top}
								<input type="text" name="voice_top" value="{$value.voice_top|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.voice_top}
							</td>
						</tr>
						<tr>
							<th class="sideHead">一覧ページに表示する数<span class="required">*</span></th>
							<td>
								{$error.class.voice_list}
								<input type="text" name="voice_list" value="{$value.voice_list|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.voice_list}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.voice_images}
								<input type="text" name="voice_images" value="{$value.voice_images|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.voice_images}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サイズ<span class="required">*</span></th>
							<td>
								{$error.class.voice_image_size}
								<input type="text" name="voice_image_size" value="{$value.voice_image_size|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.voice_image_size_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サムネールサイズ<span class="required">*</span></th>
							<td>
								{$error.class.voice_image_s_size}
								<input type="text" name="voice_image_s_size" value="{$value.voice_image_s_size|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.voice_image_s_size}
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
					<li>※画像数、画像サイズにつきましては、既存の登録内容は変更されません。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}
