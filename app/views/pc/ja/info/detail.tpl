{include file='../userHeader.tpl'
							title     = 新着情報
							titleLink = '/info/listup/?type=1'
							subTitle  = $value.title}

				<!--メインカラム-->
				<div id="mainCol">

					<h2>
						<span>新着情報</span>
						<img src="{$appUpPath}/images/head/h2_information.png" alt="新着情報" width="615" height="29" />
					</h2>

					<h3>{$value.title|escape}	</h3>


						<div class="document">XXXX

							{if $info_config.info_wysiwyg}
								{$value.body}
							{else}
								{$value.body|escape|nl2br|autolink:'_blank'}
							{/if}

						</div>

						{section name='file' loop=$files}

							{if $smarty.section.file.first}
							<ul class="li_download">
							{/if}
								<li><a href="{$appPath}/download/file/?id={$value.id}&amp;file={$files[file].escapeName}">{*$files[file].icon*}{$files[file].name}</a></li>
							{if $smarty.section.file.last}
							</ul>
							{/if}

						{/section}

						<div class="imgCenter">
							{section name='image' loop=$images}
							<img src="{$appPath}/images/info/{$value.id}/{$images[image]}" alt=""{if $smarty.section.iamge.first} class="img_right"{/if} />
							{/section}
						</div>

			  </div>
				<!--/メインカラム-->

{include file='../userSideMenu.tpl'}
{include file='../userFooter.tpl' pagetopLink='1'}

