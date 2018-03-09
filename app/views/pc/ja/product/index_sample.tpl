{include file='../userHeader.tpl'}

<!-- /mainContents //-->
<div class="mainContents">

	<ul id="bc_navi">
		<li class="top"><a href="{$appPath}/">HOME</a></li>
		<li>施工事例カテゴリ</li>
	</ul>

	<h1>施工事例カテゴリ</h1>

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
