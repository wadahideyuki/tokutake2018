
			<div id="footer" style="clear:both">
				{if $pagetopLink}
				<div class="pageTop">
					<a href="#pageHeader"><img src="{$appPath}/images/sys/top.gif" alt="" />ページトップへ戻る</a>
				</div>
				{/if}
				Copyright &copy; {copyright_year from=$meta.start_year} Georide Solutions All rights reserved.

		{if $session.userLevel >= 5 && $_config.display.app_error}
			<div id="debugDescription">
				<div class="debugSpace">
					<h5>開発時デバッグ用（本稼働時は表示されません）</h5>
					<br />
					メモリ使用量: {filesize size=$_memory_usage}<br />
					実行時間　　: {$_execution_time}秒<br />
					アクセス権　: {acl action=$param.action acr=$_acr acl=$_aclResources}<br />

					{if $debug_str}
					<ul>
						{foreach from=$debug_str item='debug_str_each'}
						<li>{$debug_str_each}</li>
						{/foreach}
					</ul>
					{/if}

					<div>
						<pre>
						{$session|var_dump}
						</pre>
					</div>
				</div>
			</div>
		{/if}

			</div>
		</div>
	</body>
</html>