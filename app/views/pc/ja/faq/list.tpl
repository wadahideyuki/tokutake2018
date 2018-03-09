{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		{footpath}

		<div id="tabs" class="clearfix">
			<h3>{$_title|cat:'管理'}</h3>
			<ul>
				<li class="active"><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
				<li><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		{*msgbox flashMsg=$flashMsg  msgType=$msgType*}

		<div class="controls clearfix">

			<form action="{$appPath}/{$param.controller}/list/" method="post" name="extract" class="right_btn">
				表示件数：{html_options name='rows' options=$rowsSelect selected=$pageParams.rows onchange='extract'}
				{query_string}
			</form>
			<form action="{$appPath}/{$param.controller}/list/" method="post" name="keyword_search" class="right_btn">
				キーワード検索：
				<input type="text" name="key" id="prdcode" value="{$param.key|escape|urldecode}" class="w128" />
				<input type="submit" value="検索" />
				{query_string}
			</form>
			<form action="{$appPath}/{$param.controller}/list/" method="post" name="type" class="right_btn">
				カテゴリ：{html_options name='type' options=$metafile.faqs selected=$param.type onchange='type' novalue='--'}
				{query_string}
			</form>
		</div>

		<form action="{self}" method="post">

			<div class="editForm">
	
				{pager pageParams=$pageParams}
	
				<table>
					<tbody>
						<tr class="topHead">
							<th class="topleft">{qry_link col='created' alt='登録年月日'}</th>
							<th>{qry_link col='title' alt='質問'}</th>
							<th>{qry_link col='body' alt='回答'}</th>
							{if $param.type && $param.type}
							<th>{qry_link col='row_order' alt='表示順'}</th>
							{else}<th>{qry_link col='type' alt='カテゴリ'}</th>
							
							{/if}
							<th class="ctr">{qry_link col='status' alt='表示'}</th>
							<th class="ctr topright">操作</th>
						</tr>
	
						{section name=each loop=$value}
	
						<tr class="{cycle values='odd,even'}">
							<td>
								{$value[each].created|date_format:'Y/m/d'}
							</td>
							<td>
								<a href="{$appPath}/{$param.controller}/listup/#q{$value[each].id}" class="external" target="_blank">{$value[each].title|strip_tags|mbtruncate:'20':'...'}</a>
							</td>
							<td>
								{$value[each].body|strip_tags|escape|mbtruncate:'18':'...'|default:$tpl_value.default}
							</td>
							{if $param.type && $param.type}
							<td class="ctr">
								<input type="text" class="w32 ctr ime-inactive" value="{$value[each].row_order|escape}" name="roworders[{$value[each].id|escape}]">
							</td>
							{else}
							<td>
								{$value[each].type|replacearr:$metafile.faqs}
							</td>
							{/if}
							<td class="ctr">
								{if $value[each].status}<img src="{$appPath}/images/sys/toggle_check.png" />{else}&nbsp;{/if}
							</td>
							<td class="nowrap_ctr">
								<a href="{$appPath}/{$param.controller}/edit/?id={$value[each].id|escape}" class="edit">編集</a>
								<a href="{$appPath}/{$param.controller}/delete/?id={$value[each].id|escape}" onclick="return diag('「{$value[each].title|escape}」を削除してよろしいですか？')" class="delete">削除</a>
							</td>
						</tr>
	
						{sectionelse}
	
						<tr>
							<td colspan="6" class="nodata">
								該当するデータがありません。
							</td>
						</tr>
	
						{/section}
	
					</tbody>
				</table>
		
				{pager pageParams=$pageParams}
	
			</div>

			{if $value && $param.type}
			<div class="clearfix">
				<div class="right_btn">
					<input type="submit" name="_mode_{$param.controller}_sort_" value="表示順変更" class="btn" />
				</div>
			</div>
			{/if}

		</form>

		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>※[表示]欄に<img src="{$appPath}/images/sys/toggle_check.png" />のある情報のみ表示されます。</li>
					<li>※新規に登録する場合は、[新規登録] タブをクリックして必要な情報を入力してください。</li>
					<li>※表示順を変更する場合は、カテゴリを選択して表示順を記入した後 [表示順変更] ボタンをクリックしてください。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

