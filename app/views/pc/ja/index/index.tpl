{include file='../userHeader.tpl' _page_created=$_cacheTime
_description='長野市で新築、注文住宅、戸建て、木の家を建てる長野市の地元工務店うれし徳武建設です。太陽で床暖房のＯＭソーラーで省エネ・ゼロエネルギー住宅を提案します。長期優良住宅で長持ちするエコな家を、長野市で新築、注文住宅、木の家を建てる徳武建設です。'
_fixedTitle='長野市で新築、注文住宅、木の家を建てるなら、長野市の徳武建設'}
<div class="mainContents">
  <div id="top" class="cf">
    <aside>
      <section class="slider">
        <div class="main-slide">
          <ul>
            {include file="$DOCUMENT_ROOT/include/top.html"}
          </ul>
        </div>
      </section>
    </aside>

		<ul class="spNav">
			<li>
				<a href="{$appPath}/lineup/">
					<span class="img"><img src="{$appPath}/img/top/sp_top_nav_img1.png" alt=""></span>
					<p>商品ラインナップ</p>
				</a>
			</li>
			<li>
				<a href="{$appPath}/product/">
					<span class="img"><img src="{$appPath}/img/top/sp_top_nav_img2.png" alt=""></span>
					<p>施工事例</p>
				</a>
			</li>
			<li>
				<a href="{$appPath}/listup/">
					<span class="img"><img src="{$appPath}/img/top/sp_top_nav_img3.png" alt=""></span>
					<p>見学会・セミナー</p>
				</a>
			</li>
			<li>
				<a href="{$appPath}/company/">
					<span class="img"><img src="{$appPath}/img/top/sp_top_nav_img4.png" alt=""></span>
					<p>会社情報</p>
				</a>
			</li>
		</ul>

    <section class="event-block cf">
      <div  class="event-block-inner">
        <h3><span>見学会とイベント情報</span></h3>
        <div class="txt">
          {foreach from=$_events item='event'}
					<dl>
						<dt>{$event.from_date|datetime:'Y/n/j'}{if $event.term == 2}・{elseif $event.term == 3}～{/if}{if $event.term == 1}{else}{$event.to_date|datetime:'Y/n/j'}{/if}</dt>
						<dd><a href="{$appPath}/event/detail/?id={$event.id|escape}">{$event.title|escape}</a></dd>
					</dl>
          {foreachelse}
          <p>－準備中－</p>
          {/foreach}
        </div>
      </div>
      <div class="btnWrap"><a href="{$appPath}/event/listup/" class="btn-grey">一覧</a></div>
		</section>

    <ul class="main-btn">
      <li class="btn-ietsukuri"><a href="housing/">うれし徳武の <strong>“いえづくり”</strong></a> </li>
      <li class="btn-reform"><a href="reform/">うれし徳武の <strong>“リフォーム”</strong></a> </li>
    </ul>
  </div>

  <ul class="flex-box lineup-block spDisB">
    <li class="lineup01">
			<a href="lineup/morinoie.html">
				<div>
					<h3>杜の家</h3>
					<p>「OMソーラー」を採用した信州型エコ住宅</p>
				</div>
      </a>
		</li>
    <li class="lineup02">
			<a href="lineup/zero.html">
				<div>
					<h3>0宣言の家</h3>
					<p>1ミリも嘘のない家づくりを約束する「0宣言の家」</p>
				</div>
      </a>
		</li>
    <li class="lineup03">
			<a href="lineup/casacrescendo.html">
				<div>
					<h3>CasaCrescendo</h3>
					<p>「OMソーラー」を採用した信州型エコ住宅</p>
				</div>
      </a>
		</li>
  </ul>
  <section class="product-block">
    <div class="inner-wide">
      <h2 class="ttl-lv2">施工事例</h2>
      <ul class="flex-box col4-box">
        <li> <a href="/product/detail/?id=1">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/product/1/img1.jpg"></div>
          <p>２度目に建てる長野の自然な 風景と街を楽しむ高台に建つ家</p>
          </a> </li>
        <li> <a href="/product/detail/?id=2">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/product/2/img1.jpg"></div>
          <p>暮らしやすさと将来の生活の変化に対応できる 平屋のお宅です</p>
          </a> </li>
        <li> <a href="/product/detail/?id=3">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/product/3/img1.jpg"></div>
          <p>地域にとけこむ吹き抜けのある現代和風の家です</p>
          </a> </li>
        <li> <a href="/product/detail/?id=5">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/product/5/img1.jpg"></div>
          <p>縦長の敷地に建つ</p>
          </a> </li>
      </ul>
      <p class="taC"><a href="/product/" class="btn-grey">施工実績の一覧を見る</a></p>
    </div>
  </section>
  <section class="voice-block">
    <div class="inner-wide">
      <h2 class="ttl-lv2">お客様の声</h2>
      <ul class="flex-box col4-box">
        <li> <a href="/voice/detail/?id=11">
          <div class="photo">
            <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/voice/11/img1_s.jpg"></div>
          </div>
          <p>善光寺平を見渡せる高台の家<span>渡辺邸 千曲市</span></p>
          </a> </li>
        <li> <a href="/voice/detail/?id=12">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/voice/12/img1_s.jpg"></div>
          <p>節目節目を大切にした、心通う家づくりを体験しました。<span>久保田邸 長野市安茂里</span></p>
          </a> </li>
        <li> <a href="/voice/detail/?id=10">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/voice/10/img1_s.jpg"></div>
          <p>健康に暮らしたい<span>田中様邸 長野市</span></p>
          </a> </li>
        <li> <a href="/voice/detail/?id=4">
          <div class="photo"><img src="https://www.tokutake-kensetsu.co.jp/images/voice/4/img1_s.jpg"></div>
          <p>専門家の太鼓判「OMソーラーのシステムは良いですよ！」<span>芳原様邸 木島平</span></p>
          </a> </li>
      </ul>
      <p class="taC"><a href="/voice/" class="btn-grey">お客様の声の一覧を見る</a></p>
    </div>
  </section>
  
  <!--CMS--一時コメントアウト
					
						<div class="box">
						  <div class="box_menu">
							  <ul>
									{foreach from=$_specialities item='speciality' key='speciality_key'}
									<li><a href="{$appPath}/product/listup/?category={$speciality_key|escape}">{$speciality|escape}</a></li>
									{foreachelse}
									<li>－準備中－</li>
									{/foreach}
								</ul>
						  </div>
						</div>
						<div class="box right">
						  <div class="box_menu">
							  <ul>
									{foreach from=$_voices item='voice'}
									<li><a href="{$appPath}/voice/detail/?id={$voice.id|escape}">{$voice.title|escape}</a></li>
									{foreachelse}
									<li>－準備中－</li>
									{/foreach}
								</ul>
						  </div>
						</div>
						<div class="box right">
						  <div class="box_menu">
							  <ul>
									{foreach from=$_calendar item='calendar_event'}
									<li style="width:76%;">
										{$calendar_event.from_date|datetime:'Y/n/j'}{if $calendar_event.term == 2}・{elseif $calendar_event.term == 3}～{/if}{if $calendar_event.term == 1}{else}{$calendar_event.to_date|datetime:'Y/n/j'}{/if}<br />
										<a href="{$appPath}/event/detail/?id={$calendar_event.id|escape}&amp;_cal=1">{$calendar_event.title|escape}</a>
									</li>
									{foreachelse}
									<li>－準備中－</li>
									{/foreach}
								</ul>
						  </div>
						</div>
					  <div class="box">
					    <div class="box_menu">
							  <ul class="faq">
								{foreach from=$_faq_categories item='faq_category' key='k' name='category'}
									<li><a href="{$appPath}/faq/#c{$k}">{$faq_category}</a></li>
								{/foreach}
								</ul>
						  </div>
						</div>-->
  <section class="news-block">
    <div class="inner-wide">
      <ul class="flex-box spDisB">
        <li>
          <h2 class="ttl-lv2">会長ブログ</h2>
          <dl>
            {foreach from=$_blog.entries item='blog_entries'}
            <dt>{$blog_entries.dateModified|datetime:'Y/n/j'}</dt>
            <dd><a href="{$blog_entries.link|escape}" title="{$blog_entries.title|escape}">{$blog_entries.title|mb_truncate:'19'|escape}</a></dd>
            {foreachelse}
            <dd>－準備中－</dd>
            {/foreach}
          </dl>
        </li>
        <li>
          <h2 class="ttl-lv2 ttl-blue">メンテブログ</h2>
          <dl>
            {foreach from=$_maintenance_blog.entries item='m_entries'}
            <dt>{$m_entries.dateModified|datetime:'Y/n/j'}</dt>
            <dd> <a href="{$m_entries.link|escape}" title="{$m_entries.title|escape}">{$m_entries.title|mb_truncate:'12'|escape}</a></dd>
            {/foreach}
          </dl>
        </li>
      </ul>
    </div>
  </section>
</div>
<div id="news">
 <div class="flex-box spDisB">
  <h3>News</h3>
  <ul>
    {foreach from=$_infos item='info'}
    <li><span>{$info.created|datetime:'Y/n/j'}:</span><a href="{$appPath}/info/detail/?id={$info.id|escape}">{$info.title|escape}</a></li>
    {/foreach}
  </ul></div>
</div>
{include file='../userFooter.tpl'} 