<%@page import="com.pk.dto.MemberDto"%>
<%@page import="com.pk.dto.ChatDto"%>
<%@page import="com.pk.biz.ChatBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
	<script type="text/javascript">
        var webSocket = new WebSocket("ws://192.168.10.147:8787/PreparedKitchen/chatserver");
        var chatContent = opener.document.getElementById("chatContentUl");
        var inputMessage = opener.document.getElementById("inputMessage");
		var chatForm = opener.document.getElementById("chatform");
		var chatBotForm = opener.document.getElementById("chatBotForm");
<%
		ChatBiz cBiz = new ChatBiz();
		ChatDto cDto = cBiz.selectChatDao(1);
		MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
		String role = "";
		String hasAdmin = cDto.getHas_admin();
		String hasUser = cDto.getHas_user();
		
		if(mDto != null) {
			role = mDto.getRole();
		}
%>
	    webSocket.onerror = function(event) {
	    	alert(event.data);
	    };
	    
	    webSocket.onopen = function(event) {
			window.open("chat?command=join&role=<%=role%>", "chatCon", "");
	    };
	    
	    webSocket.onmessage = function(event) {
	    	chatContent.innerHTML += event.data;
	    };
	    
	    webSocket.onclose = function(event) {
	    	window.open("chat?command=out&role=<%=role%>", "chatCon", "");
	    };
	    
	    
	    opener.document.getElementById("sendMessage").addEventListener("click", function() {
	    	
	    	chatContent.innerHTML += "<li class='chatRight'><table><tr><td>" 
	    						  + inputMessage.value
	    						  + "</td><td><img src='image/user_icon.png'></td></tr></table></li>";
	        webSocket.send("<li class='chatLeft'><table><tr><td><img src='image/user_icon.png'></td><td>" 
					  + inputMessage.value
					  + "</td></tr></table></li>");
	        inputMessage.value = "";
	    });
	    
	    opener.document.getElementById("chat").addEventListener("click", function() {
	    	
	    	if(webSocket.readyState === WebSocket.OPEN) {
	    		webSocket.close();
	    	}
	    });

<%
		System.out.println("hasAdmin = " + hasAdmin);
		System.out.println("hasUser = " + hasUser);
		System.out.println("role = " + role);
		
		if(role.equals("ADMIN")) {
%>
			chatForm.style.display = "block";
<%
		}else if(role.equals("USER")) {
			if(hasAdmin.equals("Y")) {
				if(hasUser.equals("N")) {
%>
					chatForm.style.display = "block";
<%
				}else if(hasUser.equals("Y")) {
%>
					if(opener.confirm("현재 상담중입니다.\n챗봇을 이용하시겠습니까?")) {
						chatBotForm.style.display = "block";
					}
<%
				}
			}else {
%>
				if(opener.confirm("현재 상담을 이용할 수 없습니다.\n챗봇을 이용하시겠습니까?")) {
					chatBotForm.style.display = "block";
				}
<%			
			}
			
		}else {
%>
			if(opener.confirm("로그인이 필요한 기능입니다.\n로그인 페이지로 이동하시겠습니까?")) {
				opener.location.href="login.jsp";
			}
<%
		}
		
%>
  </script>
<body>
	<iframe name="chatCon" style="visibility: hidden;"></iframe>
</body>
</html>