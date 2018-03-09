{include file='../userHeader.tpl'
_description='長野で新築、注文住宅、戸建て、木の家で健康で快適に暮らすお客様の声です。長野県産材・自然素材で作るこだわりの家づくりに役立ちます。長期優良住宅・低炭素住宅の長持ちするエコ住宅を造る、長野で新築、戸建て、注文住宅、木の家づくりのうれし徳武建設です。'
_fixedTitle='お客様の声｜長野で戸建て、木の家で健康快適に暮らす'}
<link rel="stylesheet" href="/css/voice.css" />

<!-- /mainContents //-->
<div class="mainContents pageVoiceTop">
	<div class="pageMain">
		<div id="bc_navi">
			<ul class="inner">
			<li class="top"><a href="{$appPath}/">HOME</a></li>
			<li>お客様の声</li>
			</ul>
		</div>

		<div class="in">
			<h1 class="fzS"><span>お客様の声</span></h1>
		</div>
	</div>
	
	
	<div id="voice" class="cf inner-wide">

		<h2>長野で新築、注文住宅、戸建て、木の家で健康に暮らすお客様の声</h2>
		


		<ul class="voice_list cf flex-box col3-box flex-wrap">

				{foreach item='value' from=$values}

				<li class="voice-box">
					<a href="{$appPath}/{$param.controller}/detail/?id={$value.id|escape}">
					<div class="voice_summary">
						<div class="description">
							{$value.voice|escape}
						</div>
						<div class="completion">{$value.created|datetime:'Y年n月'}</div>
						<h2>{$value.title|escape}
							<span>{$value.place|escape}</span>
						</h2>
					</div>
					<div class="photo"><img src="{$value.image|escape}" alt=""  /></div>
					</a>
				</li>

				{foreachelse}

				<li>該当するデータがありません。</li>

				{/foreach}

			</ul>

			{pager_simple pageParams=$pageParams}

		</div>


	</div>

{include file='../userFooter.tpl' pagetopLink=1}

