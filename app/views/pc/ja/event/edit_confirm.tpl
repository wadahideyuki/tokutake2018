{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>{$_title|cat:'管理'}</h3>
			<ul>
				<li><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
				<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		<form enctype="multipart/form-data" action="{self}" method="post">
			<div class="editForm">
				<div class="formConfirm">
					※以下の内容でよろしければ[{$value.id|if:'更新':'登録'}]ボタンをクリックしてください。<br />
					※修正する場合は[再編集]ボタンをクリックしてください。
				</div>
				<table>
					<tbody>
						<tr>
							<th colspan="2" class="topHead top">
								■{$value.id|if:'編集':'新規登録'}フォーム
							</th>
						</tr>
						{if $value.id}
						<tr>
							<th class="sideHead">
								日付
							</th>
							<td>
								{$value.created|escape|default:$tpl_value.default}
								<input name="created" type="hidden" value="{$value.created|escape}" />
							</td>
						</tr>
						{/if}
						<tr>
							<th class="sideHead">
								タイトル
							</th>
							<td>
								{$value.title|escape}
								<input name="title" type="hidden" value="{$value.title|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead" rowspan="3">
								開催日
							</th>
							<td>
								{$value.from_date|escape|date_format:'Y/n/j'}～{$value.to_date|escape|date_format:'Y/n/j'}
								<input name="from_date" type="hidden" value="{$value.from_date|escape|date_format:'Y/n/j'}" />
								<input name="to_date"   type="hidden" value="{$value.to_date|escape|date_format:'Y/n/j'}" />
							</td>
						</tr>
						<tr>
							<td>
								{$value.date_01|escape|date_format:'Y/n/j'}
								{$value.date_02|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_03|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_04|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_05|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_06|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_07|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_08|escape|date_format:'Y/n/j'|add:', ':'f'}
								{$value.date_09|escape|date_format:'Y/n/j'|add:', ':'f'}
								<input name="date_01" type="hidden" value="{$value.date_01|escape|date_format:'Y/n/j'}" />
								<input name="date_02" type="hidden" value="{$value.date_02|escape|date_format:'Y/n/j'}" />
								<input name="date_03" type="hidden" value="{$value.date_03|escape|date_format:'Y/n/j'}" />
								<input name="date_04" type="hidden" value="{$value.date_04|escape|date_format:'Y/n/j'}" />
								<input name="date_05" type="hidden" value="{$value.date_05|escape|date_format:'Y/n/j'}" />
								<input name="date_06" type="hidden" value="{$value.date_06|escape|date_format:'Y/n/j'}" />
								<input name="date_07" type="hidden" value="{$value.date_07|escape|date_format:'Y/n/j'}" />
								<input name="date_08" type="hidden" value="{$value.date_08|escape|date_format:'Y/n/j'}" />
								<input name="date_09" type="hidden" value="{$value.date_09|escape|date_format:'Y/n/j'}" />
							</td>
						</tr>
						<tr>
							<td>
								日付代替文字列：{$value.date_text|escape|default:'--'}
								<input name="date_text" type="hidden" value="{$value.date_text|escape}" />
							</td>
							
						</tr>
						<tr>
							<th class="sideHead">
								開催時間帯
							</th>
							<td>
								{$value.opening_time|escape|default:'--'}
								<input name="opening_time" type="hidden" value="{$value.opening_time|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								予約
							</th>
							<td>
								{$value.reservation|if:'必要':'不要'}
								<input name="reservation" type="hidden" value="{$value.reservation|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								イベント種別
							</th>
							<td>
								{html_radios name='type' options=$metafile.events selected=$value.type mode='conf'}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								開催要項
							</th>
							<td>
								{$value.descriptions|escape|nl2br|default:$tpl_value.default}
								<input name="descriptions" type="hidden" value="{$value.descriptions|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								本文
							</th>
							<td>
								{$value.body|escape|nl2br|default:$tpl_value.default}
								<input name="body" type="hidden" value="{$value.body|escape}" />
							</td>
						</tr>
						<tr id="fileUp">
							<th class="sideHead">
								ファイル
							</th>
							<td>
									{$files|default:$tpl_value.default}
							</td>
						</tr>
						<tr id="imageUp">
							<th class="sideHead">
								画像
							</th>
							<td>
								{$images}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								強調
							</th>
							<td>
								{$value.strong|if:'強調表示':'--'}
								<input name="strong" type="hidden" value="{$value.strong|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								トップページで表示
							</th>
							<td>
								{$value.top|if:'表示':'非表示'}
								<input name="top" type="hidden" value="{$value.top|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								表示
							</th>
							<td>
								{$value.status|if:'表示':'非表示'}
								<input name="status" type="hidden" value="{$value.status|escape}" />
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="id"                     value="{$value.id|escape}" />
								<input type="hidden" name="tempdir"                value="{$tempdir|escape}" />
								<input type="submit" name="_mode_{$param.controller}_save_"       value="{$value.id|if:'更　新':'登　録'}" class="submitBtn" />
								<input type="submit" name="_mode_{$param.controller}_save_reedit" value="再編集" class="backBtn" />
							</th>
						</tr>
					</tbody>
				</table>

			</div>
		</form>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

