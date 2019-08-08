<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
</head>
<body>
	<header><%@ include file="static/header.jsp" %></header>
	
	<section>
		<%@ include file="mypage_menu.jsp" %>
		<h2>식단 관리</h2>
		<iframe src="calendar.jsp" style="width: 1000px; height: 900px;">
		</iframe>
		
	</section>
	<%@ include file="static/remocon.jsp" %>
	<footer><%@ include file="static/footer.jsp" %></footer>
</body>
</html>