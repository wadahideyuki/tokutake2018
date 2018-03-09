{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		<div id="tabs" class="clearfix">
			<h3>{$_title|cat:'管理'}</h3>
			<ul>
				<li class="active"><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
				<li><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		<div class="controls clearfix">
			<form action="{$appPath}/{$param.controller}/list/" method="post" name="extract" class="right_btn">
				表示件数：{html_options name='rows' options=$rowsSelect selected=$pageParams.rows onchange='extract'}
				{query_string}
			</form>
			<form action="{$appPath}/{$param.controller}/list/" method="post" name="keyword_search" class="right_btn">
				キーワード検索：
				<input type="text" name="key" id="prdcode" value="{$param.key|escape|urldecode}" class="w128" />
				<input type="submit" value="検索" />
				<!--<input type="submit" name="clear" value="解除" />-->
				{query_string}
			</form>
		</div>

		<form action="{self}" method="post">

			<div class="editForm">
	
				{pager pageParams=$pageParams}
	
				<table>
					<tbody>
						<tr class="topHead">
							<th class="topleft">画像</th>
							<th>{qry_link col='name' alt='氏名'}</th>
							<th>{qry_link col='position' alt='肩書き'}</th>
							<th>{qry_link col='body' alt='コメント'}</th>
							<th>{qry_link col='row_order' alt='表示順'}</th>
							<th class="ctr">{qry_link col='status' alt='表示'}</th>
							<th class="ctr topright">操作</th>
						</tr>
	
						{section name=each loop=$value}
	
						<tr class="{cycle values='odd,even'}">
<!--
							<td>
								{$value[each].created|date_format:'Y/m/d'}
							</td>
-->
							<td class="w64 ctr">
								{if $value[each].thumb}
								<img src="{$value[each].thumb}?{1|rand:99999}" width="62" />
								{else}
								<img src="{$appPath}/images/staff/noimage_s.jpg" width="62" />
								{/if}
							</td>
							<td>
								{$value[each].name|strip_tags|mbtruncate:'20':'...'}
							</td>
							<td>
								{$value[each].position|escape|mbtruncate:'18':'...'|default:$tpl_value.default}
							</td>
							<td>
								{$value[each].body|strip_tags|escape|mbtruncate:'18':'...'|default:$tpl_value.default}
							</td>
							<td class="ctr">
									<input type="text" name="roworders[{$value[each].id}]" value="{$value[each].row_order|escape}" tabindex="{$smarty.section.each.iteration}" class="w32 ctr ime-inactive" />
								</td>
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
							<td colspan="7" class="nodata">
								該当するデータがありません。
							</td>
						</tr>
	
						{/section}
	
					</tbody>
				</table>
		
				{pager pageParams=$pageParams}
	
			</div>
	
			{if $value}
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
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

