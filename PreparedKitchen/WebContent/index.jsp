<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/main_board.css"/>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".main_board_one").hover(function() {
			$(this).children(".main_board_fade").fadeIn(500);
		}, function() {
			$(this).children(".main_board_fade").fadeOut(200);
		});
	});
</script>
</head>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
		
	</header>
	<%@ include file="mainimg.html" %>
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
<<<<<<< HEAD
		<a href="recipeboard.do?command=list">recipeboardlist테스트용</a><br/>
		<a href="member.do?command=mypage">MY PAGE</a><br/>
		<a href="payment/mypagepayment.jsp">결제 내역</a><br/>
		<a href="map.do?command=map">지도 테스트</a><br/>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
		<a href="cal.do?command=calendar2">달력</a>
>>>>>>> refs/heads/LJS123
=======
<<<<<<< HEAD
=======
>>>>>>> branch 'master' of https://github.com/KOKOPA/PreparedKitchen.git
=======
		<a href="cal.do?command=calendar">달력</a><br/>
>>>>>>> branch 'master' of https://github.com/KOKOPA/PreparedKitchen.git
		<a href="product.do?command=recipedb">더미데이터 만들기</a><br/>
		<a href="prodetail.do?command=detail&recipeno=1">상품디테일</a><br/>
		<a href="product.do?command=adminchart">차트</a><br/>
		<a href="product.do?command=adminrecipeview">상품등록</a>
=======
		<article>
			<h2>상품 추천</h2>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>123</p>				
				</div>
			</div>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>1234</p>				
				</div>
			</div>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명기ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>12345</p>				
				</div>
			</div>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명기ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㄹ고</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>1234</p>
				</div>
			</div>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명[고기,야채] 맛있어요</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>123</p>				
				</div>
			</div>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>12</p>				
				</div>
			</div>
		</article>
		<article>
			<h2>유저 레시피 추천</h2>
			<div class="main_board_one">
				<img src="/PreparedKitchen/image/main_food_1.jpg">
				<div class="main_board_fade">
					<p>상품명</p>
					<img src="/PreparedKitchen/image/hearts.png">
					<p>123</p>				
				</div>
			</div>
		</article>
>>>>>>> branch 'master' of https://github.com/KOKOPA/PreparedKitchen.git
	</section>

	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>