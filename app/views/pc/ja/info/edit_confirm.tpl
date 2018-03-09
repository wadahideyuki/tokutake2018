{include file='../adminHeader.tpl'}
{if $info_config.info_wysiwyg}{tinymce mode='conf'}{/if}

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
							<th colspan="2" class="topHead">
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
							<th class="sideHead">
								本文
							</th>
							<td>
								{if $info_config.info_wysiwyg}
								<textarea id="elm1" name="body" cols="50" rows="5" class="p96">{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
								{else}
								{$value.body|escape|nl2br|default:$tpl_value.default}
								<input name="body" type="hidden" value="{$value.body|escape}" />
								{/if}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								リンクURL
							</th>
							<td>
								{$value.url|url2link:'_blank'|default:$tpl_value.default}
								<input name="url" type="hidden" value="{$value.url|escape}" />
							</td>
						</tr>
						{if $info_config.info_files}
						<tr id="fileUp">
							<th class="sideHead">
								ファイル
							</th>
							<td>
									{$files|default:$tpl_value.default}
									{$error.class.files}
									{$error.msg.files}
									{*<p class="note">※添付ファイルは{$info_config.info_files|escape}個まで登録できます。</p>*}
									{if $has_pdf}
									<div class="radio">
										<label>
											<input name="direct_link" type="checkbox" value="1"{checked var=$value.direct_link  value='1'} />
											PDFへ直接リンクする（詳細ページを生成しない）
										</label>
									</div>
									{/if}
							</td>
						</tr>
						{/if}
						{if $info_config.info_images}
						<tr id="imageUp">
							<th class="sideHead">
								画像
							</th>
							<td>
								{$images}
							</td>
						</tr>
						{/if}
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

