
function payDo() {
	var pay_frame = document.getElementById("pay_frame");
	var pay_black = document.getElementById("pay_black");
	
	window.open("", "pay_target", "");
	f1.submit();
	
	pay_frame.style.display = "block";
	pay_black.style.display = "block";
}

function payBlack() {
	var pay_frame = document.getElementById("pay_frame");
	var pay_black = document.getElementById("pay_black");
	
	pay_frame.style.display = "none";
	pay_black.style.display = "none";
}


