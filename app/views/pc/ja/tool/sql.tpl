{include file='../adminHeader.tpl'}

	<div id="contentContainer">
		<div id="content">

			<div id="tabs" class="clearfix">
				<h3>{$_title}</h3>
				<ul>
					<li class="active"><a href="{$appPath}/tool/"><span>一覧</span></a></li>
				</ul>
			</div>

			<form action="{$appPath}/tool/" method="post" name="config">

				<div class="editForm">
					<table>
						<tbody>
							<tr>
								<th colspan="2" class="topHead top">
									■※※※
								</th>
							</tr>
							<tr>
								<th class="sideHead">※※※</th>
								<td>
									{$error.class.sql}
									<textarea name="sql" style="height:64px;" class="ime-active monospace">{$value.sql|escape}</textarea>
									{$error.msg.sql}
								</td>
							</tr>
							<tr>
								<th colspan="2" class="bottomHead">
									<input type="submit" name="_mode_tool_sql_" value="送　信" class="btn" />
								</th>
							</tr>
						</tbody>
					</table>
				</div>

			</form>

			<div id="helpDescription">
				<div class="helpSpace">
					<ul>
						<li>※※※</li>
					</ul>
				</div>
			</div>

		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

