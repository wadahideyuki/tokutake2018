$(document).ready(function(){

//spのnav
$(".spBtnMenu").click(function(){
	$(".navMain.posHd .inner").slideToggle();
	return false;
});

$(".main-slide ul").slick({
	dots: true,
	  fade:true,
	  autoplay:true,
	infinite: true,
	  speed:1000,
	  arrows:false
  });

/*----- bottomのバナー -----*/
var ftBnsNum = $("footer .ftBns li").length;
var ftBnsSlk = $(".ftBns ul").slick({
	arrows:false,
  dots: false,
  infinite: true,
  speed: 500,
	autoplay:true,
	autoplaySpeed:5000,
  slidesToShow: 3,
  slidesToScroll: 1,
	centerMode:true,
	centerPadding:0,
	variableWidth:false,
	responsive:[
		{
			breakpoint:768,
			settings:{
				slidesToShow: 1,
				centerPadding:"15%"
			}
		}
	]
});
//if(ftBnsNum > 3){
//	$("footer .ftBns .inner").css({"max-width": "none"});
//	ftBnsSlk.slick("slickSetOption", "centerMode", true, true);
//}
//ftBnsSlk.slick("setPosition");
/*----- /bottomのバナー -----*/

	
//Slick
$(".slkBox1 ul").slick({
	arrows:false,
  dots: false,
  infinite: true,
  speed: 500,
	autoplay:true,
	autoplaySpeed:5000,
  slidesToShow: 5,
  slidesToScroll: 1,
	responsive:[
		{
			breakpoint:768,
			settings:{
				slidesToShow: 3
			}
		}
	]
});


//waypoint
/*
$(".pageReformTop .points section").waypoint(function(direction){
	var activePoint = $(this.element);
	if(direction == "down"){
		activePoint.addClass("show");
	}
});
*/


});//DocRdyFncEnd
