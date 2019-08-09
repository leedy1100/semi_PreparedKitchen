$(function() {
	$("header").hover(function() {
		$("#mainmenu").slideDown(500);
	}, function() {
		$("#mainmenu").hide();
	});
});