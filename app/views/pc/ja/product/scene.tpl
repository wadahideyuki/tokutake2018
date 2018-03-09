{include file='../userHeader.tpl' _subTitle = $value.title}

				<!-- /mainContents //-->
				<div class="mainContents">

					<ul id="bc_navi">
						<li class="top"><a href="{$appPath}/">HOME</a></li>
						<li><a href="{$appPath}/{$param.controller}/">施工事例</a></li>
						{if $param.category}
						<li><a href="{$appPath}/{$param.controller}/listup/?category={$param.category|escape}">{$param.category|replacearr:$metafile.product_specialities}</a></li>
						{else}
						<li><a href="{$appPath}/{$param.controller}/listup/">全て見る</a></li>
						{/if}
						<li>{$value.title|strip_tags|escape}</li>
					</ul>

					<h1 style="margin-top:46px;">{$value.title}</h1>

					<div id="product" class="cf">

						<article>

							<div class="product_description">
								{$value.descriptions|escape|autolink:'_blank'|ttk}
							</div>

							{foreach from=$value.feature item='each'}
								<!-- {$each} {$each|replacearr:$metafile.features} -->
							{/foreach}

							<div class="product_spec">
								{$value.spec|escape|nl2br|autolink:'_blank'}
							</div>

							<div class="feature cf">
							{if $value.feature_01}<img src="{$appPath}/img/feature_01.png" alt="{$metafile.features.1}" />{/if}
							{if $value.feature_02}<img src="{$appPath}/img/feature_02.png" alt="{$metafile.features.2}" />{/if}
							{if $value.feature_03}<img src="{$appPath}/img/feature_03.png" alt="{$metafile.features.3}" />{/if}
							{if $value.feature_04}<img src="{$appPath}/img/feature_04.png" alt="{$metafile.features.4}" />{/if}
							{if $value.feature_05}<img src="{$appPath}/img/feature_05.png" alt="{$metafile.features.5}" />{/if}
							{if $value.feature_06}<img src="{$appPath}/img/feature_06.png" alt="{$metafile.features.6}" />{/if}
							{if $value.feature_07}<img src="{$appPath}/img/feature_07.png" alt="{$metafile.features.7}" />{/if}
							</div>

							{markdown text=$value.body}

						</article>

						<aside>

							<section class="slider">

								<div id="slider" class="flexslider">
									<ul class="slides">
									{foreach item='image' from=$images}

										<li>
											<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$image.file}" alt="{$image.caption}" />
											<p>{$image.caption}</p>
										</li>

									{/foreach}
									</ul>
								</div>

								<div id="carousel" class="flexslider">
									<ul class="slides">
									{foreach item='tmb' from=$images}

										<li>
											<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$tmb.tmb}" alt="{$tmb.caption}" />
										</li>

									{/foreach}
									</ul>
								</div>
							</section>

					<ul class="page">
					{if $prev}
						<li class="prev"><a href="{$appPath}/{$param.controller}/detail?id={$prev.id}{if $param.category}&amp;category={$param.category|escape}{/if}">前のシーンを見る</a></li>
					{else}
						<li class="prev"><span class="disabled">前のシーンを見る</span></li>
					{/if}
					{if $next}
						<li class="next"><a href="{$appPath}/{$param.controller}/detail?id={$next.id}{if $param.category}&amp;category={$param.category|escape}{/if}">次のシーンを見る</a></li>
					{else}
						<li class="next"><span class="disabled">次のシーンを見る</span></li>
					{/if}
					</ul>

						</aside>

					</div>

					<div class="btn_event">
						<a href="{$appPath}/event/">
							<img src="{$appPath}/img/arrow_r.png" alt="→" />見学会・イベント情報もご覧下さい！
						</a>
					</div>

				</div>
				<!-- /mainContents //-->

{include file='../userFooter.tpl'}