jQuery(function($){

	var active  = false;

	//フォームの内容が変更されたとき
	$('#img_src').change(function()
	{
		var preview = $('#img_preview');

		//現在表示されているものを消す。
		if(preview.find("img")){
			preview.find("img").fadeOut(300);
		}

		//preview.html('<div style="width:600px;height:48px;background-color:#FFF;padding:4px;"><img src="/images/sys/indicator.gif" /></div>').animate({"height":"35px"},300);

		//アップロード
		$(this).upload(
			'<?php if (dirname(dirname($_SERVER['SCRIPT_NAME'])) != '/'){ echo  dirname(dirname($_SERVER['SCRIPT_NAME']));} ?>/image/upload',
			$("form").serialize(),
			function(html){

				//サムネイルの表示
				preview.html(html).animate({"height":(parseInt(preview.find("img").height()) + parseInt(100)) + "%"},300,function()
				{
					//preview.find("img").hide().fadeIn(300);
					$('#cropbox').Jcrop({
						aspectRatio: <?php if($_GET['_crop_aspect']){echo htmlspecialchars($_GET['_crop_aspect']);}else{echo '1.78';} ?>,
						onSelect: updateCoords
					});

					active = true;
				});
			},'html');
	});

	if(active == false){

		$('#cropbox').Jcrop({
			aspectRatio: <?php if($_GET['_crop_aspect']){echo htmlspecialchars($_GET['_crop_aspect']);}else{echo '1.78';} ?>,
			onSelect: updateCoords
		});
	};

//	//離れるときに画像を削除（削除不要）
//	$(window).bind("beforeunload",function(){
//		var unlinkFile = $("#postPhotoName").val();
//		$.ajax({
//			async: false,
//			cache: false,
//			type:	"POST",
//			url:	"/contents/project/uploadimage",
//			data:	"postPhotoName="+unlinkFile
//
//		});
//	});

	//プレビュー画像削除
	$('body').on('click', '#del_img', function() {

		var preview = $('#img_preview');
		$('#img').val('');
		preview.html('').animate({"height":"1px"},300);
		return false;
	});

  function updateCoords(c)
  {
    $('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);
  };

  function checkCoords()
  {
    if (parseInt($('#w').val())) return true;
    alert('Please select a crop region then press submit.');
    return false;
  };

  function Sleep( T ){
    var d1 = new Date().getTime();
    var d2 = new Date().getTime();
    while( d2 < d1+1000*T ){    //T秒待つ
      d2=new Date().getTime();
    }
    return;
  }
});

