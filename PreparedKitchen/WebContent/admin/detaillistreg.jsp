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
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<style type="text/css">
.menulist{
	display: inline-block;
}
#menu{
	min-height: 500px;
	flex-basis: 400px;
}
#menulist{
	text-align: center;
	flex-basis: 500px;
}
#pagingbutton{
	text-align: center;
}
#menubox{
	margin: 50px;
	display: flex;
}
.menuname{
	font-size: 20px;
	cursor: default;
	font-weight: 1000;
}
.menuname2{
	list-style-type: none;
	display: none;
	font-size: 15px;
}
.menulink{
	text-decoration: none;
	color: black;
	font-weight: 700;
}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$(".menuname").click(function() {
			$(this).next().slideToggle().end().parent().siblings().find("ul").slideUp();
		});
		
		$("#productdelete").submit(function() {
			if($("input[name=recipe_no]:checked").length == 0){
				alert("선택한 레시피가 없습니다.");
				return false;
			}
		});
		
		
		$("input[name=recipe_no]").click(function() {
			if($("input[name=recipe_no]").length==$("input[name=recipe_no]:checked").length){
				$("input[name=all]").prop("checked",true);
			}else{
				$("input[name=all]").prop("checked",false);
			}
		})
		
	});
	
	function allchk(bool) {
		$("input[name=recipe_no]").each(function() {
				$(this).prop("checked",bool);	
		});
	}

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
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,5,lastindex) }</a></li>
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
				<li><a class="menulink" href="/PreparedKitchen/product.do?command=category&categoryname=${listcategory.recipe_category }&recipe_reg=N">${fn:substring(category,6,lastindex) }</a></li>
		</c:if>
	</c:forEach>
</ul>
</div>
</div>
<div class="menulist">
	<input type="button" value="미등록" onclick="location.href='/PreparedKitchen/product.do?command=category&categoryname=${categoryname }&recipe_reg=N'"/>
	<input type="button" value="등록" onclick="location.href='/PreparedKitchen/product.do?command=reglist&categoryname=${categoryname }&recipe_reg=Y'"/>
	<form action="product.do" id="productdelete">
	<input type="hidden" name="categoryname" value="${categoryname }"/>
	<input type="hidden" name="command" value="productdelete"/>
	<table id="menulist">
		<col width="50px">
		<col width="50px">
		<col width="100px">
		<col width="350px">
		<col width="80px">
		<col width="300px">
		<col width="150px">
		<tr style="background-color: #FFCCCC;">
			<th><input type="checkbox" value="전체" name="all" onclick="allchk(this.checked)"/></th>
			<th>번호</th>
			<th>이미지</th>
			<th>이름</th>
			<th>영양소</th>
			<th>카테고리</th>
			<th>상품등록</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr style="background-color: #FFFFFF;">
					<td colspan="7" style="text-align: center;">-------------------------상품등록 된 레시피가 없습니다.-------------------------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr style="background-color: #FFFFFF;">
						<td><input type="checkbox" value="${dto.recipe_no }" name="recipe_no"/></td>
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
		<tr>
			<td colspan="7">
				<input type="submit" value="삭제" style="float: left;">
			</td>
		</tr>
	</table>
	</form>
	<div id="pagingbutton">
		<jsp:include page="regrecipelistpaging.jsp" flush="true">
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
</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/footer.jsp" %>
	</footer>
</body>
</html>