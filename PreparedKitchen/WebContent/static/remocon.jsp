<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/PreparedKitchen/css/remocon.css"/>
<script type="text/javascript">
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			document.getElementById("sendMessage").click();
		}
	}
	
	function chatOn() {
		var chatForm = document.getElementById("chatform");
		var chatBotForm = document.getElementById("chatBotForm");
		if(chatForm.style.display == "block" || chatBotForm.style.display == "block") {
			chatForm.style.display = "none";
			chatBotForm.style.display = "none";
		}else {
			window.open("chatcontroll.jsp", "chat", "");
		}
	}
	
	
</script>
<body>

	<div id="d">
		<a href="#">top</a>
		<img id="chat" alt="1:1문의" src="/PreparedKitchen/image/chat1.png" onclick="chatOn()">
		<div id="chatform">
			<p>1:1 상담<p>
			<div id="chatContent">
				<ul id="chatContentUl">
				</ul>
			</div>
			<div id="chatInput">
				<input id="inputMessage" type="text" onkeyup="enterkey()">
				<input id="sendMessage" type="button" value="전송">
			</div>
		</div>
		<div id="chatBotForm">
			<iframe width="400" height="500" allow="microphone;" src="https://console.dialogflow.com/api-client/demo/embedded/5de17d86-7cd9-47fd-ae12-7b5177fd62a5"></iframe>
	
		</div>
	</div>
	<iframe name="chat" style="visibility: hidden;"></iframe>
</body>
</html>