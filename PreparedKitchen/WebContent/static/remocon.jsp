<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#d{
		position: fixed; 
		right: 50%; 
		top: 300px; 
		margin-right: -720px; 
		text-align:center; 
		width: 120px;
		height: 400px;
		background-color: rgb(225, 225, 225);
	}
	#chat{position: absolute; bottom: 5px; right: 2px;}
	#chatform{
		position: relative;
		padding: 10px 10px 10px 10px;
		width: 280px;
		height: 380px;
		right: 300px;
		bottom: 21px;
		background-color: rgb(46, 204, 113);
		display: none;
	}
	#chatform > p {margin: 0px; font-size: 20px; font-weight: bold;}
	#chatContent{
		position: relative;
		width: 280px;
		height: 320px;
		background-color: white;
		overflow: auto;
		overflow-w: hidden;  
	}
	#chatContent ul {padding: 0px;}
	#chatContent li {list-style: none; height: 50px;}
	#chatInput{
		position: absolute;
		bottom: 10px;
	}
	.chatLeft{float: left; text-align: center; clear: both;}
	.chatRight{float: right; text-align: center; clear: both;}
	#chatInput > input[type="text"] {width: 228px;}
</style>
<script type="text/javascript">

	function chatOn() {
		var form = document.getElementById("chatform");
		if(form.style.display == "block") {
			form.style.display = "none";
		}else {
			form.style.display = "block";
			window.open("chatclient.html", "chat", "");
		}
	}

</script>
<body>

	<div id="d">
		<a href="#">top</a>
		<img id="chat" alt="1:1문의" src="image/chat1.png" onclick="chatOn()">
		<div id="chatform">
			<p>1:1 상담<p>
			<div id="chatContent">
				<ul id="chatContentUl">
					<li class="chatLeft">
						<table>
							<tr>
								<td><img src="image/user_icon.png"></td>
								<td>감도체크 하나둘삼넷</td>
							</tr>
						</table>
					</li>
					<li class="chatRight">
						<table>
							<tr>
								<td>감도체크 수신양호</td>
								<td><img src="image/user_icon.png"></td>
							</tr>
						</table>
					</li>
					<li class="chatLeft">
						<table>
							<tr>
								<td><img src="image/user_icon.png"></td>
								<td>완료</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
			<div id="chatInput">
				<input id="inputMessage" type="text">
				<input id="sendMessage" type="button" value="전송">
			</div>
		</div>
	</div>
	<iframe name="chat" style="visibility: hidden;"></iframe>
	
</body>
</html>