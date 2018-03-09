{include file='../adminHeader.tpl' title='トップページ画像管理'}

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>トップページ画像管理</h3>
			<ul>
				<li><a href="{$appPath}/image/list/"><span>一覧</span></a></li>
				<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/image/edit/{editnew}"><span>新規登録</span></a></li>
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
						<tr>
							<th class="sideHead">
								画像
							</th>
							<td>
								{if $_newPImgName}
								<div class="img_cover" style="position:relative;width:638px;">
									<img src="{$_newPImgName}" />
									<div class="caption_img_cover">{$value.caption|escape|nl2br}</div>
								<div class="img_cover" style="position:relative;width:638px;">
								{/if}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								リンクURL
							</th>
							<td>
								{$value.url|escape|url2link:'_blank'|default:'--'}
								<input name="url" type="hidden" value="{$value.url|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								キャプション
							</th>
							<td>
								{$value.caption|escape|nl2br}
								<input name="caption" type="hidden" value="{$value.caption|escape}" />
							</td>
						</tr>
{*
						<tr>
							<th class="sideHead">
								フォント色
							</th>
							<td>
								<div class="radio">
								{html_radios name='font_color' options=$_font_colors selected=$value.font_color mode='conf'}
								</div>
							</td>
						</tr>
						*}
						<tr>
							<th class="sideHead">
								ロゴ
							</th>
							<td>
								{$value.logo|if:'OMソーラー':'非表示'}
								<input name="logo" type="hidden" value="{$value.logo|escape}" />
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
								<input type="hidden" name="x" value="{$value.x|escape}" id="x" />
								<input type="hidden" name="y" value="{$value.y|escape}" id="y" />
								<input type="hidden" name="w" value="{$value.w|escape}" id="w" />
								<input type="hidden" name="h" value="{$value.h|escape}" id="h" />

								<input type="hidden" name="id"                       value="{$value.id|escape}" />
								<input type="hidden" name="tempdir"                  value="{$tempdir|escape}" />
								<input type="hidden" name="preview_img"              value="{$value.preview_img|escape}" />
								<input type="submit" name="_mode_{$param.controller}_save_"       value="{$value.id|if:'更　新':'登　録'}" class="submitBtn" />
								<input type="submit" name="_mode_{$param.controller}_save_reedit" value="再編集" class="backBtn" />
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
							{if $info_config.info_images}
							<li>※画像は自動的に縮小されます。</li>
							<li>※画像はの容量まで登録できますが、エラーが出る場合は予め縮小してから登録してください。</li>
							{/if}
							{if $info_config.info_files}
							<li>※容量がを超えるファイルは登録できません。</li>
							<li>※ファイル名が日本語のファイルを登録する場合はファイル名を27文字以内としてください。</li>
							{/if}
						</ul>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}