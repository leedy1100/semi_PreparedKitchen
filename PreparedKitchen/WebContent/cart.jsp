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
		<table border="1">
			<tr>
				<th><input type="checkbox"></th><th>이미지</th><th>이름</th><th>수량</th><th>가격</th>
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
		<jsp:include page="mypage_paging/cart.jsp" flush="true">
			<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
			<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			<jsp:param name="startPageNo" value="${paging.startPageNo}" />
			<jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
			<jsp:param name="endPageNo" value="${paging.endPageNo}" />
			<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
	</section>
		
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>