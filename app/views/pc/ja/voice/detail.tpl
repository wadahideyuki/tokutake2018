{include file='../userHeader.tpl' _subTitle = $value.title}
<link rel="stylesheet" href="/css/voice.css" />
			
				<div class="mainContents voiceDetail">
<div id="bc_navi" >
					<ul class="inner">
						<li class="top"><a href="{$appPath}/">HOME</a></li>
						<li><a href="{$appPath}/{$param.controller}/">お客様の声</a></li>
						<li>{$value.title|escape}</li>
					</ul></div>
						
						<div class="voiceDetailTtl">
							{if $images.0.file}
							<div class="voice_img">
								<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$images.0.file}" alt="" />
							</div>
							{/if}

						<div class="voiceDetailTtlInner">
							<div class="descriptions">
								{$value.descriptions|escape}
							</div>
					<h1>{$value.title|escape} 
{* $value.title|escape *}<span>{$value.place|escape}</span></h1>
</div></div>
					<div id="voice" class="cf">

						<article>


							<div class="document">
								{$value.body}
							</div>

						</article>

						<aside>

							<div class="imgCenter">
								{foreach from=$images item='image' name='image'}

								<div class="{if $image.ort == 'P'} portrait{else} landscape{/if}{if $smarty.foreach.image.first} pc{/if} " {if $image.ort == 'P' && $p_first}{assign var=p_first value=0} style="margin-right:4%"{else}{assign var=p_first value=1}{/if}>
									<a href="{$appPath}/images/{$param.controller}/{$value.id}/{$image.file}" rel="lightbox[a]" title="{$image.caption}">
										<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$image.tmb}" alt=""{if $smarty.foreach.image.first} class="img_right"{/if} />
									</a>
									<p class="caption">
										{$image.caption}
									</p>
								</div>
								{/foreach}
							</div>

						</aside>

					</div>

					<ul class="page">
					{if $prev}
						<li class="prev"><a href="{$appPath}/{$param.controller}/detail?id={$prev.id|escape}">{$prev.title|escape}</a></li>
					{/if}
						<li class="current">{$value.title|escape}</li>
					{if $next}
						<li class="next"><a href="{$appPath}/{$param.controller}/detail?id={$next.id|escape}">{$next.title|escape}</a></li>
					{/if}
					</ul>

					<div class="btn_event">
						<a href="{$appPath}/housing/otukiai.html">
							<img src="{$appPath}/img/arrow_r.png" alt="→" />「一生おつきあい」もご覧下さい！
						</a>
					</div>

				</div>

{include file='../userFooter.tpl' pagetopLink='1'}

