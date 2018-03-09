{include file='../adminHeader.tpl'}

<div id="contentContainer">
	<div id="content">
		<div id="pageHeaderTitle">
			{$_title}
		</div>
		<div class="pageContents">
			{$message}
			<p>
			{$exception_file}{if $exception_line}:{/if}{$exception_line}
			</p>
			<p style="white-space:nowrap;">
			{$exception_trace|nl2br}
			</p>
		</div>
		<div id="helpDescription">
			<div class="helpSpace">
				<ul>
					<li>※このシステムエラーは、エラーログに記録され、原因の分析と改修に利用されます。</li>
				</ul>
			</div>
		</div>
	</div>
</div>

{include file='../adminSidebar.tpl'}
{include file='../adminFooter.tpl' pagetopLink=1}

