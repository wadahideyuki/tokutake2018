{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

			<div id="tabs" class="clearfix">
				<h3>{$_title}</h3>
				<ul>
					<li class="active"><a href="{$appPath}/tool/"><span>一覧</span></a></li>
				</ul>
			</div>

			<div class="controls clearfix">
				<form action="{$appPath}/{$param.controller}/makeform/" method="post" name="extract" class="right_btn">
					テーブル：{html_options name='table' options=$_tables selected=$param.table onchange='extract'}
					{query_string}
				</form>
			</div>

			<div class="editForm">

				<h4>入力フォーム用</h4>
				<textarea style="width:99%;height:500px">{$form}</textarea>

				<h4>確認画面用</h4>
				<textarea style="width:99%;height:500px">{$form_confirm}</textarea>

			</div>

			<div id="helpDescription">
				<div class="helpSpace">
					<ul>
						<li>※[テーブル] を選択するとそのテーブル用フォームのHTMLテンプレートが表示されます。コピーしてご利用ください。</li>
					</ul>
				</div>
			</div>

	</div>
</div>

{include file='../adminSidebar.tpl' sidemenu = 'master'}
{include file='../adminFooter.tpl' pagetopLink=1}
