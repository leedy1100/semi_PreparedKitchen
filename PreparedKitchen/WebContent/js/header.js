$(function() {
	$("header").hover(function() {
		$("#mainmenu").slideDown(200);
	}, function() {
		$("#mainmenu").hide();
	});
});