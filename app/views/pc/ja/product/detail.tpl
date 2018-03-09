{include file='../userHeader.tpl' _subTitle = $value.title}

				<!-- /mainContents //-->
				<div class="mainContents pageProductDetail">

					<div id="bc_navi">
						<ul class="inner">
							<li class="top"><a href="{$appPath}/">HOME</a></li>
							<li><a href="{$appPath}/{$param.controller}/">施工事例</a></li>
							{if $param.category}
							<li><a href="{$appPath}/{$param.controller}/listup/?category={$param.category|escape}">{$param.category|replacearr:$metafile.product_specialities}</a></li>
							{else}
							<li><a href="{$appPath}/{$param.controller}/listup/">全て見る</a></li>
							{/if}
							<li>{$value.title|strip_tags|escape}</li>
						</ul>
					</div>

					<div class="thisPageTtlBox">
						<h2 class="product">{$value.name|escape}</h2>
						<h1>{$value.title}</h1>

						<div class="product_spec">
							{$value.spec|escape|nl2br|autolink:'_blank'}
						</div>
					</div>


					<div id="product" class="cf">
						<article>
							<div class="in">
								<div class="product_description">
									{$value.descriptions|escape|autolink:'_blank'|ttk}
								</div>

								{foreach from=$value.feature item='each'}
									<!-- {$each} {$each|replacearr:$metafile.features} -->
								{/foreach}

								{markdown text=$value.body}

								<ul class="feature cf">
									{if $value.feature_01}<li><label>OM</label></li>{/if}
									{if $value.feature_02}<li><label>県素材</label></li>{/if}
									{if $value.feature_03}<li><label>太陽光</label></li>{/if}
									{if $value.feature_04}<li><label>薪ストーブ</label></li>{/if}
									{if $value.feature_05}<li><label>CASBEE</label></li>{/if}
									{if $value.feature_06}<li><label>長期優良</label></li>{/if}
									{if $value.feature_07}<li><label>低炭素</label></li>{/if}
								</ul>
							</div>
						</article>


						<aside>
							<ul class="photos">
							{foreach item='image' from=$images}

								<li>
									<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$image.file}" alt="{$image.caption}" />
									<p>{$image.caption}</p>
								</li>

							{/foreach}
							</ul>

<!--
								<div id="carousel" class="flexslider">
									<ul class="slides">
									{foreach item='tmb' from=$images}

										<li>
											<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$tmb.tmb}" alt="{$tmb.caption}" />
										</li>

									{/foreach}
									</ul>
								</div>
-->

							<ul class="page">
								{if $prev}
									<li class="prev"><a href="{$appPath}/{$param.controller}/detail?id={$prev.id}{if $param.category}&amp;category={$param.category|escape}{/if}">前の家を見る</a></li>
								{else}
									<li class="prev"><span class="disabled">前の家を見る</span></li>
								{/if}
								{if $next}
									<li class="next"><a href="{$appPath}/{$param.controller}/detail?id={$next.id}{if $param.category}&amp;category={$param.category|escape}{/if}">次の家を見る</a></li>
								{else}
									<li class="next"><span class="disabled">次の家を見る</span></li>
								{/if}
							</ul>

						</aside>

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
				<!-- /mainContents //-->

{include file='../userFooter.tpl'}