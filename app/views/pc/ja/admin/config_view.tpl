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
							<th colspan="2" class="topHead top">■管理画面表示設定</th>
						</tr>
						<tr>
							<th class="sideHead">フォントサイズ</th>
							<td>
								{$error.class.font_size}
								<input type="text" name="font_size" value="{$value.font_size|escape}" class="w32 ime-inactive" />
								％
								{$error.msg.font_size}
								<p class="note">※管理画面のフォントサイズを指定できます。</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								一覧表示数の選択肢<span class="required">*</span>
							</th>
							<td class="mce">
								{$error.class.rows_list}
								<input type="text" name="rows_list" value="{$value.rows_list|escape}" class="w100p ime-inactive" />
								{$error.msg.rows_list}
								<p class="note">※一覧表示画面で選択する表示件数の選択肢をカンマで区切って列記してください。</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								利用開始年<span class="required">*</span>
							</th>
							<td class="mce">
								{$error.class.start_year}
								<input type="text" name="start_year" value="{$value.start_year|escape}" class="w64 ime-inactive" />
								年
								{$error.msg.start_year}
								<p class="note">※各種日付選択肢で表示される開始年を設定してください。</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								一覧ページに表示する<br />デフォルト数
							</th>
							<td>
								{$error.class.list_rows}
								<input type="text" name="list_rows" value="{$value.list_rows|escape}" class="w32 ime-inactive" />
								件
								{$error.msg.list_rows}
								<p class="note">※各種一覧ページで表示するデフォルトのレコード数を指定してください。</p>
								<p class="note">※空欄にするとすべてのデータが１ページに表示されます。（非推奨）</p>
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
					<li>※<span class="required">*</span>印は必須項目です。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='1'}