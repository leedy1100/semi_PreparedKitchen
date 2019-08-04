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
	#mainleft{float: left; margin: 10px 0px 0px 20px;}
	#mainright{float: right; margin: 25px 30px 0px 0px;}
	#mainmenu{width: 60; height: 60; margin: 10px 10px 10px 10px;}
	#maintitle{color: rgb(241, 255, 76); font-size: 40px; text-decoration: none; font-weight: bold;}
	#search{}
	#headerlogin{color: white; font-size: 14px; text-decoration: none;}
</style>
<%
	MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
%>

<script type="text/javascript">

</script>

<body>
	<div id="mainleft">
		<img id="mainmenu">
		<a id="maintitle" href="/PreparedKitchen/index.jsp">Prepared Kitchen</a>
	</div>
	<div id="mainright">
		<img id="search">
<%
	if(memberDto == null){
%>
		<a id="headerlogin" href="login.do?command=gologin">login</a>
<%
	} else {
%>
		<%= memberDto.getName() %>님 환영합니다.
		<a id="headerlogin" href="login.do?command=logout">logout</a>
<%
	}
%>
	</div>
</body>
</html>