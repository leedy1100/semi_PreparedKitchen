<%@page import="com.pk.biz.ChatBiz"%>
<%@page import="com.pk.dto.ChatDto"%>
<%@page import="com.pk.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	ChatBiz biz = new ChatBiz();
%>
<link rel="stylesheet" href="css/remocon.css"/>
<script type="text/javascript">
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			document.getElementById("sendMessage").click();
		}
	}
	
	function chatOn() {
		var form = document.getElementById("chatform");
		var chatBotForm = document.getElementById("chatBotForm");
		var role = null;
		
		if(form.style.display == "block" || chatBotForm.style.display == "block") {
			form.style.display = "none";
			chatBotForm.style.display = "none";
			if(role == "ADMIN") {
				<%biz.outAdmin();%>
			}else if(role == "USER") {
				<%biz.outUser();%>
			}
			
		}else {
<%
			MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
			ChatDto cDto = biz.selectChatDao(1);

			String has_admin = cDto.getHas_admin();
			String has_user = cDto.getHas_user();
			
			if(mDto != null) {
%>
				role = "<%=mDto.getRole()%>";
<%
			}
%>
			has_admin = "<%=has_admin%>";
			has_user = "<%=has_user%>";

			console.log(has_admin);	
			
			if(role == "ADMIN" && has_admin == "N") {
				form.style.display = "block";
				window.open("chatclient.jsp", "chat", "");
				<%biz.joinAdmin();%>
				
			}else if(role == "USER") {
				
<%
				cDto = biz.selectChatDao(1);

				has_admin = cDto.getHas_admin();
				has_user = cDto.getHas_user();
%>
				has_admin = "<%=has_admin%>";
				has_user = "<%=has_user%>";
				
				
				if(has_admin == "Y") {
					if(has_user == "Y") {
						
						if(confirm("현재 다른 이용자가 상담중입니다. 챗봇을 이용하시겠습니까?")) {
							chatBotForm.style.display = "block";
						}
						
					}else if(has_user == "N"){
						form.style.display = "block";
						window.open("chatclient.jsp", "chat", "");
						
					}
					
				}else {
					if(confirm("현재 상담이 불가능 합니다. 챗봇을 이용하시겠습니까?")) {
						chatBotForm.style.display = "block";
					}
				}
				
			}else {
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
					location.href = "login.jsp";
				}
			}

			console.log("end "+has_admin);	
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
				<input id="inputMessage" type="text" onkeyup="enterkey()">
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