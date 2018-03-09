{include file='../adminHeader.tpl'}

<script type="text/javascript" src="{$appPath}/js/ckeditor/ckeditor.js"></script>

<style type="text/css" media="screen">
	#cke_1_top, #cke_1_bottom {
		display:none;
		visibility: hidden;
	}
	.cke_chrome {
		border: 0;
		box-shadow: none;
		background-color: #F6F6F6;
	}
</style>

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
								{$value.created|escape}
								<input name="created" type="hidden" value="{$value.created|escape}" />
							</td>
						</tr>
						{/if}
						<tr>
							<th class="sideHead">
								一覧ページのキャッチフレーズ
							</th>
							<td>
								{$value.voice|escape|default:'--'}
								<input name="voice" type="hidden" value="{$value.voice|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								冒頭の説明文
							</th>
							<td>
								{$value.descriptions|escape|nl2br|default:'--'}
								<input name="descriptions" type="hidden" value="{$value.descriptions|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								タイトル
							</th>
							<td>
								{$value.title|escape|default:'--'}
								<input name="title" type="hidden" value="{$value.title|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								建設地
							</th>
							<td>
								{$value.place|escape|default:'--'}
								<input name="place" type="hidden" value="{$value.place|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								本文
							</th>
							<td>
								{*$value.body|default:'--'*}
								<textarea id="ckeditor" class="ckeditor" name="body">{$value.body|replace:'\&quot;':''|replace:'\"':''}</textarea>
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								画像
							</th>
							<td id="imageUp">
								{$images}
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

