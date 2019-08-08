<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
<style type="text/css">
	.button01{
	width:100pt;
	height: 30pt;
	}
</style>
	
	
</head>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<h1>마이페이지</h1>
		<input type="button" value="회원 정보" class="button01" onclick="location.href='member.do?command=mypage'">
		<input type="button" value="내가 쓴 글" class="button01" onclick="location.href='member.do?command=id'">
		<input type="button" value="식단 관리" class="button01" onclick="location.href='member.do?command=cal'">
		<input type="button" value="장바구니" class="button01" onclick="location.href='member.do?command=cart'">
		<input type="button" value="관심 레시피" class="button01" onclick="location.href='member.do?command=like'">
		<input type="button" value="결제 내역" class="button01" onclick="location.href='member.do?command=paymentinfo'">
		<hr>
		<h2>장바구니</h2>
		<table border="1">
			<tr>
				<th>이미지</th>
				<th>재료</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<%for(int i=0 ; i<10 ; i++){ %>
			<tr>
				<td>ㅋㅋㅋ</td>
				<td>재료오</td>
				<td><input type="text"></td>
				<td><input type="text" readonly="readonly" value="10000"></td>
			</tr>
			<% } %>
		</table>
		<input type="button" value="메인" onclick="location.href='index.jsp'">
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>