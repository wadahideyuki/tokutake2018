{include file='../adminHeader.tpl' title='施工事例管理'}

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>施工事例管理</h3>
			<ul>
				<li><a href="{$appPath}/{$param.controller|escape}/list/"><span>一覧</span></a></li>
				<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/{$param.controller|escape}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		{if $value.id}
		<div class="previewLink">
			<img src="{$appPath}/images/sys/form.png" />
			<a href="{$appPath}/{$param.controller|escape}/preview/?id={$value.id|escape}" target="_blank">プレビュー&#8811;</a>
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
								<input name="title" type="text" value="{$value.title|escape}□□□様邸" class="w100p ime-active" />
								{$error.msg.title}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								仕様
							</th>
							<td class="mce">
								{$error.class.body}
								<textarea id="elm1" name="body" cols="50" rows="5" class="w100p ime-active" style="height:80px">
所在地：千曲市
家族構成：夫婦/子供*名
.......
									{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{$error.msg.body}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								主要装備
							</th>
							<td>
								<div class="radio">
								{$error.class.specs}
								{html_checkboxes name='specs' options=$metafile.specs selected=$value.specs}
								{$error.msg.specs}
								</div>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								本文
							</th>
							<td class="mce">
								{$error.class.body}
								<textarea id="elm1" name="body" cols="50" rows="5" class="w100p ime-active" style="height:80px">ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。ここに本文が入ります。{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
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
								トップページで表示
							</th>
							<td>
								<label>
									<input name="status" type="checkbox" value="1"{checked var=$value.status  value='1'} />
									表示
								</label>
								<p class="note">
									※チェックを入れると、トップページの“ニュース一覧”に表示されます。
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
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="id"                       value="{$value.id|escape}" />
								<input type="hidden" name="tempdir"                  value="{$tempdir|escape}" />
								<input type="submit" name="_mode_{$param.controller|escape}_save_confirm_" value="確認画面へ進む" />
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
							<li>※画像は自動的に縮小されます。</li>
							<li>※画像は{$upload_max_filesize}の容量まで登録できますが、エラーが出る場合は予め縮小してから登録してください。</li>
						</ul>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

