{include file='../userHeader.tpl' _subTitle = $value.title}

<div class="mainContents pageCompanyTop pageNews">
	<div class="pageMain">
		<div id="bc_navi">
			<ul class="inner">
						<li class="top"><a href="{$appPath}/">HOME</a></li>
						<li>NEWS - {$value.title|escape}</li>
			</ul>
		</div>

		<div class="in">
			<h1>NEWS</h1>
		</div>
	</div>


			
			
					

					<div class="bg">
					<div id="info" class="inner">
			<h2 class="ttl-lv2">{$value.title|escape}</h2>
			<div class="aboutUs">
						<article>

							<h3 class="ttl-lv3">{$value.created|datetime:'Y年n月j日'}</h3>

							{if $images.0.file}
							<div class="info_img sp">
								<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$images.0.file}" alt="" />
							</div>
							{/if}

							<div class="document">
								{$value.body|escape|nl2br|autolink}
							</div>

							{section name='file' loop=$files}

								{if $smarty.section.file.first}
								<ul class="file">
								{/if}
									<li><a href="{$appPath}/{$param.controller}/file/?id={$value.id}&amp;file={$files[file].escapeName}"{$files[file].target}>{$files[file].icon}{$files[file].name}</a></li>
								{if $smarty.section.file.last}
								</ul>
								{/if}

							{/section}

						</article>

						<aside>

							<div class="imgCenter">
								{section name='image' loop=$images}
									{if $smarty.section.image.first}<div class="pc">{/if}

								<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$images[image].file}" alt=""{if $smarty.section.iamge.first} class="img_right"{/if} />
								<p class="caption">
									{$images[image].caption}
								</p>

									{if $smarty.section.image.first}</div>{/if}
								{/section}
							</div>

						</aside>

					</div>


				</div>
				</div>
				</div>

{include file='../userFooter.tpl' pagetopLink='1'}

