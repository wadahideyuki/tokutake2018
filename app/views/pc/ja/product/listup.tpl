{include file='../userHeader.tpl' _subTitle = $_category_name}

<!-- /mainContents //-->
<div class="mainContents pageProductTop">
	<div class="pageMain">
		<div id="bc_navi">
			<ul class="inner">
				<li class="top"><a href="{$appPath}/">HOME</a></li>
				<li><a href="{$appPath}/product/">施工事例</a></li>
				{if $param.category}
				<li>{$param.category|replacearr:$metafile.product_specialities}</li>
				{else}
				{/if}
			</ul>
		</div>

		<div class="in">
			<h1 class="fzS"><span>{if $param.category}{$param.category|replacearr:$metafile.product_specialities}{else}施工事例{/if}</span></h1>
		</div>
	</div>


	<div id="product" class="cf inner-wide">
		<h2>長野で平屋暮し、<br class="spDevice">間取りデザイン住宅施工事例です</h2>

		<ul class="product_list cf flex-box col4-box flex-wrap">
			{foreach from=$values item='each' key='key'}
			<li class="{cycle values=",,right"}">
				<a href="{$appPath}/{$param.controller}/detail/?id={$each.id}{if $param.category}&amp;category={$param.category|escape}{/if}">
					<div class="photo"><img src="{$each.img}" alt="" class="_imgover" /></div>
				</a>
				<p class="title">
					<a href="{$appPath}/{$param.controller}/detail/?id={$each.id}" class="">{$each.title|strip_tags|escape}</a>
				</p>
				<p class="name">
					<a href="{$appPath}/{$param.controller}/detail/?id={$each.id}" class="">{$each.name|escape}</a>
				</p>
				<ul class="feature cf">
					{if $each.feature_01}<li><label>OM</label></li>{/if}
					{if $each.feature_02}<li><label>県素材</label></li>{/if}
					{if $each.feature_03}<li><label>太陽光</label></li>{/if}
					{if $each.feature_04}<li><label>薪ストーブ</label></li>{/if}
					{if $each.feature_05}<li><label>CASBEE</label></li>{/if}
					{if $each.feature_06}<li><label>長期優良</label></li>{/if}
					{if $each.feature_07}<li><label>低炭素</label></li>{/if}
				</ul>
			</li>
			{foreachelse}
			<li><span>施工事例ありません。</span></li>
			{/foreach}
		</ul>

		{pager_simple pageParams=$pageParams}

		<div class="inner">
			<div class="aboutIcnBox">
				<h2>アイコンについて</h2>
				<ul class="feature cf">
					<li><label>OM</label>{$metafile.features.1}</li>
					<li><label>県素材</label>{$metafile.features.2}</li>
					<li><label>太陽光</label>{$metafile.features.3}</li>
					<li><label>薪ストーブ</label>{$metafile.features.4}</li>
					<li><label>CASBEE</label>{$metafile.features.5}</li>
					<li><label>長期優良</label>{$metafile.features.6}</li>
					<li><label>低炭素</label>{$metafile.features.7}</li>
				</ul>
			</div>
		</div>

	</div>


</div>

{include file='../userFooter.tpl'}
