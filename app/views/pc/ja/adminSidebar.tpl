
		<div id="sidebarContainer">

			<div id="navcontainer">

		{if $session.login}

				<div class="loginUser">
					{loginuser namespace='app'}
				</div>

				<div class="loginout">{loginout namespace='app' appPath=$appPath}</div>

				<div class="menuBlock">
					<ul>
						<li{active_class ctrl='admin' act='index'}><a href="{$appPath}/admin/"><img src="{$appPath}/images/sys/tree.png" alt="" />トップ</a></li>
						<li{active_class ctrl='user' act='account,viewconfig,accountsave,saveviewconfig'}><a href="{$appPath}/user/account/"><img src="{$appPath}/images/sys/user_page.png" alt="" />マイアカウント</a></li>
					</ul>
				</div>

			{if !($param.controller == 'admin' && $param.action == 'index')}

				{if $session.userLevel >= 3}
				<div class="menuBlock">
					<h2><img src="{$appPath}/images/sys/sort_desc.png" alt="" /> コンテンツ管理</h2>
					<ul>
						<li{active_class ctrl='image'   }><a href="{$appPath}/image/list/"      ><img src="{$appPath}/images/sys/images.png"       alt="" />トップページ画像</a></li>
						<li{active_class ctrl='info'    }><a href="{$appPath}/info/list/?type=1"><img src="{$appPath}/images/sys/information.png"  alt="" />NEWS</a></li>
						<li{active_class ctrl='product' }><a href="{$appPath}/product/list/"    ><img src="{$appPath}/images/sys/home.png"         alt="" />施工事例</a></li>
						<li{active_class ctrl='event'   }><a href="{$appPath}/event/list/"      ><img src="{$appPath}/images/sys/calendar.png"     alt="" />見学会・イベント</a></li>
						<li{active_class ctrl='voice'   }><a href="{$appPath}/voice/list/"      ><img src="{$appPath}/images/sys/user_comment.png" alt="" />お客様の声</a></li>
						<li{active_class ctrl='faq'     }><a href="{$appPath}/faq/list/"        ><img src="{$appPath}/images/sys/comments.png"     alt="" />よくある質問</a></li>
						<li{active_class ctrl='staff'   }><a href="{$appPath}/staff/list/"      ><img src="{$appPath}/images/sys/staff.png"        alt="" />スタッフ紹介</a></li>
					</ul>
				</div>
				{/if}

				{if $session.userLevel >= 4}
				<div class="menuBlock">
					<h2><img src="{$appPath}/images/sys/sort_desc.png" alt="" /> ユーザー管理</h2>
					<ul>
						<li{active_class ctrl='user' act='list,edit,save,reedit'}><a href="{$appPath}/user/list/"><img src="{$appPath}/images/sys/administrator.png" alt="" />管理ユーザー</a></li>
						{if $session.userLevel >= 5}
						<li{active_class ctrl='usage'}><a href="{$appPath}/usage/"><img src="{$appPath}/images/sys/group_key.png" alt="" />利用状況</a></li>
						{/if}
					</ul>
				</div>
				{/if}

				{if $session.userLevel >= 5}
				<div class="menuBlock">
					<h2><img src="{$appPath}/images/sys/sort_desc.png" alt="" /> システム管理</h2>
					<ul>
						<li{active_class ctrl='admin' act='config'}><a href="{$appPath}/admin/config/"><img src="{$appPath}/images/sys/changeset.png" alt="" />設定</a></li>
						<li{active_class ctrl='tool,backup'}><a href="{$appPath}/tool/"><img src="{$appPath}/images/sys/tools.png" alt="" />ツール</a></li>
						<li{active_class ctrl='help,error'}><a href="{$appPath}/help/" ><img src="{$appPath}/images/sys/report.png" />情報</a></li>
					</ul>
				</div>
				{/if}
			{/if}
		{/if}
			</div>
		</div>
