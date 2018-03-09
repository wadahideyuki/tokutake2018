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

		<form enctype="multipart/form-data" action="{self}" method="post" id="info_save_edit">
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
								氏名<span class="required">*</span>
							</th>
							<td>
								{$error.class.name}
								<input name="name" type="text" value="{$value.name|escape}" class="w100p ime-active" />
								{$error.msg.name}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								肩書き
							</th>
							<td>
								{$error.class.position}
								<input name="position" type="text" value="{$value.position|escape}" class="w100p ime-active" />
								{$error.msg.position}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								特徴
							</th>
							<td class="mce">
								{$error.class.speciality}
								<textarea id="elm1" name="speciality" cols="50" rows="5" class="w100p ime-active">{$value.speciality|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{$error.msg.speciality}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								コメント
							</th>
							<td class="mce">
								{$error.class.body}
								<textarea id="elm1" name="body" cols="50" rows="5" class="w100p ime-active">{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{$error.msg.body}
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
								表示
							</th>
							<td>
								<label>
									<input name="status" type="checkbox" value="1"{checked var=$value.status  value='1'} />
									表示
								</label>
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
							<li>※プレビュー表示する場合は、表示する前に予め更新してください。</li>
							<li>※画像は自動的に縮小され、Exif情報は削除されます。</li>
							<li>※画像ファイルはファイルサイズが{ini_get var='upload_max_filesize'}のものまで登録できますが、エラーが出る場合は予め縮小してから登録してください。</li>
						</ul>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

