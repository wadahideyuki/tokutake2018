{include file='../userHeader.tpl'
_description='土地探し、シロアリ対策、資金計画のことなら長野市のうれし徳武建設です。県産材・無垢材・自然素材で健康住宅、長持ちするエコ住宅を建てる長野市の地元工務店だから、土地探し、シロアリ対策、資金計画、住宅ローンなど家づくりの疑問に答えます。'
_fixedTitle='よくある質問｜土地探し、シロアリ対策、資金計画はうれし徳武建設'}

<!-- /mainContents //-->
<div class="mainContents pageFaq">
	<div class="pageMain">
		<div id="bc_navi">
			<ul class="inner">
				<li class="top"><a href="{$appPath}/">HOME</a></li>
				<li>よくあるご質問</li>
			</ul>
		</div>

		<div class="in">
			<h1 class="fzS">
				<div>
					<em class="alph60">よくあるご質問</em><br>
					土地探し、シロアリ対策・資金計画、質問・疑問に答えます
				</div>
			</h1>
		</div>
	</div>


	<div class="faqBox">
		<div class="inner">

			{if $categories}
			<ul class="menu cf">
			{foreach from=$categories item='category' key='k' name='category'}

				<li><a href="#c{$k}">{$category}</a></li>

			{/foreach}
			</ul>
			{/if}

			{foreach from=$values item='faqs' key='ck'}

				<h2 id="c{$ck}" class="ttl-lv2">{$categories.$ck}</h2>

				{foreach from=$faqs item='faq'}

					<h3 class="ttl-lv3" id="q{$faq.id}"><div><span class="q">Q</span><span class="txt">{$faq.title}</span></div></h3>

					<div class="answer">

						<div class="a">A</div>
						<div class="body">{$faq.body|nl2br}</div>

						{if $faq.files}
						<ul class="file">
							{foreach from=$faq.files item='file' key='ck'}
							<li><a href="{$appPath}/{$param.controller}/file/?id={$faq.id}&amp;file={$file.escapeName}"{$file.target}>{$file.icon}{$file.name}</a></li>
							{/foreach}
						</ul>
						{/if}

					</div>

				{/foreach}

			{foreachelse}

					<p class="note">質問はありません</p>
			{/foreach}


		</div>
	</div>

</div>

{include file='../userFooter.tpl' pagetopLink=1}

