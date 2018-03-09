<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>株式会社</title>
		<meta name="keywords" content="">
		<meta name="description" content="株式会社">
		<meta name="viewport" content="width=device-width, height=1200, minimum-scale=0.1, maximum-scale=2.0, user-scalable=yes">
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="apple-touch-icon.png">
		<link rel="stylesheet" href="{$appPath}/css/normalize.css">
		<link rel="stylesheet" href="{$appPath}/css/main.css">
		<link rel="stylesheet" href="{$appPath}/css/style.css">
		<link rel="stylesheet" href="{$appPath}/css/demo.css">
		<link rel="stylesheet" href="{$appPath}/css/flexslider.css">
		<link media="only screen and (max-device-width:480px)" href="{$appPath}/css/sp.css" type="text/css" rel="stylesheet">
		<script src="{$appPath}/js/modernizr-2.6.2.min.js"></script>
	</head>
	<body>

		<!-- wrapper //-->
		<div class="wrapper" id="pagetop">

			<!-- header //-->
			<div class="header clearfix" title="">
				<a href="index.html"  class="logo"><img src="img/logo.png" width="60" height="60" alt=""></a>
				<div class="companyName">
					<img src="img/logo.png" width="300" alt="">

				</div>
			</div>
			<!-- /header //-->

			<!-- navigation //-->
			<div id="navigation" class="navigation clearfix">
				<ul class="navi clearfix">
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<!-- /navigation //-->

			<!-- container //-->
			<div class="container clearfix">

				<!-- floatContainer //-->
				<div class="floatContainer clearfix">

					<!-- leftContents //-->
					<div class="sideContents">
						<ul class="menu" >
							<li></li>
							<li></li>
						</ul>
					</div>

				<table style="border:1px solid #FFF;">
					<tbody>
						<tr style="border:1px solid #FFF;">
							<td>
								{$value.created|escape|default:$tpl_value.default}
							</td>
						</tr>
						<tr style="border:1px solid #FFF;">
							<td>
								{$value.title|escape}
							</td>
						</tr>
						<tr style="border:1px solid #FFF;">
							<td>
								{html_checkboxes name='feature' options=$metafile.features selected=$value.feature mode='conf'}
							</td>
						</tr>
						<tr style="border:1px solid #FFF;">
							<td>
								{$value.spec|escape}
							</td>
						</tr>
						<tr style="border:1px solid #FFF;">
							<td>
								{$value.body|escape|nl2br|default:$tpl_value.default}
							</td>
						</tr>
					</tbody>
				</table>





					<!-- /mainContents //-->
					<div class="mainContents" style="min-height:380px;">

	<div id="main" role="main">
		<section class="slider">
			
			<div id="slider" class="flexslider">
				<ul class="slides">
				{section name='image' loop=$images}
					
					<li>
						<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$images[image].file}" alt="" />
						<p>{$images[image].caption}</p>
					</li>
					
				{/section}
				</ul>
			</div>

			<div id="carousel" class="flexslider">
				<ul class="slides">
				{section name='image' loop=$images}
					
					<li>
						<img src="{$appPath}/images/{$param.controller}/{$value.id}/{$images[image].file}" alt="" />
					</li>
					
				{/section}
				</ul>
			</div>
		</section>
	</div>
        
        
        
        
        
        
        
        
        
        
        
					</div>
					<!-- /mainContents //-->

				</div>
				<!-- /floatContainer //-->

			</div>
			<!-- /container //-->


		</div>
		<!-- /wrapper //-->

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script>
      window.jQuery || document.write('<script src="{$appPath}/js/jquery-1.10.2.min.js"><\/script>')
		</script>
		<script src="{$appPath}/js/plugins.js"></script>
		<script src="{$appPath}/js/main.js"></script>

  <!-- FlexSlider -->
  <script defer src="{$appPath}/js/jquery.flexslider.js"></script>

  <script type="text/javascript">

    $(window).load(function(){
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: "slide",
        slideshow: false,
        itemWidth: 100,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: "slide",
        slideshow: false,
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
	<script defer src="{$appPath}/js/demo.js"></script>

	</body>
</html>
