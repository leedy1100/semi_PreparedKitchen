<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/PreparedKitchen/css/mypage.css">
<script type="text/javascript" src="/PreparedKitchen/js/mypage.js"></script>
</head>
<body>
	<h1>마이페이지</h1>
	<div id="mypage_menubar">
		<input type="button" value="회원 정보" class="mypage_menu" onclick="location.href='member.do?command=mypage'">
		<input type="button" value="내가 쓴 글" class="mypage_menu" onclick="location.href='member.do?command=id'">
		<input type="button" value="식단 관리" class="mypage_menu" onclick="location.href='member.do?command=cal'">
		<input type="button" value="장바구니" class="mypage_menu" onclick="location.href='member.do?command=cart'">
		<input type="button" value="관심 레시피" class="mypage_menu" onclick="location.href='member.do?command=interest'">
		<input type="button" value="결제 내역" class="mypage_menu" onclick="location.href='member.do?command=paymentinfo'">
	</div>
	<hr>
</body>
</html>