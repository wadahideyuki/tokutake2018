{include file='../userHeader.tpl'
_description='長野で平屋暮らし、広々リビング、薪ストーブ、中庭のある注文住宅など間取りの施工事例です。こだわりの外観デザイン、吹抜けのあるリビングデザイン、手作りキッチン、特注デザイン間取りが満載。長野の新築、平屋、注文住宅、木の家を建てる地元工務店うれし徳武建設です。'
_fixedTitle='施工事例｜木の家、平屋、間取りは長野のうれし徳武建設'}

<!-- /mainContents //-->
<div class="mainContents">

	<ul id="bc_navi">
		<li class="top"><a href="{$appPath}/">HOME</a></li>
		<li>施工事例</li>
	</ul>

	<h1>長野で平屋暮し、間取りデザイン住宅施工事例です</h1>

	<div id="product" class="cf">

		<ul class="product_category_list cf">
			<li>
				<a href="{$appPath}/{$param.controller}/listup/" class="_image">
					<img src="{$appPath}/img/speciality_all.jpg" alt="全て見る" class="_imgover" />
				</a>
			</li>
			{foreach from=$specialities item='each' key='key' name='loop'}
			<li {if $smarty.foreach.loop.iteration == 2 or $smarty.foreach.loop.iteration == 5} class="right"{/if}>
				<a href="{$appPath}/{$param.controller}/listup/?category={$key}" class="image">
					<img src="{$appPath}/img/speciality_{$key|digit:'02'}.jpg" alt="{$each}" class="_imgover" />
				</a>
			</li>
			{foreachelse}
			<li><span>施工事例はありません。</span></li>
			{/foreach}
		</ul>

	</div>

	{if $scene}

	<div id="scene" class="cf">

		<h2>シーン別</h2>

		<ul class="product_by_scene cf">
			{foreach from=$scene item='each' key='key' name='loop2'}
			<li {if $smarty.foreach.loop2.iteration == 3 or $smarty.foreach.loop2.iteration == 6 or $smarty.foreach.loop2.iteration == 9 or $smarty.foreach.loop2.iteration == 12} class="right"{/if}>
				<a href="{$appPath}/{$param.controller}/detail/?id={$each.id}&amp;category=6" class="image">
					<img src="{$appPath}{$each.img}" alt="{$each.title|escape}" class="_imgover" />
					<div>{$each.title|escape}</div>
				</a>
			</li>
			{/foreach}
		</ul>

	</div>
	{/if}



	<div class="btn_event">
		<a href="{$appPath}/event/">
			<img src="{$appPath}/img/arrow_r.png" alt="→" />見学会・イベント情報もご覧下さい！
		</a>
	</div>

</div>

{include file='../userFooter.tpl'}
