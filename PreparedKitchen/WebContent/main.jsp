<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/main_board.css"/>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/PreparedKitchen/js/mainboard.js"></script>
<style type="text/css">
.view{
	top: 100px;
    left: 3%;
	position: relative;
}
.noproduct{
	font-size: 30px;
	font-weight: 1000;
	text-align: center;
	margin-top: 200px;
}
section{
	min-height: 1500px;
}
#imgicon{
	width: 60px;
	margin-top: 100px;
}
.boardtable{
	  width: 100%;
    border-collapse: separate;
    border-spacing: 0px;
    border-top: 2px solid #b2b83b;
}
.boardtable th{
	border-bottom: 1px solid #eaeaea;
	text-align: center;
}
.boardtable td {
    font-weight: normal;
    color: #5a5a5a;
    text-align: center;
    line-height: 130%;
    vertical-align: middle;
    padding: 10px 0;
    font-size: 13px;
    border-bottom: 1px solid #eaeaea;
}
.recipecnt {
    text-decoration: none;
    cursor: pointer;
    color: #58585a;
}
</style>
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
		<h1 style="margin: 50px;"><img alt="사진" src="/PreparedKitchen/image/recipe.png" id="imgicon">추천 레시피</h1>
			<c:choose>
		<c:when test="${empty plist}">
			<div class="noproduct">상품 준비 중입니다.</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${plist }" var="dto" end="7">
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
<<<<<<< HEAD
=======
	<h1 style="margin: 50px;"><img alt="사진" src="/PreparedKitchen/image/board.png" id="imgicon">유저 추천 레시피</h1>
			<c:choose>
		<c:when test="${empty rlist}">
			<div class="noproduct"> 준비 중입니다.</div>
		</c:when>
		<c:otherwise>
			<table class="boardtable">
				<col width="*" />
				<col width="15%" />
				<col width="15%" />
				<col width="11%" />
				<col width="11%" />
				<tr>
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>좋아요</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${rlist }" var="dto">
					<tr>
						<td>
						<a class="recipecnt" href="/PreparedKitchen/recipeboard.do?command=selectone&recipeBoard_no=${dto.recipeBoard_no }">${dto.recipeBoard_title }</a>
						</td>
						<td>${dto.recipeBoard_regdate }</td>
						<td>${dto.id }</td>
						<td>${dto.recipeBoard_like }</td>
						<td>${dto.recipeBoard_readCount }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>	
>>>>>>> refs/remotes/origin/ldy2
		</article>
	</section>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>