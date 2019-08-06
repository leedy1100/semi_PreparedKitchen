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
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<a href="recipeboard.do?command=list">recipeboardlist테스트용</a><br/>
		<a href="member.do?command=mypage">MY PAGE</a><br/>
		<a href="payment/mypagepayment.jsp">결제 내역</a><br/>
		<a href="map.do?command=map">지도 테스트</a><br/>
<<<<<<< HEAD
<<<<<<< HEAD
		<a href="cal.do?command=calendar">달력</a>
=======
<<<<<<< HEAD
=======
>>>>>>> branch 'master' of https://github.com/KOKOPA/PreparedKitchen.git
		<a href="product.do?command=recipedb">더미데이터 만들기</a><br/>
		<a href="product.do?command=detail">상품디테일</a><br/>
		<a href="adminchart.jsp">차트</a>
<<<<<<< HEAD
>>>>>>> refs/remotes/origin/ldy
>>>>>>> branch 'master' of https://github.com/KOKOPA/PreparedKitchen.git
=======
>>>>>>> branch 'master' of https://github.com/KOKOPA/PreparedKitchen.git

	</section>

	<%@ include file="static/remocon.jsp" %>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="payment/payment.jsp" %>
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>