{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">

			<div id="tabs" class="clearfix">
				<h3>{$_title}</h3>
				<ul>
					<li class="active"><a href="{$appPath}/tool/"><span>一覧</span></a></li>
				</ul>
			</div>

			<div class="editForm">

				{foreach from=$tables item=table key='table_name'}

					<h4 style="margin-top:24px;">{$table.Name}_{$table.Comment}</h4>
					<table>
						<tr class="topHead top">
							<th class="topleft">Field</th>
							<th>Type</th>
							<th>Collation</th>
							<th>Null</th>
							<th>Key</th>
							<th>Default</th>
							<th>Extra</th>
							<th class="topright">Comment</th>
						</tr>

					{foreach from=$table.cols item='col'}

						<tr class="{cycle values='odd,even'}">
							<td><span style="font-weight:bold;">{$col.Field}</span></td>
							<td>{$col.Type}</td>
							<td>{$col.Collation}</td>
							<td>{$col.Null}</td>
							<td>{$col.Key}</td>
							<td>{$col.Default}</td>
							<td>{$col.Extra}</td>
							<td>{$col.Comment}</td>
						</tr>

					{/foreach}
					</table>

				{/foreach}

			</div>
{*
			<div id="helpDescription">
				<div class="helpSpace">
					<ul>
						<li>※</li>
					</ul>
				</div>
			</div>
*}
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}
