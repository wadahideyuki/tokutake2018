{include file='../userHeader.tpl' _title='杜の家カレンダー'}

<!-- /mainContents //-->
<div class="mainContents">

	<ul id="bc_navi">
		<li class="top"><a href="{$appPath}/">HOME</a></li>
		<li>杜の家カレンダー</li>
	</ul>

	<h1>杜の家カレンダーあ</h1>

	<div id="event_calendar" class="cf">

{if $events}

		<div class="event_calendar_note">イベント、教室は日程等が変更になる場合がございますのでご了承ください。</div>

		<div id="event_calendar_legend" class="cf">

			<div class="summary">
				<div><span>ジャンル<br />アイコンの説明</span></div>
			</div>

			<dl>
				<dt><div class="event_type_icon event_type_1"><span>カルチャー</span></div></dt>
				<dd>「杜の家ギャラリー」の空スペースを気軽に利用して、地域の方々が開催する教室です。</dd>
				<dt><div class="event_type_icon event_type_2"><span>展示</span></div></dt>
				<dd>趣味の成果や作品発表、交流の場としてお使いいただける貸しギャラリーの展示情報です。</dd>
				<dt><div class="event_type_icon event_type_3"><span>イベント</span></div></dt>
				<dd>仲間が集まり、仲間が増える、暮らしを楽しむためのイベントです。</dd>
				<dt><div class="event_type_icon event_type_4"><span>見学会</span></div></dt>
				<dd>構造見学・完成見学・住まい手訪問など「うれし徳武」の建物がすべてわかる見学会です。</dd>
				<dt><div class="event_type_icon event_type_5"><span>勉強会</span></div></dt>
				<dd>講師の方の得する話が聞ける家づくりに役立つ勉強会です。</dd>
			</dl>
		</div>

		<div class="gratice">
			<span>教室を初回体験の方に体験券（受講）プレゼント!</span>
		</div>

		<div class="cf">

			<div class="year">
				{$year|escape}年
			</div>

			<ul class="month">
				<li><a href="#m1">1月</a></li>
				<li><a href="#m2">2月</a></li>
				<li><a href="#m3">3月</a></li>
				<li><a href="#m4">4月</a></li>
				<li><a href="#m5">5月</a></li>
				<li><a href="#m6">6月</a></li>
				<li><a href="#m7">7月</a></li>
				<li><a href="#m8">8月</a></li>
				<li><a href="#m9">9月</a></li>
				<li><a href="#m10">10月</a></li>
				<li><a href="#m11">11月</a></li>
				<li><a href="#m12">12月</a></li>
			</ul>

		</div>

		<table class="year">
			<tr>
				<th class="month">月</th>
				<td>
					<table class="month" width="100%">
						<tr>
							<th class="date bottom_end" width="16%"><span style="white-space:nowrap">日(曜日)</span></th>
							<th class="bottom_end right_end">
								<table class="date">
									<tr>
										<td class="bottom_end">イベント</td>
										<td class="right_end bottom_end icon">ジャンル</td>
									</tr>
								</table>
							</th>
						</tr>
					</table>
				</td>
			</tr>
			{foreach from=$events item='event' key='month' name='month'}
				<tr>
					<th width="10%" id="m{$month}" class="month">
					{$month}月
					</th>
					<td width="90%">
						<table class="month">
						{foreach from=$event item='days' key='day' name='day'}
						<tr>
							<td width="16%" style="white-space:nowrap" class="date{if $smarty.foreach.day.last} bottom_end{/if}">{$day}日({$days.week}){if $days.holiday}<span class="sp"></span>祝日{/if}{*日の配列*}</td>
							<td width="84%" class="right_end{if $smarty.foreach.day.last} bottom_end{/if}">
								<table class="date">
									{foreach from=$days.items item='each' name='item'}
									<tr>
										<td {if $smarty.foreach.item.last} class="bottom_end"{/if}><a href="{$appPath}/event/detail/?id={$each.id}&amp;_cal=1" class="{if $each.strong}strong{/if}">{$each.title}</a></td>
										<td class="right_end icon{if $smarty.foreach.item.last} bottom_end{/if}">
											<div class="event_type_icon event_type_{$each.type}"><span>{$each.type|replacearr:$metafile.events}</span></div>
										</td>
									</tr>
									{/foreach}
								</table>
							</td>
						</tr>
						{/foreach}
						</table>
					</td>
				</tr>
			{/foreach}
		</table>

{else}
		<div class="no_event">{$year}年のイベント情報はまだ登録されていません</div>
{/if}


	</div>

	<div class="btn_event">
		<a href="{$meta.blog_url}">
			<img src="{$appPath}/img/arrow_r.png" alt="→" />会長ブログもご覧下さい！
		</a>
	</div>

</div>

{include file='../userFooter.tpl' pagetopLink=1}

