$(function() {
		$(".main_board_one").hover(function() {
			$(this).children(".main_board_fade").fadeIn(100);
		}, function() {
			$(this).children(".main_board_fade").fadeOut(200);
		});
	});