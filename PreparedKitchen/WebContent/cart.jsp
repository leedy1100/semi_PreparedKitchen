<%@page import="com.pk.biz.MartBiz"%>
<%@page import="com.pk.dto.MartDto"%>
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
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/PreparedKitchen/js/cart.js"></script>
</head>
<%
	CartBiz cBiz = new CartBiz();
	MaterialBiz mBiz = new MaterialBiz();
	MartBiz martBiz = new MartBiz();
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
				<th style="width: 50px"><input type="checkbox" name="all" onclick="allChk(this.checked)"></th><th>이미지</th><th style="width: 500px">이름</th><th style="width: 100px">가격</th>
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
				<td><input type="checkbox" class="recipeChk" name="rChk" value="<%=rDto.getRecipe_no() %>"></td>
				<td class="cart_img"><img src="<%=rDto.getRecipe_img()%>"></td>
				<td><%=rDto.getRecipe_name() %></td>
				<td></td>
			</tr>
<%
					List<CartDto> cList = cBiz.selectList(mDto.getId(), rDto.getRecipe_no());
					List<MartDto> mList = martBiz.selectListOne(cList);
					for(MartDto martDto : mList) {
%>
			<tr>
				<td>
					<input type="checkbox" class="martChk<%=rDto.getRecipe_no() %>" name="mChk"  value="<%=martDto.getMart_price() %>">
					<input type="hidden" value="<%=martDto.getMart_no() %>">
				</td>
				<td></td>
				<td><%=martDto.getItem_name()%></td>
				<td><%=martDto.getMart_price() %></td>
			</tr>
<%
					}
				}
			}
%>
		</table>
		<form action="payment" method="post" id="cartForm">
			<input type="hidden" name="command" value="confirmpay">
		</form>
	</section>
		
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>