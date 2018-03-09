
			<div id="tabs" class="clearfix">
				<h3>{$_title}</h3>
				<ul>
					<li{if $param.type == 'login' or $param.type == ''} class="active"{/if}><a href="{$appPath}/admin/config/?type=login"><span>全般</span></a></li>
					<li{if $param.type == 'top'}      class="active"{/if}><a href="{$appPath}/admin/config/?type=top"    ><span>トップページ</span></a></li>
					<li{if $param.type == 'info'}     class="active"{/if}><a href="{$appPath}/admin/config/?type=info"   ><span>お知らせ情報</span></a></li>
					<li{if $param.type == 'product'}  class="active"{/if}><a href="{$appPath}/admin/config/?type=product"><span>施工事例</span></a></li>
					<li{if $param.type == 'event'}    class="active"{/if}><a href="{$appPath}/admin/config/?type=event"  ><span>見学会・イベント</span></a></li>
					<li{if $param.type == 'voice'}    class="active"{/if}><a href="{$appPath}/admin/config/?type=voice"  ><span>お客様の声</span></a></li>
					<li{if $param.type == 'faq'}      class="active"{/if}><a href="{$appPath}/admin/config/?type=faq"    ><span>よくある質問</span></a></li>
				</ul>
			</div>

			<div id="tabs" class="clearfix">
				<ul style="padding:0 0 0 10px;">
					<li{if $param.type == 'publicholiday'} class="active"{/if}><a href="{$appPath}/admin/config/?type=publicholiday"><span>祝日</span></a></li>
					<li{if $param.type == 'mail'}          class="active"{/if}><a href="{$appPath}/admin/config/?type=mail"><span>メール基本</span></a></li>
					<li{if $param.type == 'mailform'}      class="active"{/if}><a href="{$appPath}/admin/config/?type=mailform"><span>メールフォーム</span></a></li>
					<li{if $param.type == 'view'}          class="active"{/if}><a href="{$appPath}/admin/config/?type=view"    ><span>管理画面表示</span></a></li>
				</ul>
			</div>
