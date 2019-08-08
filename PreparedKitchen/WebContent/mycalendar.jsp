<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
</head>
<body>
	<header><%@ include file="static/header.jsp" %></header>
	
	<section>
		
		<h1>마이페이지</h1>
		<input type="button" value="회원 정보" class="button01" onclick="location.href='member.do?command=mypage'">
		<input type="button" value="내가 쓴 글" class="button01" onclick="location.href='member.do?command=id'">
		<input type="button" value="식단 관리" class="button01" onclick="location.href='member.do?command=cal'">
		<input type="button" value="장바구니" class="button01" onclick="location.href='member.do?command=cart'">
		<input type="button" value="관심 레시피" class="button01" onclick="location.href='member.do?command=interest'">
		<input type="button" value="결제 내역" class="button01" onclick="location.href='member.do?command=paymentinfo'">
		<hr>
		<h2>식단 관리</h2>
		<iframe src="calendar.jsp" style="width: 1000px; height: 900px;">
		</iframe>
		
	</section>
	<%@ include file="static/remocon.jsp" %>
	<footer><%@ include file="static/footer.jsp" %></footer>
</body>
</html>