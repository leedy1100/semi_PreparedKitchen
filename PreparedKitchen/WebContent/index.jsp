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
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
		
	</header>
	<%@ include file="mainimg.html" %>
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<a href="recipeboard.do?command=list">recipeboardlist테스트용</a><br/>
		<a href="member.do?command=mypage">MY PAGE</a><br/>
		<a href="payment/mypagepayment.jsp">결제 내역</a><br/>
		<a href="map.do?command=map">지도 테스트</a><br/>
<<<<<<< HEAD
		<a href="cal.do?command=calendar">달력</a><br/>
=======
		<a href="cal.do?command=calendar">달력</a>
>>>>>>> refs/remotes/origin/ldy
		<a href="product.do?command=recipedb">더미데이터 만들기</a><br/>
		<a href="prodetail.do?command=detail&recipeno=1">상품디테일</a><br/>
		<a href="product.do?command=adminchart">차트</a><br/>
		<a href="product.do?command=adminrecipeview">상품등록</a>
	</section>

	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="payment/payment.jsp" %>
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>