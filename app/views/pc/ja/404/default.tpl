{include file='../adminHeader.tpl' _title='404 Not Found'}

<div id="contentContainer">
	<div id="content">
		<div id="pageHeaderTitle">
			ご指定のページが見つかりません
		</div>
		<div class="pageContents">
			<p>
				ご指定のページが見つかりませんでした。
			</p>
			<p>
				恐れ入りますが、正しくアドレスが入力されているか、もう一度ご確認ください。
				<br />
				正しくアドレスを入力してもページが表示されない場合、または 「ブックマーク」や「お気に入り」から ページをご指定された場合、他のサイトからリンクされた場合は、申し訳ありませんが、ページが移動したか、もしくは掲載期間が終了しているものと思われます。
			</p>
			<div class="btn">
				<input type="button" value="トップページへ" onClick="location.href='{$basePath}/';"　/>
			</div>
		</div>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl'}
