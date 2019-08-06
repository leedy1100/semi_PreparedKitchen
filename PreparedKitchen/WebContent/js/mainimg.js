$(function() {
	$("#main_slide img").click(function() {
		$(this).parent().attr("class", "main_slide_center");
		$(this).parent().siblings().animate({
			opacity: 0
		}, function() {
			//이동 명령
		});
	});
	
	$("#main_left_move").click(function() {
		var right2 = Number($(".main_slide_right2 img").attr("src").substr("-5","1"));
		var res = "";
		if(right2 >= 8) {
			res = "1";
		}else {
			res = String(right2 + 1);
		}
		$(".main_slide_left2").attr("class", "main_slide_none");
		$(".main_slide_left1").attr("class", "main_slide_left2");
		$(".main_slide_center").attr("class", "main_slide_left1");
		$(".main_slide_right1").attr("class", "main_slide_center");
		$(".main_slide_right2").attr("class", "main_slide_right1");
		$(".main_slide_none img[src*="+res+"]").parent().attr("class", "main_slide_right2");
	});
	$("#main_right_move").click(function() {
		var left2 = Number($(".main_slide_left2 img").attr("src").substr("-5","1"));
		var res = "";
		if(left2 <= 1) {
			res = "8";
		}else {
			res = String(left2 - 1);
		}
		$(".main_slide_right2").attr("class", "main_slide_none");
		$(".main_slide_right1").attr("class", "main_slide_right2");
		$(".main_slide_center").attr("class", "main_slide_right1");
		$(".main_slide_left1").attr("class", "main_slide_center");
		$(".main_slide_left2").attr("class", "main_slide_left1");
		$(".main_slide_none img[src*="+res+"]").parent().attr("class", "main_slide_left2");
	});
});