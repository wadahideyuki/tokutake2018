{include file='../adminHeader.tpl'}
{*debug*}

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

		<div class="editForm">

			{pager pageParams=$pageParams}

			<table>
				<tbody>
					<tr class="topHead">
						<th class="topleft">{qry_link col='created' alt='登録年月日'}</th>
						<th>{qry_link col='title' alt='タイトル'}</th>
						<th>{qry_link col='descriptions' alt='冒頭の説明文'}</th>
						<th class="ctr">{qry_link col='status' alt='表示'}</th>
						<th class="ctr topright">操作</th>
					</tr>

					{section name=each loop=$value}

					<tr class="{cycle values='odd,even'}">
						<td>
							{$value[each].created|date_format:'Y/m/d'}
						</td>
						<td>
							<a href="{if $value[each].url}{$value[each].url}{else}{$appPath}/{$param.controller}/detail/?id={$value[each].id}{/if}" class="external" target="_blank">{$value[each].title|strip_tags|mbtruncate:'20':'...'}</a>
							{if $value[each].url}<img src="{$appPath}/images/sys/link_go.png" class="icon" />{/if}
						</td>
						<td>
							{$value[each].descriptions|strip_tags|escape|mbtruncate:'18':'...'|default:$tpl_value.default}
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
						<td colspan="5" class="nodata">
							該当するデータがありません。
						</td>
					</tr>

					{/section}

				</tbody>
			</table>
	
			{pager pageParams=$pageParams}

		</div>

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

