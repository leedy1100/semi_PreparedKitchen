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
	MemberDto mDto = (MemberDto)session.getAttribute("member");
	String role = mDto.getRole();
%>
	<script type="text/javascript">
        var webSocket = new WebSocket("ws://localhost:8787/PreparedKitchen/chatserver");
        var chatContent = opener.document.getElementById("chatContentUl");
        var inputMessage = opener.document.getElementById("inputMessage");
     	
        var role = <%=role%>;
        
	    webSocket.onerror = function(event) {
	    	alert(event.data);
	    };
	    
	    webSocket.onopen = function(event) {
<%
			application.setAttribute("chat"+role, "1");
%>
	    	/* console.log(role + "챗시작"); */
	    };
	    
	    webSocket.onmessage = function(event) {
	    	chatContent.innerHTML += event.data;
	    	
	    };
	    
	    webSocket.onclose = function(event) {
			<%-- console.log("chatAdmin = " + <%=(String)application.getAttribute("chatadmin")%> + 
						" || chatUser = " + <%=(String)application.getAttribute("chatuser")%>); --%>
<%
			application.setAttribute("chat"+role, "0");
%>
	    	/* console.log(role + "챗종료"); */

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
    
  </script>
<body>

</body>
</html>