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
<link rel="stylesheet" href="static/base.css"/>
<style type="text/css">
.menulist{
	display: inline-block;
}
#menu{
}
#menulist{
	text-align: center;
}
#pagingbutton{
	text-align: center;
}
#menubox{
	margin: 50px;
}
.menuname{
	font-size: 20px;
	cursor: default;
}
.menuname2{
	list-style-type: none;
	display: none;
}
.menulink{
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$(".menuname").click(function() {
			$(this).next().slideToggle().end().parent().siblings().find("ul").slideUp();
		});
	});

</script>
<title>레시피 세부리스트</title>
</head>
<body>
<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/header.jsp" %>
	</header>
	
	<section>
<div id="menubox">
<div id="menu" class="menulist">
<a href="/PreparedKitchen/index.jsp">메인</a>
<div class="menulistbox">
<div class="menuname">한식</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="한식" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulistbox">
<div class="menuname">퓨전</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="퓨전" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulistbox">
<div class="menuname">중국</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="중국" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulistbox">
<div class="menuname">일본</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="일본" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulistbox">
<div class="menuname">이탈리아</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="이탈리아" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulistbox">
<div class="menuname">서양</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="서양" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulistbox">
<div class="menuname">동남아시아</div>
<ul class="menuname2">
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="동남아시아" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
</div>
</div>
</section>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/footer.jsp" %>
	</footer>
</body>
</html>