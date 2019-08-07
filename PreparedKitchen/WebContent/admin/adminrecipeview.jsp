<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.menulist{
	display: inline-block;
}
#menu{
	margin: 50px;
	width: 200px;
	height: 1000px;
}
</style>
<title>레시피목록</title>
</head>
<body>
<div id="menu" class="menulist">
<a href="/PreparedKitchen/index.jsp">메인</a>
<h1>한식</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="한식" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<h1>퓨전</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="퓨전" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<h1>중국</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="중국" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<h1>일본</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="일본" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<h1>이탈리아</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="이탈리아" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<h1>서양</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="서양" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<h1>동남아시아</h1>
<ul>
	<c:forEach items="${list }" var="list">
		<c:set var="category" value="${list.recipe_category }"/>
		<c:set var="cate" value="동남아시아" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${list.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div>
</div>
</body>
</html>