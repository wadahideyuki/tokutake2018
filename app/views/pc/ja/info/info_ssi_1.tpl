
			<!--information-->
			<ul class="info">

		{section name=info loop=$value}

				<li><a href="{if $value[info].url}{$value[info].url|escape}{else}{$appPath}/info/detail/?id={$value[info].id|escape}{/if}"{if $value[info].url} target="_blank"{/if}>{$value[info].title|escape}</a>{if $value[info].newmark}<span class="new"> New</span>{/if}</li>

		{sectionelse}

				<li>お知らせはありません</li>

		{/section}

			</ul>
			<!--/information-->
