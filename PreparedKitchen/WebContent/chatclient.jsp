<%@page import="com.pk.dto.ChatDto"%>
<%@page import="com.pk.biz.ChatBiz"%>
<%@page import="com.pk.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head> 
<%
	MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
	String role = mDto.getRole();
	ChatBiz biz = new ChatBiz();
	ChatDto cDto = biz.selectChatDao(1);
%>
	<script type="text/javascript">
       // var webSocket = new WebSocket("ws://192.168.10.147:8787/PreparedKitchen/chatserver");
       var webSocket = new WebSocket("ws://localhost:8787/PreparedKitchen/chatserver");
        var chatContent = opener.document.getElementById("chatContentUl");
        var inputMessage = opener.document.getElementById("inputMessage");
     	
        var role = "<%=role%>";
		console.log("client role " + role);
        
	    webSocket.onerror = function(event) {
	    	alert(event.data);
	    };
	    
	    webSocket.onopen = function(event) {
	    	console.log(role + "챗시작"); 
	    	
			console.log("client "+ role + " <%=cDto.getHas_admin()%>");
	    };
	    
	    webSocket.onmessage = function(event) {
	    	chatContent.innerHTML += event.data;
	    	
	    };
	    
	    webSocket.onclose = function(event) {

	    	console.log(role + "챗종료");
	    	
			console.log("client "+ role + " <%=cDto.getHas_admin()%>");

	    };
	    
	    
	    opener.document.getElementById("sendMessage").addEventListener("click", function() {
	    	
	    	chatContent.innerHTML += "<li class='chatRight'><table><tr><td>" 
	    						  + inputMessage.value
	    						  + "</td><td><img src='image/user_icon.png'></td></tr></table></li>";
	        webSocket.send("<li class='chatLeft'><table><tr><td><img src='image/user_icon.png'></td><td>" 
					  + inputMessage.value
					  + "</td></tr></table></li>");
	        inputMessage.value = "";
	        
			console.log("client "+ role + " <%=cDto.getHas_admin()%>");
	    });
	    
	    opener.document.getElementById("chat").addEventListener("click", function() {
	    	
	    	if(webSocket.readyState === WebSocket.OPEN) {
	    		webSocket.close();
	    	}
	    });
    
  </script>
<body>

</body>
</html>