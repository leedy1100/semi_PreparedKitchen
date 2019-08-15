<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
<link rel="stylesheet" href="css/login.css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/kakaoLogin.js"></script>
</head>
<body>
	
	<c:choose>
		<c:when test="${!empty memberDto }">
			<h1>잘못된 페이지 입니다.</h1>
		</c:when>
		<c:otherwise>
			<header>
				<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
				<%@ include file="static/header.jsp" %>
			</header>
			
			<div id="logindiv">
				<h1>로그인 / 회원가입</h1>
			
				<form action="login.do" method="post" id="loginform">
					<input type="hidden" name="command" value="login">
					<div id="snsbtn">
						<a id="custom-login-btn" href="javascript:loginWithKakao()" style="text-decoration: none;">
							<img src="image/kakao_login_btn_small.png"/>
						</a>
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
					<div>
						<a href="javascript:forgot()" style="text-decoration: none;">아이디 / 비밀번호를 잊어버리셨나요?</a>
					</div>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>