<%@page import="com.pk.dto.MemberDto"%>
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
<%
			/* MemberDto mDto = (MemberDto)session.getAttribute("member"); */

			String chatAdmin = (String)application.getAttribute("chatadmin");
			String chatUser = (String)application.getAttribute("chatuser");
%>
			<%-- var role = <%=mDto.getRole() %> --%>
			var role = "admin";
			
			<%-- console.log("chatAdmin = " + <%=chatAdmin%> + " || chatUser = " + <%=chatUser%>); --%>
			
			if(role == "admin") {
				form.style.display = "block";
				window.open("chatclient.jsp", "chat", "");
				
			}else if(role == "user") {
				var chatAdmin = <%=chatAdmin%>;
				var chatUser = <%=chatUser%>;
				
				if(chatAdmin == "1") {
					if(chatUser == "1") {
						if(confirm("현재 다른 이용자가 상담중입니다. 챗봇을 이용하시겠습니까?")) {
							window.open("chatclient.jsp", "chat", "");
						}
						
					}else {
						form.style.display = "block";
						window.open("chatclient.jsp", "chat", "");
						
					}
					
				}else {
					window.open("chatclient.jsp", "chat", "");
				}
				
			}else {
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
					location.href = "login.jsp";
				}
			}
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