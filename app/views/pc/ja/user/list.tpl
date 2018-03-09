{include file='../adminHeader.tpl' title='ユーザー一覧・検索'}
{dialogbox flashMsg=$flashMsg msgType=$msgType}

<div id="contentContainer">
	<div id="content">

		{footpath}

		<div id="tabs" class="clearfix">
			<h3>ユーザー管理</h3>
			<ul>
				<li class="active"><a href="{$appPath}/{$param.controller}/list/"><span>一覧</span></a></li>
				<li><a href="{$appPath}/{$param.controller}/edit/{editnew}"><span>新規登録</span></a></li>
			</ul>
		</div>

		{*msgbox flashMsg=$flashMsg msgType=$msgType*}

		<div class="controls clearfix">

			<form action="{$appPath}/{$param.controller}/list/" method="post" name="extract">
				<div class="right_btn">
					　管理レベル：
					{html_options name='level' options=$_levels selected=$param.level novalue='--' onchange='extract'}
					　状態：
					{html_options name='status' options=$statuses selected=$param.status novalue='--' onchange='extract'}
					　表示件数：{html_options name='rows' options=$rowsSelect selected=$page_params.rows onchange='extract'}
					{query_string}
				</div>
			</form>

			<form action="{$appPath}/{$param.controller}/list/" method="post" name="keyword_search">
				<div class="right_btn">
					キーワード検索：
					<input type="text" name="key" id="prdcode" value="{$param.key|escape|urldecode}" size="20" />
					<input type="submit" value="検索" />
					{query_string}
				</div>
			</form>

		</div>

		<form action="{$appPath}/{$param.controller}/list/" method="post">

			{pager pageParams=$page_params}

			<div class="editForm">
				<table>
					<tbody>
						<tr class="topHead">
							<th class="ctr topleft no_print"><input type="checkbox" name="" value="" onClick="checkall(this);" /></th>
							<th class="ctr">{qry_link col='id'           alt='No.'}</th>
							<th>{qry_link             col='name_kana'    alt='ユーザー名'}</th>
							<th>{qry_link             col='mail'         alt='メールアドレス'}</th>
							<th>{qry_link             col='level'        alt='管理レベル'}</th>
							<th class="ctr">{qry_link col='status'       alt='状態'}</th>
							<th>{qry_link             col='created'      alt='登録日'}</th>
							<th class="ctr topright no_print">操作</th>
						</tr>

						{section name=each loop=$value}

						<tr class="{cycle values='odd,even'}">
							<td class="ctr no_print">
								<input type="checkbox" name="select[]" value="{$value[each].id|escape}" />
							</td>
							<td class="ctr">
								{$value[each].id|digit:'04'}
							</td>
							<td>
								{$value[each].name|escape}
							</td>
							<td>
								<a href="mailto:{$value[each].mail|escape:'hexentity'}">{$value[each].mail|escape}</a>{$value[each].mobile|if:' （携帯）':''}
							</td>
							<td>
								{$value[each].level_name|escape}
							</td>
							<td class="ctr">
								{if $value[each].status}<img title="アクティブ" src="{$appPath}/images/sys/toggle_check.png" />{else}<img title="ロックされています" src="{$appPath}/images/sys/locked.png" />{/if}
							</td>
							<td>
								{$value[each].created|date_format:'Y/m/d'}
							</td>
							<td class="nowrap_ctr no_print">
								<a href="{$appPath}/{$param.controller}/edit/?id={$value[each].id|escape}" class="edit">編集</a>
								<a href="{$appPath}/{$param.controller}/delete/?id={$value[each].id|escape}" onclick="return diag('「{$value[each].name|escape}」様を削除してよろしいですか？')" class="delete{if $session.userId == $value[each].id} disabled{/if}">削除</a>
							</td>
						</tr>

						{sectionelse}

						<tr>
							<td colspan="9" class="nodata">
								該当するデータがありません。
							</td>
						</tr>

						{/section}

					</tbody>
				</table>
			</div>

		{pager pageParams=$page_params}

			{if $value}
			<div class="clearfix">
				<div class="left_btn">
					チェックしたデータを =>
					<input type="submit" name="_mode_{$param.controller}_deletes_" value="削除"  onclick="return diag('本当に削除してよろしいですか？')" class="btn" />
					<input type="submit" name="_mode_{$param.controller}_lock_"    value="アカウントロック"     class="btn" />
					<input type="submit" name="_mode_{$param.controller}_unlock_"  value="アカウントロック解除" class="btn" />
				</div>
			</div>
			{/if}

		</form>


		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>※項目名をクリックすると並び替えます。（▲昇順　▼降順）</li>
					<li>※“システム管理者”レベルのユーザーはすべての管理項目をご利用できます。</li>
					<li>※アカウントロックするとユーザーアカウントが凍結され、ログインできなくなります。また、現在ログインしている該当ユーザーは強制ログアウトされます。</li>
				</ul>
			</div>
		</div>

	</div>
</div>

{include file='../adminSidebar.tpl' sidemenu = 'master'}
{include file='../adminFooter.tpl' pagetopLink=1}
