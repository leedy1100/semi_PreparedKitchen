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
<style type="text/css">
.imgicon{
	width: 18px;
}
.bottonbox{
	display: inline-block;
	font-size: 20px;
	font-weight: 1000;
}
#imgbox{
	float: right;
}
.recipe_img{
	width: 210px;
	height: 210px;
}
.probox{
	display: inline-block;
	margin: 15px;
	background-color: white;
}
</style>
</head>
<body>
	<header><%@ include file="static/header.jsp" %></header>
	
	<section>
		<%@ include file="mypage_menu.jsp" %>
		<h2>관심 레시피</h2>
			<c:choose>
				<c:when test="${empty rList }">
						<div style="text-align: center; font-weight: 1000; font-size: 20px; margin-top: 50px;">등록된 관심레시피가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${rList }" var="dto">
						<div class="probox">
							<div><a href="/PreparedKitchen/prodetail.do?command=detail&recipeno=${dto.recipe_no}"><img class="recipe_img" src="${dto.recipe_img }"/></a></div>
							<div>
								<div class="bottonbox">${dto.recipe_name }</div>
								<div class="bottonbox" id="imgbox"><a href="member.do?command=deleteInterest&recipe_no=${dto.recipe_no }"><img class="imgicon" src="/PreparedKitchen/image/delete.png"/></a></div>
							</div>	
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</section>
	<%@ include file="static/remocon.jsp" %>
	<footer><%@ include file="static/footer.jsp" %></footer>
</body>
</html>