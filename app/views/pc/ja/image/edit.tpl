{include file='../adminHeader.tpl' title='トップページ画像管理'}

<script type="text/javascript" src="{$appPath}/js/jquery.upload-1.0.2.js"></script>
<script type="text/javascript" src="{$appPath}/js/imgup.js.php?_crop_aspect={$_crop_aspect}"></script>
<script type="text/javascript" src="{$appPath}/js/jquery.Jcrop.min.js"></script>
<link   type="text/css" rel="stylesheet" href="{$appPath}/css/jquery.Jcrop.css" />

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>トップページ画像管理</h3>
			<ul>
				<li><a href="{$appPath}/image/list/"><span>一覧</span></a></li>
				<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/image/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		<form enctype="multipart/form-data" action="{self}" method="post" id="info_save_edit">
			<div class="editForm">
				{$isError|if:'<div class="error">エラー ： 赤枠で表示中の項目をご確認ください</div>':''}
				<table>
					<tbody>
						<tr>
							<th class="topHead top">
								■{$value.id|if:'編集':'新規登録'}フォーム
							</th>
						</tr>
						<tr>
							<th class="sideHead">
								画像
							</th>
						</tr>
					</tbody>
				</table>


								{if $value.preview_img && $_newPImgName}
									<div class="img_cover">
										<p>トップページ掲載用画像</p>
										<img src="{$_newPImgName}" />
									</div>
								{elseif $_newImgName}
									<div class="img_cover" style="position:relative;width:638px;">
										<p>トップページ掲載用画像</p>
										<img src="{$_newImgName}" />
										<div class="caption_img_cover">{$value.caption|escape|nl2br}</div>
									</div>
								{/if}

								<div id="img_preview">
									<input type="hidden" name="preview_img" value="{$value.preview_img|escape}" />
									{if !$value.preview_img && $_originalSImgName}
										<p>元画像</p>
										<img src="{$_originalSImgName}" id="cropbox" />
									{elseif $_srcSImgName}
										<p>元画像</p>
										<img src="{$_srcSImgName}" id="cropbox" />
									{/if}
								</div>
								<div>
									<input type="file" name="src" id="img_src" size="64" />
								</div>
								<p class="note">
									※画像を参照後、画像のトリミングしたい位置を左上よりドラッグして切り取り位置を選択してください。
								</p>
								{$error.class.src_img}
								{$error.msg.src_img}

				<table>
					<tbody>
						<tr>
							<th class="sideHead">
								リンクURL
							</th>
							<td>
								{$error.class.url}
								<input name="url" type="text" value="{$value.url|escape}" class="w100p ime-inactive" />
								{$error.msg.url}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								キャプション
							</th>
							<td>
								{$error.class.caption}
								<textarea name="caption" class="ime-active monospace">{$value.caption|escape}</textarea>
								{$error.msg.caption}
							</td>
						</tr>
{*
						<tr>
							<th class="sideHead">
								フォント色
							</th>
							<td>
								<div class="radio">
								{$error.class.font_color}
								{html_radios name='font_color' options=$_font_colors selected=$value.font_color}
								{$error.msg.font_color}
								</div>
							</td>
						</tr>
						*}
						<tr>
							<th class="sideHead">
								ロゴ
							</th>
							<td>
								<label>
									<input name="logo" type="checkbox" value="1"{checked var=$value.logo  value='1'} />
									OMソーラー
								</label>
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
								<input type="hidden" name="x" value="{$value.x|escape}" id="x" />
								<input type="hidden" name="y" value="{$value.y|escape}" id="y" />
								<input type="hidden" name="w" value="{$value.w|escape}" id="w" />
								<input type="hidden" name="h" value="{$value.h|escape}" id="h" />

								<input type="hidden" name="id"                       value="{$value.id|escape}" />
								<input type="hidden" name="type"                     value="{$param.type|escape}" />
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
							<li>※[表示] 欄にのチェックを外した画像は表示されません。</li>
						</ul>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}