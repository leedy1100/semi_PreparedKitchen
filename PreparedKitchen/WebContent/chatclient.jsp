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
       	var webSocket = new WebSocket("ws://localhost:8787/PreparedKitchen/chatserver");
        var chatContent = opener.document.getElementById("chatContentUl");
        var inputMessage = opener.document.getElementById("inputMessage");
		var chatForm = opener.document.getElementById("chatform");
		var chatBotForm = opener.document.getElementById("chatBotForm");
<%
		MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
		String role = "";
		
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
	        
	        var scrollbtn = document.getElementById("chatContent");
	        if (scrollbtn.scrollHeight > 0) scrollbtn.scrollTop = scrollbtn.scrollHeight;
	    });
	    
	    opener.document.getElementById("chat").addEventListener("click", function() {
	    	
	    	if(webSocket.readyState === WebSocket.OPEN) {
	    		webSocket.close();
	    	}
	    });

  </script>
<body>
	<iframe name="chatCon" style="visibility: hidden;"></iframe>
</body>
</html>