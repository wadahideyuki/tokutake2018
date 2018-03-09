/**
 * ユーティリティ js
 */
( function() {
	var easing = 0.25;
	var interval = 20;
	var d = document;
	var targetX = 0;
	var targetY = 0;
	var targetHash = '';
	var scrolling = false;
	var splitHref = location.href.split('#');
	var currentHref_WOHash = splitHref[0];
	var incomingHash = splitHref[1];
	var splitRef = document.referrer.split('#');
	var referrerUrl = splitRef[0];
	var prevX = null;
	var prevY = null;

	addEvent(window, 'load', init);
	addEvent(window, 'load', hideLinkLine);
	addEvent(window, 'load', autoPOP);
	// addEvent(window, 'load', _getMenuHeight);
	addEvent(window, 'load', menuFloat);
	addEvent(window, 'scroll', menuFloat);
	//addEvent(window, 'keydown', testtest); //キーダウンで呼び出す関数（予定：Enterキー押下時ページごとに指定したボタンがSubmitされるようにする）

	// 左メニューのフロート処理
	function menuFloat() {

		// ヘッダタイトルバーの高さ
		var hd_h = 52;
		// 左ナビの高さ
		var nav_h = $("#navcontainer").outerHeight();
		// コンテンツエリアの高さ
		var contents_h = $("#contentContainer").outerHeight();
		// ウィンドウの高さ
		var window_h = $(window).height();
		// ボトミング判定用
		var bottom_h = window_h - contents_h;

		// ボトミングしている場合（上方向へ）
		// if ((contents_h > nav_h) && (contents_h - nav_h) <
		// $(window).scrollTop()) {
		if(( contents_h - nav_h) < $(window).scrollTop()) {

			if(contents_h > nav_h) {

				$("#content").css('min-height', nav_h);
				$("#navcontainer").removeClass("menu_fix");
				$("#navcontainer").addClass("menu_bottom");
				$("#navcontainer").css('bottom', bottom_h + $(window).scrollTop() - 6 + 'px');
				// $("#aaaa").html(contents_h + ':' + nav_h + ':' +
				// $(window).scrollTop());
			}

			// スクロール量が52px以上の場合
		} else if($(window).scrollTop() > hd_h) {

			$("#content").css('min-height', nav_h);
			$("#navcontainer").addClass("menu_fix");
			$("#navcontainer").removeClass("menu_bottom");

			// 通常時
		} else {

			$("#navcontainer").removeClass("menu_fix");
			$("#navcontainer").removeClass("menu_bottom");
			$("#navcontainer").css('bottom', 'none');
		}
	}

	// メニュー高さ
	function _getMenuHeight() {

		$("#absolute").html($("#navcontainer").outerHeight());
	}

	// リンク周りの点線を隠す
	function hideLinkLine() {

		var blur = function() { this.blur()
		};
		for(var i = 0; i < document.links.length; i++) {
			document.links[i].onfocus = blur;
		}
		// document.form.elements.input.submit = blur;
		// document.form. on Facebook
	}

	// init
	function init() {

		setOnClickHandler();

		if(referrerUrl != currentHref_WOHash) {
			return;
		}
		if(incomingHash) {
			if(window.attachEvent && !window.opera) {
				setTimeout(function() {scrollTo(0, 0);
					setScroll('#' + incomingHash);
				}, 50);
			} else {
				scrollTo(0, 0);
				setScroll('#' + incomingHash);
			}
		}
	}

	// イベント追加
	function addEvent(eventTarget, eventName, func) {
		if(eventTarget.addEventListener) {
			eventTarget.addEventListener(eventName, func, false);
		} else if(window.attachEvent) {
			eventTarget.attachEvent('on' + eventName, function() {func.apply(eventTarget);
			});
		}
	}

	function setOnClickHandler() {
		var links = d.links;
		for(var i = 0; i < links.length; i++) {
			var link = links[i];
			var splitLinkHref = link.href.split('#');
			if(currentHref_WOHash == splitLinkHref[0] && d.getElementById(splitLinkHref[1])) {
				addEvent(link, 'click', startScroll);
			}
		}
	}

	function startScroll(event) {
		if(event) {
			event.preventDefault();
		} else if(window.event) { // IE
			window.event.returnValue = false;
		}
		setScroll(this.hash);
	}

	function setScroll(hash) {
		var targetEle = d.getElementById(hash.substr(1));
		if(!targetEle)
			return;
		var ele = targetEle;
		var x = 0;
		var y = 0;
		while(ele) {
			x += ele.offsetLeft;
			y += ele.offsetTop;
			ele = ele.offsetParent;
		}
		var maxScroll = getScrollMaxXY();
		targetX = Math.min(x, maxScroll.x);
		targetY = Math.min(y, maxScroll.y);
		targetHash = hash;
		if(!scrolling) {
			scrolling = true;
			scroll();
		}
	}

	function scroll() {
		var currentX = d.documentElement.scrollLeft || d.body.scrollLeft;
		var currentY = d.documentElement.scrollTop || d.body.scrollTop;
		var vx = ( targetX - currentX) * easing;
		var vy = ( targetY - currentY) * easing;
		var nextX = currentX + vx;
		var nextY = currentY + vy;
		if((Math.abs(vx) < 1 && Math.abs(vy) < 1) || (prevX === currentX && prevY === currentY)) {
			scrollTo(targetX, targetY);
			scrolling = false;
			location.hash = targetHash;
			prevX = prevY = null;
			return;
		} else {
			scrollTo(parseInt(nextX), parseInt(nextY));
			prevX = currentX;
			prevY = currentY;
			setTimeout(function() {scroll()
			}, interval);
		}
	}

	function getDocumentSize() {
		return {
			width : Math.max(document.body.scrollWidth, document.documentElement.scrollWidth),
			height : Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)
		};
	}

	function getWindowSize() {
		var result = {};
		if(window.innerWidth) {
			var box = d.createElement('div');
			with(box.style) {
				position = 'absolute';
				top = '0px';
				left = '0px';
				width = '100%';
				height = '100%';
				margin = '0px';
				padding = '0px';
				border = 'none';
				visibility = 'hidden';
			}
			d.body.appendChild(box);
			var width = box.offsetWidth;
			var height = box.offsetHeight;
			d.body.removeChild(box);
			result = {
				width : width,
				height : height
			};
		} else {
			result = {
				width : d.documentElement.clientWidth || d.body.clientWidth,
				height : d.documentElement.clientHeight || d.body.clientHeight
			};
		}
		return result;
	}

	function getScrollMaxXY() {
		if(window.scrollMaxX && window.scrollMaxY) {
			return {
				x : window.scrollMaxX,
				y : window.scrollMaxY
			};
		}
		var documentSize = getDocumentSize();
		var windowSize = getWindowSize();
		return {
			x : documentSize.width - windowSize.width,
			y : documentSize.height - windowSize.height
		};
	}

}());

