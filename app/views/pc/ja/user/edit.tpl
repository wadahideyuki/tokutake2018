{assign var='page_title' value='ユーザー'}
{include file='../adminHeader.tpl' title='管理ユーザー情報編集・新規登録'}
{focus form='user_edit' field='username'}

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>ユーザー管理</h3>
			<ul>
				<li><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
				{if $waitingUser}<li><a href="{$appPath}/{$param.controller}/approvallist/"><span>承認待ちユーザー（{$waitingUser}）</span></a></li>{/if}
				<li{$value.id|if:'':' class="active"'}><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		<form action="{self}" method="post" name="user_edit" autocomplete="off">

			{$isError|if:'<div class="error">エラー ： 赤枠で表示中の項目をご確認ください</div>':''}

			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th colspan="2" class="topHead top">■ユーザー情報{$value.id|if:'編集':'新規登録'}フォーム</th>
						</tr>
						{if $value.id}
						<tr>
							<th class="sideHead">No.</th>
							<td>
								{$value.id|digit:'04'|escape}
								<input type="hidden" name="id"  value="{$value.id}" />
							</td>
						</tr>
						{/if}
						<tr>
							<th class="sideHead">ユーザー名<span class="required">*</span></th>
							<td>
								{$error.class.name}
								<input type="text" name="name" value="{$value.name|escape}" class="w256 ime-active" />
								{$error.msg.name}
							</td>
						</tr>
						<tr>
							<th class="sideHead">ユーザー名フリガナ<span class="required">*</span></th>
							<td>
								{$error.class.name_kana}
								<input type="text" name="name_kana" value="{$value.name_kana|escape}" class="w256 ime-active" />
								{$error.msg.name_kana}
							</td>
						</tr>
						<tr>
							<th class="sideHead">管理レベル<span class="required">*</span></th>
							<td>
								<div class="radio">
									{$error.class.level}
									{html_radios name=level options=$_levels selected=$value.level}
									{$error.msg.level}
								</div>
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
							<th class="sideHead">パスワード{if !$value.id}<span class="required">*</span>{/if}</th>
							<td>
								{$error.class.password}
								<input type="password" name="password" value="{$value.password|escape}" class="w128 ime-inactive" />
								{$value.id|if:'※変更しない場合は空欄のままにしてください':''}
								{$error.msg.password}
								<br/>
								{$error.class.password_confirm}
								<input type="password" name="password_confirm" value="{$value.password_confirm|escape}" class="w128 ime-inactive" />
								※確認のためもう一度入力してください
								{$error.msg.password_confirm}
							</td>
						</tr>
						<tr>
							<th class="sideHead">
								状態
							</th>
							<td>
								{$error.class.status}
								<label>
									<input name="status" type="checkbox" value="1"{checked var=$value.status  value='1'} />
									アクティブ
								</label>
								{$error.msg.status}
							</td>
						</tr>

						{if $session.userLevel >= 5 && $value.id}
						<tr>
							<th class="sideHead">最終ログイン</th>
							<td>
								<p class="note">
									{$loginrecord.created|date_format:'Y年m月d日 H時i分s秒'|default:'まだログインしていません'}
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">接続IP</th>
							<td>
								<p class="note">
									{$loginrecord.login_ip|escape|default:$tpl_value.default}
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">リモートホスト</th>
							<td>
								<p class="note">
									{$loginrecord.remote_host|escape|default:$tpl_value.default}
								</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">ユーザーエージェント</th>
							<td>
								<p class="note">
									{$loginrecord.user_agent|escape|default:$tpl_value.default}
								</p>
							</td>
						</tr>
						{/if}

						<tr>
							<th colspan="2" class="bottomHead">
								<input type="submit" name="_mode_{$param.controller}_save_confirm_" value="確認画面へ進む" class="btn" />
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
					{if $session.userLevel >= 5 && $value.id}
					<li>※接続IP・リモートホスト・ユーザーエージェントは最終ログイン時の情報を表示しています。</li>
					{/if}
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}
