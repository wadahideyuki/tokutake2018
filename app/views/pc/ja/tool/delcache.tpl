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
									■キャッシュクリア
								</th>
							</tr>
							<tr>
								<th class="sideHead">削除したファイル</th>
								<td class="nowrap">
									{section name=file loop=$deleted}

										{$deleted[file]}<br />

									{sectionelse}
									　
									　－

									{/section}
								</td>
							</tr>
							<tr>
								<th class="sideHead">削除不可のファイル</th>
								<td class="nowrap">
									{section name=file loop=$notdeleted}

										{$notdeleted[file]}<br />

									{sectionelse}
									　
									　－

									{/section}
								</td>
							</tr>

							<tr>
								<th colspan="2" class="bottomHead">
									<input type="submit" name="_mode_tool_delcache_" value="更　新" class="btn" />
									<input type="submit" name="_mode_tool_"	 value="戻　る" class="btn" />
								</th>
							</tr>
						</tbody>
					</table>
				</div>

			</form>

			<div id="helpDescription">
				<div class="helpSpace">
					<ul>
						<li>※[削除不可のファイル] は、ファイル所有者やパーミッション設定に誤りがあるため削除できなかった可能性があります。<br />
									属性を確認の上、再度実行してみてください。
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

