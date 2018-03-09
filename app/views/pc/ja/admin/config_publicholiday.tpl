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
							<th colspan="2" class="topHead top">■祝祭日設定</th>
						</tr>
						<tr>
							<th class="sideHead">祝祭日</th>
							<td>
								{$error.class.holidays}
								<textarea name="holidays" style="height:64px;" class="ime-active monospace">{$value.holidays|escape}</textarea>
								{$error.msg.holidays}
								<p class="note">
									※祝祭日をカンマで区切って列記してください。（例：2015/1/1, 2015/2/2, 2015/3/3....）
								</p>
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
					<li>※イベント情報のページ等で日付の脇に「祝」と表示する日付を設定できます。</li>
					<li>※過去の祝祭日は適宜削除してください。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}
