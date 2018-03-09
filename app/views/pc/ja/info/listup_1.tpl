{include file='../userHeader.tpl' title='お知らせ一覧'}

<h2><img src="{$appUpPath}/img/h2_news.jpg" alt="お知らせ" /></h2>
<div class="main">
	<ul class="pagelink">
		<li><a href="{$appUpPath}/">HOME</a></li>
		<li>お知らせ一覧</li>
	</ul>

	<div class="section">
		<h3>最新のお知らせ</h3>
		<ul class="news">
			{section name=info loop=$value}
			<li><span>{$value[info].created|datetime:'Y年m月d日'}</span><a href="{if $value[info].url}{$value[info].url}{else}{$appPath}/info/detail/?id={$value[info].id}{/if}">{$value[info].title|escape}</a></li>
			{sectionelse}
			<li><span>&nbsp;</span>新着情報はありません。</li>
			{/section}
		</ul>
	</div>

</div>

{include file='../userFooter.tpl'}
