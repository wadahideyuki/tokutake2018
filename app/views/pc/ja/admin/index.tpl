{include file='../adminHeader.tpl'}

	<div id="contentContainer">
		<div id="content">
			<div class="mainMenuBlock">

				<h3>{$_title}</h3>

				<table>
					<tbody>

						{if $session.userLevel >= 3}
						<tr>
							<th>コンテンツ管理</th>
							<td>
								<a href="{$appPath}/image/list/"      ><img src="{$appPath}/images/sys/images.png"       alt="" />トップページ画像</a>
								<a href="{$appPath}/info/list/?type=1"><img src="{$appPath}/images/sys/information.png"  alt="" />NEWS</a>
								<a href="{$appPath}/product/list/"    ><img src="{$appPath}/images/sys/home.png"         alt="" />施工事例</a>
								<a href="{$appPath}/event/list/"      ><img src="{$appPath}/images/sys/calendar.png"     alt="" />見学会・イベント</a>
								<a href="{$appPath}/voice/list/"      ><img src="{$appPath}/images/sys/user_comment.png" alt="" />お客様の声</a>
								<a href="{$appPath}/faq/list/"        ><img src="{$appPath}/images/sys/comments.png"     alt="" />よくある質問</a>
								<a href="{$appPath}/staff/list/"      ><img src="{$appPath}/images/sys/staff.png"        alt="" />スタッフ紹介</a>
							</td>
						</tr>
						{/if}

						{if $session.userLevel >= 4}
						<tr>
							<th>ユーザー管理</th>
							<td>
								<a href="{$appPath}/user/list/"><img src="{$appPath}/images/sys/administrator.png" alt="" />管理ユーザー</a>
								{if $session.userLevel >= 5}
								<a href="{$appPath}/usage/"    ><img src="{$appPath}/images/sys/group_key.png"     alt="" />利用状況</a>
								{/if}
							</td>
						</tr>
						{/if}

						{if $session.userLevel >= 5}
						<tr>
							<th>システム管理</th>
							<td>
								<a href="{$appPath}/admin/config/"><img src="{$appPath}/images/sys/changeset.png" alt="" />設定</a>
								<a href="{$appPath}/tool/"        ><img src="{$appPath}/images/sys/tools.png"     alt="" />ツール</a>
								<a href="{$appPath}/help/"        ><img src="{$appPath}/images/sys/report.png"    alt="" />情報</a>
							</td>
						</tr>
						{/if}

						<tr class="bottom">
							<th>情報</th>
							<td>
								<a href="http://www.google.com/analytics/" target="_blank" title="Google Analytics のページにジャンプします"><img src="{$appPath}/images/sys/chart.png" alt="" />アクセス解析</a>
							</td>
						</tr>

					</tbody>
				</table>

			</div>
		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink='0'}
