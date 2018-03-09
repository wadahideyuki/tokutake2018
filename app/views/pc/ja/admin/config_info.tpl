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
							<th colspan="2" class="topHead top">■お知らせ情報表示設定</th>
						</tr>
						<tr>
							<th class="sideHead">トップページに表示する数<span class="required">*</span></th>
							<td>
								{$error.class.info_top_1}
								<input type="text" name="info_top_1" value="{$value.info_top_1|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.info_top_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">一覧ページに表示する数<span class="required">*</span></th>
							<td>
								{$error.class.info_list_1}
								<input type="text" name="info_list_1" value="{$value.info_list_1|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.info_list_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">添付ファイル数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.info_files_1}
								<input type="text" name="info_files_1" value="{$value.info_files_1|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.info_files_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像数（上限）<span class="required">*</span></th>
							<td>
								{$error.class.info_images_1}
								<input type="text" name="info_images_1" value="{$value.info_images_1|escape}" class="w32 ime-inactive" />
								枚
								{$error.msg.info_images_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サイズ<span class="required">*</span></th>
							<td>
								{$error.class.info_image_size_1}
								<input type="text" name="info_image_size_1" value="{$value.info_image_size_1|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.info_image_size_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">画像サムネールサイズ<span class="required">*</span></th>
							<td>
								{$error.class.info_image_s_size_1}
								<input type="text" name="info_image_s_size_1" value="{$value.info_image_s_size_1|escape}" class="w32 ime-inactive" />
								px
								{$error.msg.info_image_s_size_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">RSS</th>
							<td>
								<div class="radio">
									{$error.class.info_rss_generate_1}
									<label>
										<input name="info_rss_generate_1" type="checkbox" value="1"{checked  var=$value.info_rss_generate_1 value='1'} />
										生成する
									</label>
									{$error.msg.info_rss_generate_1}
									<p class="note">
										※RSSファイルは３種類生成されます。（ATOM1.0, RSS2.0, RSS1.0）
									</p>
								</div>
							</td>
						</tr>
						<tr>
							<th class="sideHead">RSSのアイテム数</th>
							<td>
								{$error.class.info_rss_items_1}
								<input type="text" name="info_rss_items_1" value="{$value.info_rss_items_1|escape}" class="w32 ime-inactive" />
								アイテム
								{$error.msg.info_rss_items_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">RSSのタイトル</th>
							<td>
								{$error.class.info_rss_title_1}
								<input type="text" name="info_rss_title_1" value="{$value.info_rss_title_1|escape}" class="w256 ime-active" />
								{$error.msg.info_rss_title_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">RSSの説明</th>
							<td>
								{$error.class.info_rss_description_1}
								<input type="text" name="info_rss_description_1" value="{$value.info_rss_description_1|escape}" class="w100p ime-active" />
								{$error.msg.info_rss_description_1}
							</td>
						</tr>
						<tr>
							<th class="sideHead">RSSファイル</th>
							<td>
								{$error.class.info_rss_filepath_1}
								<input type="text" name="info_rss_filepath_1" value="{$value.info_rss_filepath_1|escape}" class="w256 ime-inactive" />
								{$error.msg.info_rss_filepath_1}
								<p class="note">
									※ドキュメントルートからのファイルパスを拡張子なしで指定してください。（例：/rss/info）<br />
									拡張子は自動的に付与されます。（ATOM1.0：“.atom.xml”,　RSS2.0：“.xml”,　RSS1.0：“.rdf”）
								</p>
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
