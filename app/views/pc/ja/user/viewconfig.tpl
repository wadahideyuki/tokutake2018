{include file='../adminHeader.tpl' title='表示条件の変更'}
{focus form='user_viewconfig' field='font_size'}
{dialogbox flashMsg=$flashMsg  msgType=$msgType}

<div id="contentContainer">
	<div id="content">

		{footpath category_name='アカウント'}

		<div id="tabs" class="clearfix">
			<h3>マイアカウント</h3>
			<ul>
				<li><a href="{$appPath}/{$param.controller}/account/"><span>登録情報の変更</span></a></li>
				<li class="active"><a href="{$appPath}/{$param.controller}/viewconfig/"><span>表示設定</span></a></li>
			</ul>
		</div>

		<form action="{$appPath}/{$param.controller}/saveviewconfig/" method="post" name="user_viewconfig">

			{if $isError}
			<div class="error">
				エラー ： 赤枠で表示中の項目をご確認ください
			</div>
			{/if}

			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th colspan="2" class="topHead top">■表示条件編集フォーム</th>
						</tr>
						<tr>
							<th class="sideHead">フォントサイズ</th>
							<td>
								{$error.class.font_size}
								<input type="text" name="font_size" value="{$value.font_size|escape}" class="w32 ime-inactive" />
								％
								{$error.msg.font_size}
								<p class="note">
									※ユーザーごとのフォントサイズを設定できます。以下を参考にパーセンテージを指定してください。<br />
									大　：113% (18px)<br />
									標準：100% (16px)<br />
									中　： 88% (14px)<br />
									小　： 75% (12px)
								</p>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="submit" name="_mode_{$param.controller}_saveviewconfig" value="更　新" class="btn" />
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
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}
