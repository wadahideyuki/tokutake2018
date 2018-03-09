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
								氏名
							</th>
							<td>
								{$value.name|escape}
								<input name="name" type="hidden" value="{$value.name|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								肩書き
							</th>
							<td>
								{$value.position|escape}
								<input name="position" type="hidden" value="{$value.position|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								特徴
							</th>
							<td>
								{$value.speciality|escape|nl2br|default:$tpl_value.default}
								<input name="speciality" type="hidden" value="{$value.speciality|escape}" />
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								コメント
							</th>
							<td>
								{$value.body|escape|nl2br|default:$tpl_value.default}
								<input name="body" type="hidden" value="{$value.body|escape}" />
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

