{include file="../adminHeader.tpl" title="管理ユーザー情報編集・新規登録"}

	<div id="contentContainer">
		<div id="content">

			<div id="tabs" class="clearfix">
				<h3>ユーザー管理</h3>
				<ul>
					<li><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
					<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
				</ul>
			</div>

			<form action="{self}" method="post">
				<div class="editForm">

					<div class="formConfirm">
						※以下の内容でよろしければ[{$value.id|if:'更新':'登録'}]ボタンをクリックしてください。<br />
						※修正する場合は[戻る]ボタンをクリックしてください。
					</div>

					<table>
						<tbody>
							<tr>
								<th colspan="2" class="topHead top">
									■ユーザー情報{$value.id|if:'編集':'新規登録'}（確認）
								</th>
							</tr>
							<tr>
								<th class="sideHead">No.</th>
								<td>
									{$value.id|digit:'04'|escape}
									<input type="hidden" name="id"  value="{$value.id}" />
								</td>
							</tr>
							<tr>
								<th class="sideHead">ユーザー名</th>
								<td>
									{$value.name|escape}
									<input type="hidden" name="name" value="{$value.name|escape}" />
								</td>
							</tr>
							<tr>
								<th class="sideHead">ユーザー名フリガナ</th>
								<td>
									{$value.name_kana|escape|default:$tpl_value.default}
									<input type="hidden" name="name_kana" value="{$value.name_kana|escape}" />
								</td>
							</tr>
							<tr>
								<th class="sideHead">管理レベル</th>
								<td>
									<div class="radio">
										{html_radios name=level options=$_levels selected=$value.level mode='conf'}
									</div>
								</td>
							</tr>
							<tr>
								<th class="sideHead">メールアドレス</th>
								<td>
							 		{$value.mail|escape}
									<input type="hidden" name="mail" value="{$value.mail|escape}" />
								</td>
							</tr>
							<tr>
								<th class="sideHead">パスワード</th>
								<td>
									{$value.password|pwdhide|escape|default:$tpl_value.default}
									<input type="hidden" name="password"         value="{$value.password|escape}" />
									<input type="hidden" name="password_confirm" value="{$value.password_confirm|escape}" />
								</td>
							</tr>
							<tr>
								<th class="sideHead">
									状態
								</th>
								<td>
									{$value.status|if:'アクティブ':'ロック'}
									<input name="status" type="hidden" value="{$value.status|escape|default:'0'}" />
								</td>
							</tr>
							<tr>
								<th colspan="2" class="bottomHead">
									<input type="submit" name="_mode_{$param.controller}_save_"       value="{$value.id|if:'更　新':'登　録'}" class="btn" />
									<input type="submit" name="_mode_{$param.controller}_save_reedit" value="戻　る"                           class="btn" />
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
