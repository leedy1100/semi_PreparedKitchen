window.onload = function() {
	var menu = document.getElementsByClassName("mypage_menu");
	var h2 = document.getElementsByTagName("h2");

	for(var i = 0; i < menu.length; i++) {
		if(menu[i].value == h2[0].innerHTML) {
			menu[i].style.backgroundColor = "rgb(150,150,150)";
			menu[i].style.color = "rgb(225,225,225)";
			menu[i].style.fontSize = "16px";
		}
	}
}