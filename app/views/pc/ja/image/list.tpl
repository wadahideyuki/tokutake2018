{include file='../adminHeader.tpl' title='情報一覧'}
{*debug*}

<div id="contentContainer">
	<div id="content">

		{footpath}

		<div id="tabs" class="clearfix">
			<h3>トップページ画像管理</h3>
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
							<th class="topleft">{qry_link col='title' alt='画像'}</th>
							<th>{qry_link col='url' alt='リンクURL / キャプション'}</th>
							<th>{qry_link col='row_order' alt='表示順'}</th>
							<th class="ctr">{qry_link col='status' alt='表示'}</th>
							<th class="ctr topright w64">操作</th>
						</tr>

						{section name=each loop=$value}

						<tr class="{cycle values='odd,even'}">
							<td class="w128 ctr">
								<a href="{$appPath}/images/index/{$value[each].id|escape}/cover.jpg">
									<img src="{$appPath}/images/index/{$value[each].id|escape}/cover.jpg?{1|rand:99999}" width="126" />
								</a>
							</td>
							<td>
								{if $value[each].url}<a href="{$value[each].url|escape}" class="external">{$value[each].url|escape}</a>{/if}
								{if $value[each].caption}<div style="margin-top:2px;">{$value[each].caption|escape|nl2br}</div>{/if}
							</td>
							<td class="ctr">
								<input type="text" name="roworders[{$value[each].id}]" value="{$value[each].row_order|escape}" tabindex="{$smarty.section.each.iteration}" class="w32 ctr ime-inactive" />
							</td>
							<td class="ctr">
								{if $value[each].status}<img src="{$appPath}/images/sys/toggle_check.png" />{else}&nbsp;{/if}
							</td>
							<td class="nowrap_ctr">
								<a href="{$appPath}/{$param.controller}/edit/?id={$value[each].id|escape}" class="edit">編集</a>
								<a href="{$appPath}/{$param.controller}/delete/?id={$value[each].id|escape}" onclick="return diag('本当に削除してよろしいですか？')" class="delete">削除</a>
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