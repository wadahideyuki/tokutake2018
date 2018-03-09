					{section name=each loop=$value}
						<li>{if $value[each].url}<a href="{$value[each].url|escape}">{/if}<img src="{$appPath}/images/index/{$value[each].id|escape}/cover.jpg" class="top_img" />{if $value[each].caption}<div class="top_caption">{$value[each].caption|escape|nl2br}</div>{/if}{if $value[each].url}</a>{/if}</li>
					{/section}
