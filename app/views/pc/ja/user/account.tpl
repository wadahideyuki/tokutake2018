{include file='../adminHeader.tpl' title='登録情報の変更'}
{focus form='user_accountsave' field='mail'}
{dialogbox flashMsg=$flashMsg  msgType=$msgType}

<div id="contentContainer">
	<div id="content">

		{footpath}

		<div id="tabs" class="clearfix">
			<h3>マイアカウント</h3>
			<ul>
				<li class="active"><a href="{$appPath}/{$param.controller}/account/"><span>登録情報の変更</span></a></li>
				<li><a href="{$appPath}/{$param.controller}/viewconfig/"><span>表示設定</span></a></li>
			</ul>
		</div>

		<form action="{$appPath}/{$param.controller}/accountsave/" method="post" name="user_accountsave" autocomplete="off">

			{$isError|if:'<div class="error">エラー ： 赤枠で表示中の項目をご確認ください</div>':''}

			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th colspan="2" class="topHead top">■登録情報編集フォーム</th>
						</tr>
						<tr>
							<th class="sideHead">ユーザー名</th>
							<td>
								{$value.name|escape}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メールアドレス<span class="required">*</span></th>
							<td>
								{$error.class.mail}
								<input type="text" name="mail" value="{$value.mail|escape}" class="w256 ime-inactive" />
								{$error.msg.mail}
							</td>
						</tr>
						<tr>
							<th class="sideHead">パスワード</th>
							<td>
								{$error.class.password}
								<input type="password" name="password" value="{$value.password|escape}" class="w128 ime-inactive" autocomplete="off" />
								※変更しない場合は空欄のままにしてください
								{$error.msg.password}
								<br/>
								{$error.class.password_confirm}
								<input type="password" name="password_confirm" value="{$value.password_confirm|escape}" class="w128 ime-inactive" />
								※確認のためもう一度入力してください
								{$error.msg.password_confirm}
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="submit" name="_mode_{$param.controller}_accountsave" value="更　新" />
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</form>

		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>※<span class="required">*</span>印は必須項目です。</li>
					<li>※他のユーザーと同じメールアドレスは利用できません。</li>
				</ul>
			</div>
		</div>

	</div>
</div>
{include file="../adminSidebar.tpl"}
{include file="../adminFooter.tpl"}