/**
 * 削除アラート
 *
 */
function diag(msg) {

	if(msg) {
		res = confirm(msg);
	} else {
		res = confirm('本当に削除してよろしいですか？');
	}
	if(res == true) {
		return true;
	}
	return false;
}

/**
 * サブミット
 *
 */
function submitForm() {

	var digit2 = document.getElementById('prdcode').value;

	if(digit2.length >= 2) {

		document.forms['extract'].submit();
	}
	if(digit2.length == 0) {

		document.forms['extract'].submit();
	}
}

function autoPOP() {

	var x = document.getElementsByTagName('a');
	for(var i = 0; i < x.length; i++) {

		if(x[i].getAttribute('className') == 'popup' || x[i].getAttribute('class') == 'popup') {
			x[i].onclick = function() {
				return winOpen(this.href)
			}
			x[i].title += '別ウィンドウで開きます';
		}
		if(x[i].getAttribute('className') == 'print popup' || x[i].getAttribute('class') == 'print popup') {
			x[i].onclick = function() {
				return winOpen(this.href)
			}
			x[i].title += '別ウィンドウで開きます';
		}
		if(x[i].getAttribute('className') == 'edit popup' || x[i].getAttribute('class') == 'edit popup') {
			x[i].onclick = function() {
				return winOpen(this.href)
			}
			x[i].title += '別ウィンドウで開きます';
		}
	}
};

function winOpen(url) {
	window.open(url, 'popup', 'width=760,height=760,scrollbars=1,resizable=1');
	return false;
};

function MM_swapImgRestore() { // v3.0
	var i, x, a = document.MM_sr;
	for( i = 0; a && i < a.length && ( x = a[i]) && x.oSrc; i++)
	x.src = x.oSrc;
}

function MM_preloadImages() { // v3.0
	var d = document;
	if(d.images) {
		if(!d.MM_p)
			d.MM_p = new Array();
		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
		for( i = 0; i < a.length; i++)
		if(a[i].indexOf("#") != 0) {
			d.MM_p[j] = new Image;
			d.MM_p[j++].src = a[i];
		}
	}
}

function MM_findObj(n, d) { // v4.01
	var p, i, x;
	if(!d)
		d = document;
	if(( p = n.indexOf("?")) > 0 && parent.frames.length) {
		d = parent.frames[n.substring(p+1)].document;
		n = n.substring(0, p);
	}
	if(!( x = d[n]) && d.all)
		x = d.all[n];
	for( i = 0; !x && i < d.forms.length; i++)
	x = d.forms[i][n];
	for( i = 0; !x && d.layers && i < d.layers.length; i++)
	x = MM_findObj(n, d.layers[i].document);
	if(!x && d.getElementById)
		x = d.getElementById(n);
	return x;
}

function MM_swapImage() { // v3.0
	var i, j = 0, x, a = MM_swapImage.arguments;
	document.MM_sr = new Array;
	for( i = 0; i < (a.length - 2); i += 3)
	if(( x = MM_findObj(a[i])) != null) {
		document.MM_sr[j++] = x;
		if(!x.oSrc)
			x.oSrc = x.src;
		x.src = a[i + 2];
	}
}

