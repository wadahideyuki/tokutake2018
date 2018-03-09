{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

		{include file='config_menu.tpl'}

		<form action="{self}" method="post" name="config">

			{if $isError}
			<div class="error">
				エラー ： 赤枠で表示中の項目をご確認ください
			</div>
			{/if}

			<div class="editForm">
				<table>
					<tbody>
						<tr>
							<th colspan="2" class="topHead top">■トップページ表示設定</th>
						</tr>
						<tr>
							<th class="sideHead">会長ブログのURL<span class="required">*</span></th>
							<td>
								{$error.class.blog_url}
								<input type="text" name="blog_url" value="{$value.blog_url|escape}" class="w100p ime-inactive" />
								{$error.msg.blog_url}
							</td>
						</tr>
						<tr>
							<th class="sideHead">会長ブログRSSのURL<span class="required">*</span></th>
							<td>
								{$error.class.blog_rss_url}
								<input type="text" name="blog_rss_url" value="{$value.blog_rss_url|escape}" class="w100p ime-inactive" />
								{$error.msg.blog_rss_url}
							</td>
						</tr>
						<tr>
							<th class="sideHead">会長ブログRSSの<br />キャッシュ間隔（秒）<span class="required">*</span></th>
							<td>
								{$error.class.blog_cache}
								<input type="text" name="blog_cache" value="{$value.blog_cache|escape}" class="w64 ime-inactive" />
								{$error.msg.blog_cache}
								<p class="note">※外部サーバーから取得するRSSデータのキャッシュする時間を秒単位で指定してください。</p>
							</td>
						</tr>
						<tr>
							<th class="sideHead">メンテブログのURL<span class="required">*</span></th>
							<td>
								{$error.class.maintenance_blog_url}
								<input type="text" name="maintenance_blog_url" value="{$value.maintenance_blog_url|escape}" class="w100p ime-inactive" />
								{$error.msg.maintenance_blog_url}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メンテブログRSSのURL<span class="required">*</span></th>
							<td>
								{$error.class.maintenance_blog_rss_url}
								<input type="text" name="maintenance_blog_rss_url" value="{$value.maintenance_blog_rss_url|escape}" class="w100p ime-inactive" />
								{$error.msg.maintenance_blog_rss_url}
							</td>
						</tr>
						<tr>
							<th class="sideHead">メンテブログRSSの<br />キャッシュ間隔（秒）<span class="required">*</span></th>
							<td>
								{$error.class.maintenance_blog_cache}
								<input type="text" name="maintenance_blog_cache" value="{$value.maintenance_blog_cache|escape}" class="w64 ime-inactive" />
								{$error.msg.maintenance_blog_cache}
								<p class="note">※外部サーバーから取得するRSSデータのキャッシュする時間を秒単位で指定してください。</p>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="bottomHead">
								<input type="hidden" name="type" value="{$param.type|escape}" />
								<input type="submit" name="_mode_admin_save_" value="更　新"/>
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
{include file='../adminFooter.tpl' pagetopLink='1'}
