<%@page import="com.pk.dto.MemberDto"%>
<%@page import="com.pk.dto.ChatDto"%>
<%@page import="com.pk.biz.ChatBiz"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

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
<%
		
	if(role.equals("ADMIN")) {
%>
		chatForm.style.display = "block";
		opener.window.open("chatclient.jsp", "chat", "");
		
<%
	}else if(role.equals("USER")) {
		if(hasAdmin.equals("Y")) {
			if(hasUser.equals("N")) {
%>
				chatForm.style.display = "block";
				opener.window.open("chatclient.jsp", "chat", "");
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
</head>
<body>

</body>
</html>