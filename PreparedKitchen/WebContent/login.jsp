<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
<link rel="stylesheet" href="css/login.css"/>
</head>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	<div id="logindiv">
		<h1>로그인 / 회원가입</h1>
	
		<form action="login.do" method="post" id="loginform">
		<input type="hidden" name="command" value="login">
			<div id="snsbtn">
				<input type="button" value="카카오" onclick="">
				<input type="button" value="네이버" onclick="">
			</div>
			<div id="iddiv">
				<img alt="" src="#">
				<input type="text" name="id" id="idtext">
			</div>
			<div id="pwdiv">
				<img alt="" src="">
				<input type="password" name="pw" id="pwtext">
			</div>
			<div id="subdiv">
				<input type="button" value="회원가입">
				<input type="submit" value="로그인">
			</div>
		</form>
	</div>
	
</body>
</html>