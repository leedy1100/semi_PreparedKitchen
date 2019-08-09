<%@page import="com.pk.dto.RecipeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pk.dto.InterestListDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pk.biz.RecipeBiz"%>
<%@page import="com.pk.biz.InterestListBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
</head>
<%
	List<RecipeDto> rList = (List<RecipeDto>)request.getAttribute("rList");
%>
<body>
	<header><%@ include file="static/header.jsp" %></header>
	
	<section>
		<%@ include file="mypage_menu.jsp" %>
		<h2>관심 레시피</h2>
		<table border="1">
			<tr>
				<th><input type="checkbox"></th><th>이미지</th><th>이름</th>
			</tr>
<%
			if(rList.isEmpty()) {
%>
			<tr>
				<td colspan="4">장바구니가 비었습니다.</td>
			</tr>
<%
			}else {
				for(RecipeDto rDto : rList) {
					
%>
			<tr>
				<td><input type="checkbox"></td>
				<td><img src="<%=rDto.getRecipe_img()%>"></td>
				<td><%=rDto.getRecipe_name() %></td>
			</tr>
<%
				}
			}
%>
		</table>
		
	</section>
	<%@ include file="static/remocon.jsp" %>
	<footer><%@ include file="static/footer.jsp" %></footer>
</body>
</html>