		</div>
		<!-- /container //-->

		<!-- footer_wrapper //-->
		<div class="footer_wrapper">

			<!-- footer //-->
			<footer class="cf">
				<div class="ftContact">
					<div class="inner">
						<div class="box">
							<h2><span>お問い合わせや資料請求、<br class="disN spDisI">展示場の見学など、お気軽にご相談ください。</span></h2>
							<div class="infos">
								<ul>
									<li class="celTel">
										<div class="in">
											<h3>お電話でのお問い合わせ</h3>
											<p><span>026-265-6166</span></p>
											<small>受付時間：9:00～18:00</small>
										</div>
									</li>
									<li class="celMail">
										<div class="in">
											<h3>メールでのお問い合わせ</h3>
											<a href="/mail/form/?id=inquiry"><img class="imgover" src="{$appPath}/img/ft_contact_img_btn.png" alt="資料請求・お問い合わせ" /></a>
										</div>
									</li>
									<li class="celImg">
										<div class="in">
										<a href="/mailmagazine/">
											<img src="{$appPath}/img/ft_contact_img1.png" alt="住まいづくりでお困りの方へ 失敗しない「住まいづくり」「リフォーム」の秘訣 無料メルマガ発信中！" /></a>
										</div>
									</li>
								</ul>
							</div>
							<p class="note">■ご対応可能地域：長野県、XXXXXX、XXXXXX、XXXXXX、XXXXXX、XXXXXX、XXXXXX、XXXXXX、</p>
						</div>
					</div>
				</div>


				<div class="ftBns">
					<div class="inner">
						<ul>
							<li><a href="#"><img src="https://placehold.jp/ffffff/666666/409x129.png" alt="#" width="100%" /></a></li>
							<li><a href="#"><img src="https://placehold.jp/ffffff/666666/409x129.png" alt="#" width="100%" /></a></li>
							<li><a href="#"><img src="https://placehold.jp/ffffff/666666/409x129.png" alt="#" width="100%" /></a></li>
							<li><a href="#"><img src="https://placehold.jp/ffffff/666666/409x129.png" alt="#" width="100%" /></a></li>
							<li><a href="#"><img src="https://placehold.jp/ffffff/666666/409x129.png" alt="#" width="100%" /></a></li>
						</ul>
					</div>
				</div>


				<nav class="navMain posFt">
					<div class="inner">
						<ul>
							<li class="product"         ><a href="{$appPath}/lineup/"                         ><span>商品ラインナップ</span></a></li>
							<li class="product"         ><a href="{$appPath}/product/"                         ><span>施工事例</span></a></li>
							<li class="builder"         ><a href="{$appPath}/housing/"                     ><span>うれし徳武建設のいえづくり</span></a></li>
							<li class="aboutus"         ><a href="/event/listup/"                     ><span>見学会・セミナー</span></a></li>
							<li class="voice"           ><a href="/reform.html"                    ><span>リフォーム</span></a></li>
							<li class="process"         ><a href="/design.html"                     ><span>店舗デザイン</span></a></li>
							<li class="blog"            ><a href="{$appPath}/company/"                            ><span>会社情報</span></a></li>
							<li class="spPrivacy"       ><a href="{$appPath}/privacy.html"                     ><span>プライバシーポリシー</span></a></li>
						</ul>
					</div>
				</nav>


				<div class="information cf">
					<div class="inner">
						<ul class="in">
							<li class="cel1">
								<div class="cel1In">
									<div class="cel1_1"><img class="logo" src="{$appPath}/img/logo.png" alt="うれし　徳武建設株式会社" width="100%" /></div>
									<div class="cel1_2">
										<p class="address">〒381-0084 長野県長野市若槻東条560-1</p>
										<p class="catch_phrase">長野県で注文住宅の木の家工務店 県産材で木造住宅　OMソーラーでゼロエネルギー住宅</p>
									</div>
								</div>
							</li>
							<li class="cel3">
								<a class="privacy" href="{$appPath}/privacy.html">プライバシーポリシー </a>
								<p id="copyright">&copy; 2018 うれし徳武建設株式会社</p>
							</li>
						</ul>
					</div>
				</div>


				<div class="information2">
					<ul>
						<li class="txtMulti">
							<a href="/event/listup/">
								<span><img src="{$appPath}/img/sp_ft_btn1.png" alt="#" width="100%" /></span>
								<p>イベント<br>見学会予約</p>
							</a>
						</li>
						<li>
							<a href="/mail/form/?id=inquiry">
								<span><img src="{$appPath}/img/sp_ft_btn2.png" alt="#" width="100%" /></span>
								<p>来店予約</p>
							</a>
						</li>
						<li>
							<a href="/mail/form/?id=inquiry">
								<span><img src="{$appPath}/img/sp_ft_btn3.png" alt="#" width="100%" /></span>
								<p>資料請求</p>
							</a>
						</li>
						<li class="txtMulti">
							<a href="tel:0262656166">
								<span><img src="{$appPath}/img/sp_ft_btn4.png" alt="#" width="100%" /></span>
								<p>電話での<br>問い合わせ</p>
							</a>
						</li>
					</ul>
					<p id="spCopyright">&copy; 2018 うれし徳武建設株式会社aa</p>
				</div>

				{if $session.uaType == 'sp'}<div class="view_select">表示：{qry_add key='_view' value='sp' alt='モバイル'}｜{qry_add key='_view' value='pc' alt='パソコン'}</div>{/if}

			</footer>
			<!-- /footer //-->

		</div>
		<!-- /footer_wrapper //-->

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script>
    window.FontAwesomeConfig = {
        searchPseudoElements: true
    }
</script>
		<script>
      window.jQuery || document.write('<script src="{$appPath}/js/jquery-1.11.1.min.js"><\/script>')
		</script>
		<script src="{$appPath}/js/plugins.js"></script>

{if $param.controller == 'product'}
  <!-- FlexSlider -->
  <script defer src="{$appPath}/js/jquery.flexslider.js"></script>
  <script type="text/javascript">

    $(window).load(function(){
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: "slide",
        slideshow: false,
        itemWidth: 80,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: "slide",
        slideshow: false,
        pauseOnHover: true,
        sync: "#carousel",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>

	<!-- Optional FlexSlider Additions -->
	<script src="{$appPath}/js/jquery.easing.js"></script>
	<script src="{$appPath}/js/jquery.mousewheel.js"></script>

{elseif $param.controller == 'index'}


	<!-- Optional FlexSlider Additions -->
	<script src="{$appPath}/js/jquery.easing.js"></script>
	<script src="{$appPath}/js/jquery.mousewheel.js"></script>

{elseif $param.controller == 'mailmagazine' && $param._subscribed}

	<script src="{$appPath}/js/jquery.remodal.js"></script>
	<script type="text/javascript">

	{if $param._subscribed}

		{literal}
			var inst = $.remodal.lookup[$('[data-remodal-id=reform]').data('remodal')];
			if(!inst){
				$('[data-remodal-id=subscribed]').remodal().open();
			} else {
				inst.open();
			}
		{/literal}

	{/if}

	</script>

{/if}
	<script src="{$appPath}/js/modernizr-2.6.2.min.js"></script>
	<script src="{$appPath}/js/slick.min.js"></script>
	<script src="{$appPath}/js/waypoint.js"></script>
	<script src="{$appPath}/js/common.js"></script>
	</body>
</html>
