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
		<table>
			<tr>
				<td class="mypage_menu">회원정보</td>
				<td class="mypage_menu">결제내역</td>
				<td class="mypage_menu">장바구니</td>
				<td class="mypage_menu">관심목록</td>
				<td class="mypage_menu">식단관리</td>
				<td class="mypage_menu">내가쓴글</td>
			</tr>
		</table>
		<hr>
		
		
	</section>
	<%@ include file="static/remocon.jsp" %>
	<footer><%@ include file="static/footer.jsp" %></footer>
</body>
</html>