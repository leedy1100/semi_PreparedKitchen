<%@page import="com.pk.biz.MaterialBiz"%>
<%@page import="com.pk.biz.CartBiz"%>
<%@page import="com.pk.dto.CartDto"%>
<%@page import="com.pk.dto.MaterialDto"%>
<%@page import="com.pk.dto.RecipeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/my_cart.css"/>
</head>
<%
	CartBiz cBiz = new CartBiz();
	MaterialBiz mBiz = new MaterialBiz();
	List<RecipeDto> rList = (List<RecipeDto>)request.getAttribute("rList");
	MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
%>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<%@ include file="mypage_menu.jsp" %>
		<h2>장바구니</h2>
		<table id="mytable">
			<tr>
				<th style="width: 50px"><input type="checkbox"></th><th>이미지</th><th style="width: 500px">이름</th><th style="width: 50px">수량</th><th style="width: 100px">가격</th>
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
				<td class="cart_img"><img src="<%=rDto.getRecipe_img()%>"></td>
				<td><%=rDto.getRecipe_name() %></td>
				<td>1</td>
				<td>10000</td>
			</tr>
<%
					List<CartDto> cList = cBiz.selectList(mDto.getId(), rDto.getRecipe_no());
					List<MaterialDto> mList = mBiz.selectListOne(cList);
					for(MaterialDto mate_dto : mList) {
%>
			<tr>
				<td><input type="checkbox"></td>
				<td><%=mate_dto.getMaterial_name()%></td>
				<td><%=mate_dto.getMaterial_typeName() %></td>
				<td>1</td>
				<td>10000</td>
			</tr>
<%
					}
				}
			}
%>
		</table>
	</section>
		
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>