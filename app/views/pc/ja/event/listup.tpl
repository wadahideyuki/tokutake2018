{include file='../userHeader.tpl'}

<div class="mainContents pageEvent">
	<div class="pageMain">
		<div id="bc_navi">
			<ul class="inner">
				<li class="top"><a href="{$appPath}/">HOME</a></li>
				<li>見学会とイベント情報</li>
			</ul>
		</div>

		<div class="in">
			<h1 class="fzS"><span>見学会とイベント情報</span></h1>
		</div>
	</div>


	<div class="eventBox">
		<div class="inner-wide">

			<ul class="event_list flex-box col4-box">
				{foreach from=$value item='each'}
				<li>
					<a href="{$appPath}/{$param.controller}/detail/?id={$each.id}" class="image">
						<img src="{$each.img}" alt="{$each.title|escape}" class="index" />

						<div class="date">
							{if $each.term == 1}
								{$each.from_date|datetime:'n/j'}
								<img src="{$appPath}/img/week_{$each.from_date_week}{if $each.from_date_holiday}s{/if}.jpg" alt="" />
							{else}
								{$each.from_date|datetime:'n/j'}<img src="{$appPath}/img/week_{$each.from_date_week}{if $each.from_date_holiday}s{/if}.jpg" alt="" /
								>{if $each.term == 2}・{elseif $each.term == 3}～{/if}{$each.to_date|datetime:'n/j'}<img src="{$appPath}/img/week_{$each.to_date_week}{if $each.to_date_holiday}s{/if}.jpg" alt="" />
							{/if}
						</div>

						<p class="title">
							{$each.title|escape}
						</p>
						<p class="sumamry">
							{$each.summary|escape}
						</p>

						<p class="label">
							{if $each.future}
								<span class="bosyu">参加者募集中</span>
							{elseif $each.current}
								<span class="kaisai">開催中</span>
							{elseif $each.past}
								<span class="syuryo">終了しました</span>
							{/if}
						</p>
					</a>
				</li>
				{foreachelse}
				<li><span>見学会・イベントはありません。</span></li>
				{/foreach}
			</ul>

			{pager_simple pageParams=$pageParams}

		</div>
	</div>

</div>

{include file='../userFooter.tpl' pagetopLink=1}