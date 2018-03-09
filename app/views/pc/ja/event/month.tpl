{include file='../userHeader.tpl' _title='イベントカレンダー'}

<!-- /mainContents //-->
<div class="mainContents">

	<ul id="bc_navi">
		<li class="top"><a href="{$appPath}/">HOME</a></li>
		<li>イベントカレンダー</li>
	</ul>

	<h1>イベントカレンダーあ</h1>

	<div id="event_calendar" class="cf">

		<div class="event_calendar_note">イベント、教室は日程等が変更になる場合がございますのでご了承ください。</div>

		<div class="month_navi cf">

			<div class="prev_month">
				{if $prevMonth}
				<a href="{$appPath}/{$param.controller}/{$param.action}/?year={$prevMonthYear}&amp;month={$prevMonth}{if $param.list}&list=1{/if}"><img src="{$appPath}/img/arrow_prev.png" alt="←" /> {$prevMonth|escape}月</a>
				{else}
				<img src="{$appPath}/img/arrow_prev.png" alt="←" /> <span style="color:#ccc">12月</span>
				{/if}
			</div>

			<div class="year_month">
				{$year|escape}年{$month|escape}月
			</div>

			<div class="next_month">
				{if $nextMonth}
				<a href="{$appPath}/{$param.controller}/{$param.action}/?year={$nextMonthYear}&amp;month={$nextMonth}{if $param.list}&list=1{/if}">{$nextMonth|escape}月 <img src="{$appPath}/img/arrow_next.png" alt="→" /></a>
				{else}
				<span style="color:#ccc">1月</span> <img src="{$appPath}/img/arrow_next.png" alt="→" />
				{/if}
			</div>

		</div>

		<div class="list_calendar pc">
			{if $param.list == 1}
			<a href="{$appPath}/{$param.controller}/{$param.action}/{if $param.year}?year={$param.year}&amp;month={$param.month}{else}{/if}">カレンダー形式で表示</a>
			{else}
			<a href="{$appPath}/{$param.controller}/{$param.action}/{if $param.year}?year={$param.year}&amp;month={$param.month}&list=1{else}?list=1{/if}">一覧形式で表示</a>
			{/if}
		</div>

		{if $param.list or $session.uaType == 'sp'}
		<table class="month_list">
			<tr>
				<th class="day">日(曜日)</th>
				<th class="event_name">イベント</th>
			</tr>

			{foreach from=$event_list item='day' key='date' name='day'}
				<tr{if $day.week == '土'} class="sat"{elseif $day.week == '日' or $day.holiday} class="sun"{/if}>
					<td class="day">{$date}日({$day.week}){if $day.holiday}<span class="sp"></span>祝日{/if}</td>
					<td class="event_name">
						{foreach from=$day.items item='event_list' name='event_list'}
							{if $smarty.foreach.event_list.first}
							<ul>
							{/if}
								<li>
									<a href="{$appPath}/event/detail/?id={$event_list.id}&amp;_cal=1" class="{if $event_list.strong}strong{/if}">{*<div class="event_type_icon event_type_{$event_list.type}">*}{$event_list.type|replacearr:$metafile.events}</span></div>{$event_list.title|escape}</a><br />
							{if $smarty.foreach.event_list.last}
							</ul>
							{/if}
						{/foreach}
					</td>
				</tr>
			{/foreach}
		</table>
		{/if}

		{if $session.uaType != 'sp'}

		<div class="{if $param.list}sp{/if}">

			<table class="month_block">
				<tr>
					<th class="sun" >日曜日</th>
					<th class="week">月曜日</th>
					<th class="week">火曜日</th>
					<th class="week">水曜日</th>
					<th class="week">木曜日</th>
					<th class="week">金曜日</th>
					<th class="sat" >土曜日</th>
				</tr>

				{foreach from=$events item='week' key='weekNum' name='week'}
					<tr>
					{foreach from=$week item='day' key='dayNum' name='day'}

						<td class="{if $day.week == '土'}sat{elseif $day.week == '日'}sun{/if}{if $day.other_month} other_month{/if}{if $day.holiday} sun{/if}"><div class="date">{$dayNum|number_format}{if $day.holiday}（祝日）{/if}</div>
							{foreach from=$day.items item='event' name='event'}
								{if $smarty.foreach.event.first}
								<ul>
								{/if}
									<li>
										<a href="{$appPath}/event/detail/?id={$event.id}&amp;_cal=1" class="{if $event.strong}strong{/if}">{$event.title|escape}</a>
									</li>
								{if $smarty.foreach.event.last}
								</ul>
								{/if}
							{/foreach}
						</td>
					{/foreach}
					</tr>
				{/foreach}
			</table>
		</div>

		{/if}

	</div>

	<div class="btn_event">
		<a href="{$meta.blog_url}">
			<img src="{$appPath}/img/arrow_r.png" alt="→" />会長ブログもご覧下さい！
		</a>
	</div>

</div>

{include file='../userFooter.tpl' pagetopLink=1}

