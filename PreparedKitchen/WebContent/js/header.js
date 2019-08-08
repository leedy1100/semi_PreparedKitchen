$(function() {
	$("header").hover(function() {
		$("#mainmenu").slideDown(1000);
	}, function() {
		$("#mainmenu").hide();
	});
});