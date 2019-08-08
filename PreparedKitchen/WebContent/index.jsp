<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
		
	</header>
	<%@ include file="mainimg.html" %>
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<article>
			<h2>상품</h2>
		</article>
	</section>

	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="payment/payment.jsp" %>
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>