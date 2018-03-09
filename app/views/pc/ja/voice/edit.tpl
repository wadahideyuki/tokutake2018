{include file='../adminHeader.tpl'}

<script type="text/javascript" src="{$appPath}/js/ckeditor/ckeditor.js"></script>

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
								一覧ページのキャッチフレーズ<span class="required">*</span>
							</th>
							<td>
								{$error.class.voice}
								<input name="voice" type="text" value="{$value.voice|escape}" class="w100p ime-active" />
								{$error.msg.voice}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								冒頭の説明文<span class="required">*</span>
							</th>
							<td>
								{$error.class.descriptions}
								<textarea id="elm1" name="descriptions" cols="50" rows="5" class="w100p ime-active" style="height: 4em;">{$value.descriptions|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{$error.msg.descriptions}
							</td>
						</tr>
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
							<th class="sideHead">
								建設地<span class="required">*</span>
							</th>
							<td>
								{$error.class.place}
								<input name="place" type="text" value="{$value.place|escape}" class="w128 ime-active" />
								{$error.msg.place}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								本文
							</th>
							<td class="mce">
								{$error.class.body}
								<textarea id="ckeditor" class="ckeditor" name="body">{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
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
							<li>※プレビュー表示する場合は、表示する前に予め更新してください。（公開前に確認したい場合は[表示]のチェックを外した状態で保存します）</li>
							<li>※画像は自動的に縮小され、Exif情報は削除されます。</li>
							<li>※画像ファイルはファイルサイズが{ini_get var='upload_max_filesize'}のものまで登録できますが、エラーが出る場合は予め縮小してから登録してください。</li>
							<li>※容量が{ini_get var='upload_max_filesize'}を超えるファイルは登録できません。</li>
						</ul>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

