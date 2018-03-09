{include file='../adminHeader.tpl'}

	<div id="contentContainer">
		<div id="content">

			<div id="tabs" class="clearfix">
				<h3>{$_title}</h3>
				<ul>
					<li class="active"><a href="{$appPath}/tool/"><span>一覧</span></a></li>
				</ul>
			</div>

			{if $session.userLevel >= 5}
			<form action="{$appPath}/tool/" method="post">

				<div class="editForm">
					<table>
						<tbody>
							<tr class="topHead topleft">
								<th class="topleft">機能</th>
								<th>説明</th>
								<th class="ctr topright">実行</th>
							</tr>
							<tr class="odd">
								<td class="nowrap">
									キャッシュファイルの削除
								</td>
								<td>
									各種キャッシュファイルを削除します。DBのスキーマを変更した後や、ビュースクリプト（HTMLテンプレート）の変更が反映されない場合に実行してください。
								</td>
								<td class="nowrap_ctr">
									<input type="submit" value="実行" name="_mode_tool_delcache_"/>
								</td>
							</tr>
							<tr class="even">
								<td class="nowrap">
									フォーム生成
								</td>
								<td>
									データベースのテーブルから入力フォームのテンプレートを生成します。
								</td>
								<td class="nowrap_ctr">
									<a href="{$appPath}/tool/makeform" class="edit">作成</a>
								</td>
							</tr>
							<tr class="odd">
								<td class="nowrap">
									テーブル定義一覧
								</td>
								<td>
									データベースからテーブル定義一覧を生成します。
								</td>
								<td class="nowrap_ctr">
									<a href="{$appPath}/tool/tablelist" class="edit">作成</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</form>
			{/if}

			<div id="helpDescription">
				<div class="helpSpace">
					<ul>
						<li>※[キャッシュクリア] ボタンをクリックすると各種キャッシュファイルがクリアされます。</li>
					</ul>
				</div>
			</div>

		</div>
	</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

