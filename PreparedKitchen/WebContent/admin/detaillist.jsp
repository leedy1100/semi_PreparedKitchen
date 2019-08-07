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
}
ul{
	list-style-type: none;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$("#menuname").click(function() {
			//$(this).next().slideToggle();
			//$("b").not(this).next().slideUp();
			//$(this).parent().siblings.find("ul").slideUp();
			$(this).next().slideToggle().end().parent().siblings().find("ul").slideUp();
		});
	});

</script>
<title>레시피 세부리스트</title>
</head>
<body>
<div id="menubox">
<div id="menu" class="menulist">
<a href="/PreparedKitchen/index.jsp">메인</a>
<div class="menuname">한식</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="한식" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<div class="menuname">퓨전</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="퓨전" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<div class="menuname">중국</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="중국" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<div class="menuname">일본</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="일본" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<div class="menuname">이탈리아</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="이탈리아" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<div class="menuname">서양</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="서양" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
<div class="menuname">동남아시아</div>
<ul>
	<c:forEach items="${listcategory }" var="listcategory">
		<c:set var="category" value="${listcategory.recipe_category }"/>
		<c:set var="cate" value="동남아시아" ></c:set>
		<c:set var="lastindex" value="${fn:length(category) }"></c:set>
		<c:if test="${fn:contains(category,cate)}">
				<li><a href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }">${fn:substring(category,3,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
<div class="menulist">
	<table id="menulist">
		<col width="50px">
		<col width="80px">
		<col width="300px">
		<col width="80px">
		<col width="200px">
		<col width="100px">
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>이름</th>
			<th>영양소</th>
			<th>카테고리</th>
			<th>상품등록</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="6">--------레시피 준비중입니다.--------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.recipe_no }</td>
						<td><img src='${dto.recipe_img }' alt='이미지없음' style="width: 50px;"/></td>
						<td>${dto.recipe_name }</td>
						<td>${dto.recipe_nutrient }</td>
						<td>${dto.recipe_category }</td>
						<td>${dto.recipe_reg }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div id="pagingbutton">
		<jsp:include page="adminrecipelistpaging.jsp" flush="true">
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
</div>
</div>
</body>
</html>