{include file='../adminHeader.tpl'}

<script>
{literal}
$(function() {
	$("#from_date").datepicker();
	$("#to_date").datepicker();
	$("#date_01").datepicker();
	$("#date_02").datepicker();
	$("#date_03").datepicker();
	$("#date_04").datepicker();
	$("#date_05").datepicker();
	$("#date_06").datepicker();
	$("#date_07").datepicker();
	$("#date_08").datepicker();
	$("#date_09").datepicker();
});
{/literal}
</script>

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>{$_title|cat:'管理'}</h3>
			<ul>
				<li><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
				<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		{if $value.id}
		<div class="previewLink">
			<img src="{$appPath}/images/sys/form.png" />
			<a href="{$appPath}/{$param.controller}/preview/?id={$value.id|escape}" target="_blank">プレビュー&#8811;</a>
		</div>
		{/if}

		<form enctype="multipart/form-data" action="{self}" method="post">
			<div class="editForm">
				{$isError|if:'<div class="error">エラー ： 赤枠で表示中の項目をご確認ください</div>':''}
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
								日付<span class="required">*</span>
							</th>
							<td>
								{$error.class.created}
								<input name="created" type="text" value="{$value.created|escape}" class="w192 ime-inactive" />
								{$error.msg.created}
							</td>
						</tr>
						{/if}
						<tr>
							<th class="sideHead">
								タイトル<span class="required">*</span>
							</th>
							<td>
								{$error.class.title}
								<input name="title" type="text" value="{$value.title|escape}" class="w100p ime-active" />
								{$error.msg.title}
							</td>
						</tr>
						<tr>
							<th class="sideHead" rowspan="3">
								開催日<span class="required">*</span>
							</th>
							<td>
								<div class="parallel">
									<div>
										{$error.class.from_date}
										<input name="from_date" type="text" id="from_date" value="{$value.from_date|escape|date_format:'Y/n/j'}" class="w128 ime-inactive" readonly="readonly" />
										{$error.msg.from_date}
									</div>
									<div>～</div>
									<div>
										{$error.class.to_date}
										<input name="to_date" type="text" id="to_date" value="{$value.to_date|escape|date_format:'Y/n/j'}" class="w128 ime-inactive" readonly="readonly" />
										{$error.msg.to_date}
									</div>
								</div>
								<p class="note">※開催期間を選択してください。</p>
							</td>
						</tr>
						<tr>
							<td>
								{$error.class.date_01}
								<input name="date_01" type="text" id="date_01" value="{$value.date_01|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_01}

								{$error.class.date_02}
								<input name="date_02" type="text" id="date_02" value="{$value.date_02|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_02}

								{$error.class.date_03}
								<input name="date_03" type="text" id="date_03" value="{$value.date_03|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_03}

								{$error.class.date_04}
								<input name="date_04" type="text" id="date_04" value="{$value.date_04|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_04}

								{$error.class.date_05}
								<input name="date_05" type="text" id="date_05" value="{$value.date_05|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_05}

								{$error.class.date_06}
								<input name="date_06" type="text" id="date_06" value="{$value.date_06|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_06}

								{$error.class.date_07}
								<input name="date_07" type="text" id="date_07" value="{$value.date_07|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_07}

								{$error.class.date_08}
								<input name="date_08" type="text" id="date_08" value="{$value.date_08|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_08}

								{$error.class.date_09}
								<input name="date_09" type="text" id="date_09" value="{$value.date_09|escape|date_format:'Y/n/j'}" class="w80 ime-inactive" _readonly="readonly" />
								{$error.msg.date_09}

								<p class="note">※開催日が数回にわたる場合はその日付を選択してください。</p>
							</td>
						</tr>
						<tr>
							<td>
								{$error.class.date_text}
								<input name="date_text" type="text" value="{$value.date_text|escape}" class="w256 ime-active" />
								{$error.msg.date_text}
								<p class="note">※イベント詳細ページで、開催日の代わりに表示する場合は記入してください（例：＊＊月の毎週木曜日開催！）。</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								開催時間帯
							</th>
							<td>
								{$error.class.opening_time}
								<input name="opening_time" type="text" value="{$value.opening_time|escape}" class="w256 ime-active" />
								{$error.msg.opening_time}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								予約
							</th>
							<td class="radio">
								<label>
									<input name="reservation" type="checkbox" value="1"{checked var=$value.reservation  value='1'} />
									必要
								</label>
								<p class="note">
									※チェックを入れると、予約フォームの「ご希望日時」「住所」「電話番号」欄の記入が必須になります。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								イベント種別<span class="required">*</span>
							</th>
							<td>
								<div class="radio">
								{$error.class.type}
								{html_radios name='type' options=$metafile.events selected=$value.type}
								{$error.msg.type}
								</div>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								開催要項<span class="required">*</span>
							</th>
							<td class="mce">
								{$error.class.descriptions}
								<textarea id="elm1" name="descriptions" cols="50" rows="5" class="w100p ime-active">{$value.descriptions|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{$error.msg.descriptions}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								本文<span class="required">*</span>
							</th>
							<td class="mce">
								{$error.class.body}
								<textarea id="elm1" name="body" cols="50" rows="5" class="w100p ime-active">{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{$error.msg.body}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								ファイル
							</th>
							<td id="fileUp">
								{$files|default:$tpl_value.default}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								画像
							</th>
							<td id="imageUp">
								{$images}
								{$error.class.images}
								{$error.msg.images}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								強調
							</th>
							<td>
								<label>
									<input name="strong" type="checkbox" value="1"{checked var=$value.strong  value='1'} />
									強調
								</label>
								<p class="note">
									※チェックを入れるとイベントカレンダーでおよびトップページで強調表示されます。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								トップページで表示
							</th>
							<td class="radio">
								<label>
									<input name="top" type="checkbox" value="1"{checked var=$value.top  value='1'} />
									表示
								</label>
								<p class="note">
									※チェックを入れると、トップページの“イベント情報”に表示されます。
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								表示
							</th>
							<td>
								<label>
									<input name="status" type="checkbox" value="1"{checked var=$value.status  value='1'} />
									表示
								</label>
								<p class="note">
									※チェックを外したイベント情報は、いずれのページにも表示されません。（チェックを外すと、上記 [トップページで表示] にチェックが入っている場合においても非表示になります）
								</p>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="id"                       value="{$value.id|escape}" />
								<input type="hidden" name="tempdir"                  value="{$tempdir|escape}" />
								<input type="submit" name="_mode_{$param.controller}_save_confirm_" value="確認画面へ進む" />
							</th>
						</tr>
					</tbody>
				</table>

				<div id="helpDescription">
					<div class="helpSpace">
						<ul>
							<li>※<span class="required">*</span>印は必須項目です。</li>
							<li>※[表示] 欄にのチェックを外した情報は、いずれのページにも表示されません。</li>
							<li>※プレビュー表示する場合は、表示する前に予め更新してください。（公開前に確認したい場合は[表示]のチェックを外した状態で保存します）</li>
							<li>※画像は自動的に縮小され、Exif情報は削除されます。</li>
							<li>※画像ファイルはファイルサイズが{ini_get var='upload_max_filesize'}のものまで登録できますが、エラーが出る場合は予め縮小してから登録してください。</li>
							<li>※容量が{ini_get var='upload_max_filesize'}を超えるファイルは登録できません。</li>
							<li>※ファイル名が日本語のファイルを登録する場合はファイル名を27文字以内としてください。</li>
						</ul>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