function changeFontSize(size) {
	var fontSize = size;
	$.cookie('font', fontSize, {
		expires : 7
	});
	document.getElementById('body').className = fontSize;
	// alert('フォントサイズは' + fontSize + 'ですa');
}

// チェックボックスすべてチェック
function checkall(obj) {
	var elms = document.getElementsByName('select[]');
	for(var i = 0; i < elms.length; i++) {
		elms[i].checked = obj.checked;
	}
}

//テキストボックスでEnterキー押下してもSubmitされないようにする
$('html').keydown(function(ev) {
//
  if((ev.which && ev.which === 13) || (ev.keyCode && ev.keyCode === 13)) {
//
// //setOnEnterClickButton('test_submit', 'test');
//
     if(document.activeElement.type === 'text') {
        return false;
     } else {
       return true;
     }
   } else {
     return true;
   }
 });


//3桁カンマ区切り
function numberFormat(value, p, record) {

  // 元々付いているカンマを外す
  var num = new String(value).replace(/,/g, "");

  if (isNaN(num)) {
    return value;
  } else {

    //頭の0をとる
    if(num !== '0') {
      var search = new RegExp("^0+0?");
      num = num.replace(search,"");

      //1以下の少数は頭に0を付与
      var search2 = new RegExp("^\\.");
      num = num.replace(search2,"0.");
    }
    // 数値データなら、3桁区切りにする
    while(num != (num = num.replace(/^(-?\d+)(\d{3})/, "$1,$2")));
    return num;
  }
}

/**
 * カンマをとる
 * @param values カンマのある値
 * @return カンマを削除した値
 */
function removeComma(value) {

  // 元々付いているカンマを外す
  var num = new String(value).replace(/,/g, "");

  if (isNaN(num)) {
    return value;
  } else {
    return num;
  }
}

/**
 * 加算
 * @param values 加算したい値をカンマで繋いだ文字列
 * @return 計算結果
 */
function add(value){

  return $.ajax({ type  : "GET",
                   url   : "/calc/add/values/" + value + "/",
                   async : false }).responseText;
}
/**
 * 減算
 * @param values 減算したい値をカンマで繋いだ文字列
 * @return 計算結果
 */
function sub(value){

  return $.ajax({ type  : "GET",
                   url   : "/calc/sub/values/" + value + "/",
                   async : false }).responseText;
}
/**
 * 乗算
 * @param values 乗算したい値をカンマで繋いだ文字列
 * @return 計算結果
 */
function mul(value){

  return $.ajax({ type  : "GET",
                   url   : "/calc/mul/values/" + value + "/",
                   async : false }).responseText;
}
/**
 * 除算
 * @param values 除算したい値をカンマで繋いだ文字列
 * @return 計算結果
 */
function div(value){

  return $.ajax({ type  : "GET",
                   url   : "/calc/div/values/" + value + "/",
                   async : false }).responseText;
}


/**
 * 日付加算
 *
 * 開始日付に期間を加算し結果を返す
 *
 * @param startDate 開始日付
 * @param kikan     期間
 * @return 加算後の日付
 */
function addDate(startDate, kikan){

  return $.ajax({ type  : "GET",
                   url   : "/calendar/adddate/start_date/" + startDate +"/kikan/" + kikan + "/",
                   async : false }).responseText;
}








/**
 * Enterキーを押した場合にSubmitするボタンを設定
 * @param targetButtonId 押したいボタンのid
 */
function setOnEnterClickButton(targetButtonId,formName){

	alert('aaa');

  var form = (formName == null) ? document.forms[0] : document.forms[formName];
  var targetButton = document.getElementById(targetButtonId);
  document.onkeypress=function(e){
    e = e ? e : event;
    var keyCode= e.charCode ? e.charCode : ((e.which) ? e.which : e.keyCode);
    var elem = e.target ? e.target : e.srcElement;
    if(Number(keyCode) == 13) {//13=EnterKey
      if(!isIgnoreEnterKeySubmitElement(elem)){
        targetButton.click();
      }
      return isInputElement(elem) ? false : true;
    }
  }
}
function isIgnoreEnterKeySubmitElement(elem){
  var tag = elem.tagName;
  if(tag.toLowerCase() == "textarea"){
    return true;
  }
  switch(elem.type){
    case "button":
    case "submit":
    case "reset":
    case "image":
    case "file":
      return true;
  }
  return false;
}
function isInputElement(elem){
  switch(elem.type){
    case "text":
    case "radio":
    case "checkbox":
    case "password":
      return true;
  }
  return false;
}

function testtest(event) {

	if((event.which && event.which === 13) || (event.keyCode && event.keyCode === 13)) {

		if(document.activeElement.type === 'text') {

			event.preventDefault(); //イベントのキャンセル
			return false;

		//テキスト以外
		} else {
			return true;
		}
	} else {

		return true;
	}
}
