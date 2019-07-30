<%@page import="com.pk.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/remocon.css"/>
<script type="text/javascript">
	
	
	function chatOn() {
		var form = document.getElementById("chatform");
		var chatBotForm = document.getElementById("chatBotForm");
		
		if(form.style.display == "block" || chatBotForm.style.display == "block") {
			form.style.display = "none";
			chatBotForm.style.display = "none";
			
		}else {
<%
			MemberDto mDto = (MemberDto)session.getAttribute("memberDto");

			String chatAdmin = (String)application.getAttribute("chatadmin");
			String chatUser = (String)application.getAttribute("chatuser");
%>
			<%-- var role = <%=mDto.getRole() %> --%>
			var role = "user";
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
							chatBotForm.style.display = "block";
						}
						
					}else {
						form.style.display = "block";
						window.open("chatclient.jsp", "chat", "");
						
					}
					
				}else {
					if(confirm("현재 다른 이용자가 상담중입니다. 챗봇을 이용하시겠습니까?")) {
						chatBotForm.style.display = "block";
					}
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
		<div id="chatBotForm">
			<iframe
			    allow="microphone;"
			    width="350"
			    height="430"
			    src="https://console.dialogflow.com/api-client/demo/embedded/c2a16472-7d11-485e-935b-d504a9f652a9">
			</iframe>
		</div>
	</div>
	<iframe name="chat" style="visibility: hidden;"></iframe>
</body>
</html>