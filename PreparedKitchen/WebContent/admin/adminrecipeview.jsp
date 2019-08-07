<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

div{
	display: inline-block;
	margin: 50px;
}
</style>
<title>레시피목록</title>
</head>
<body>
<div>
<a href="/PreparedKitchen/index.jsp">메인</a>
<h1>한식</h1>
<ul>
	<li><a href="/PreparedKitchen/product.do?command=category&categoryname=한식,튀김/커틀릿">한식,튀김/커틀릿</a></li>
	<li><a href="/PreparedKitchen/product.do?command=category&categoryname=한식,찜">한식,찜</a></li>
	<li><a href="/PreparedKitchen/product.do?command=category&categoryname=한식,찌개/전골/스튜">한식,찌개/전골/스튜</a></li>
	<li>한식,조림</li>
	<li>한식,부침</li>
	<li>한식,볶음</li>
	<li>한식,밥</li>
	<li>한식,밑반찬/김치</li>
	<li>한식,만두/면류</li>
	<li>한식,떡/한과</li>
	<li>한식,도시락/간식</li>
	<li>한식,나물/생채/샐러드</li>
	<li>한식,국</li>
	<li>한식,구이</li>
</ul>
<h1>퓨전</h1>
<ul>
	<li>퓨전,튀김/커틀릿</li>
	<li>퓨전,찜</li>
	<li>퓨전,샌드위치/햄버거</li>
	<li>퓨전,빵/과자</li>
	<li>퓨전,부침</li>
	<li>퓨전,밥</li>
	<li>퓨전,만두/면류</li>
	<li>퓨전,도시락/간식</li>
	<li>퓨전,나물/생채/샐러드</li>
	<li>퓨전,구이</li>
</ul>
</div>
<div>
</div>
</body>
</html>