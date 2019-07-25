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
	
	<h1>로그인 / 회원가입</h1>
	
	<form action="">
		<input type="button" value="카카오" onclick="">
		<input type="button" value="네이버" onclick="">
		<div id="iddiv">
			<img alt="" src="#">
			<input type="text" id="idtext">
		</div>
		<div id="pwdiv">
			<img alt="" src="">
			<input type="password" id="pwtext">
		</div>
		<input type="button" value="회원가입">
		<input type="submit" value="로그인">
	</form>
</body>
</html>