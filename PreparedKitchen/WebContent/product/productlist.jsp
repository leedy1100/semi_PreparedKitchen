<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/main_board.css"/>
<script type="text/javascript" src="/PreparedKitchen/js/mainboard.js"></script>
<style type="text/css">
.view{
	top: 100px;
    left: 3%;
	position: relative;
}
#propaging{
	text-align: center;
}
#noproduct{
	font-size: 30px;
	font-weight: 1000;
	text-align: center;
	margin-top: 200px;
}
section{
}
#imgicon{
	width: 60px;
}
.selectOrder{
	margin: 30px;
}
.selectOrder li{
	list-style: none;
	display: inline-block;
	font-weight: 700;
	border-left: 2px solid gray;
	padding-left: 8px;	
}
.selectOrder li:first-child{
	border: none;
}
.selectOrder li a{
	text-decoration: none;
	color: gray;
}
.selectOrder li :hover{
	color: black;
}
#select{
	width: 100%;
	text-align: right;
}
</style>
</head>
<body>

	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/header.jsp" %>
	</header>
	<section>
	<h1 style="margin: 50px;"><img alt="사진" src="/PreparedKitchen/image/recipe.png" id="imgicon">우리 레시피</h1>
	<div id="select">
		<ul class="selectOrder">
			<li><a href="/PreparedKitchen/product.do?command=productlist&order=PRODUCTLIST_NO">최신순</a></li>
			<li><a href="/PreparedKitchen/product.do?command=productlist&order=SALES_COUNT">조회순</a></li>
			<li><a href="/PreparedKitchen/product.do?command=productlist&order=VIEW_NO">인기순</a></li>
		</ul>
	</div>
	<article>
	<c:choose>
		<c:when test="${empty plist}">
			<div id="noproduct">상품 준비 중입니다.</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${plist }" var="dto">
				<div class="main_board_one" onclick="location.href='/PreparedKitchen/prodetail.do?command=detail&recipeno=${dto.recipe_no}'">
					<img src="${dto.recipe_img }">
					<div class="main_board_fade">
						<p>${dto.recipe_name }</p>
						<img src="/PreparedKitchen/image/click2.png">
						<p class="view">${dto.view_no }</p>
						<img src="/PreparedKitchen/image/buy.png">
						<p>${dto.sales_count }</p>			
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
		</article>
	</section>
		<div id="propaging">
		<jsp:include page="productpaging.jsp" flush="true">
				<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
				<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
				<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
				<jsp:param name="startPageNo" value="${paging.startPageNo}" />
				<jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
				<jsp:param name="endPageNo" value="${paging.endPageNo}" />
				<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
				<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
			</jsp:include>
		</div>	
	<%@ include file="../static/remocon.jsp" %>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/footer.jsp" %>
	</footer>
</body>
</html>