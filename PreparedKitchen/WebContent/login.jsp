<%response.setHeader("Cache-control", "no-store"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
<link rel="stylesheet" href="css/login.css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
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
				<a id="custom-login-btn" href="javascript:loginWithKakao()">
					<img src="image/kakao_login_btn_small.png"/>
				</a>
				
				<input type="button" value="네이버" onclick="">
			</div>
			<div id="iddiv">
				<img alt="" src="#">
				<input type="text" name="id" id="idtext" placeholder="I	D">
			</div>
			<div id="pwdiv">
				<img alt="" src="">
				<input type="password" name="pw" id="pwtext" placeholder="PASSWORD">
			</div>
			<div id="subdiv">
				<input type="button" value="회원가입" onclick="location.href='login.do?command=signup'">
				<input type="submit" value="로그인">
			</div>
		</form>
	</div>
	
</body>
</html>