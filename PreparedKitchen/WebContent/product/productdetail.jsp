<%@page import="com.pk.dto.MaterialDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pk.dto.RecipeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/proDetail.css"/>
</head>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file= "../static/header.jsp" %>
	</header>
	
	<section>

		<h1><c:out value="${recipe.recipe_name }"></c:out></h1>
		
		<div id="detailHeader">
			<div id="headerLeft">
				<img alt="recipe_img" src="${recipe.recipe_img }">
			</div>
			<div id="headerRigth">
				<div id="detailNutrient">영양정보
					<table border="1">
						<tr>
							<th>탄수화물</th>
							<td></td>
						</tr>
						<tr>
							<th>단백질</th>
							<td></td>
						</tr>
						<tr>
							<th>지방</th>
							<td></td>
						</tr>
						<tr>
							<th>칼로리</th>
							<td><c:out value="${recipe.recipe_nutrient }"></c:out></td>
						</tr>
					</table>
				</div>
				<div id="detailMaterial" style="width:500px;">
					<c:forEach items="${material }" var="mDto">
						<input type="button" value="${mDto.material_name }">
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div id="detailBody">
			${recipe.recipe_content }
		</div>
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/footer.jsp" %>
	</footer>
</body>
</html>