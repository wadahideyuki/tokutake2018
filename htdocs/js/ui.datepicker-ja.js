﻿jQuery(function($){
	$.datepicker.regional['ja'] = {
		//showOn: 'button',
		//buttonImage: '../images/calendar.gif',
		buttonText: 'カレンダー',
		closeText: '閉じる',
		prevText: '&#x3c;前',
		nextText: '次&#x3e;',
		currentText: '今日',
		monthNames: ['年 1月', '年 2月', '年 3月', '年 4月', '年 5月', '年 6月',
		'年 7月', '年 8月', '年 9月', '年 10月', '年 11月', '年 12月'],
		monthNamesShort: ['1月','2月','3月','4月','5月','6月',
		'7月','8月','9月','10月','11月','12月'],
		dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
		dayNamesShort: ['日','月','火','水','木','金','土'],
		dayNamesMin: ['日','月','火','水','木','金','土'],
		dateFormat: 'yy/m/d', 
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true};
	$.datepicker.setDefaults($.datepicker.regional['ja']);
});