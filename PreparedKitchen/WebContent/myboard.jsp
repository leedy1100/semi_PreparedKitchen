<%@page import="com.pk.dto.RecipeBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
</head>
<%
	List<RecipeBoardDto> rList = (List<RecipeBoardDto>)request.getAttribute("rList");
%>
<body>
	<header><%@ include file="static/header.jsp" %></header>
	
	<section>
		
		<h1>마이페이지</h1>
		<input type="button" value="회원 정보" class="button01" onclick="location.href='member.do?command=mypage'">
		<input type="button" value="내가 쓴 글" class="button01" onclick="location.href='member.do?command=id'">
		<input type="button" value="식단 관리" class="button01" onclick="location.href='member.do?command=cal'">
		<input type="button" value="장바구니" class="button01" onclick="location.href='member.do?command=cart'">
		<input type="button" value="관심 레시피" class="button01" onclick="location.href='member.do?command=like'">
		<input type="button" value="결제 내역" class="button01" onclick="location.href='member.do?command=paymentinfo'">
		<hr>
		<h2>작성글</h2>
		
		<table border="1">
			<tr>
				<th>글 번호</th><th>제목</th><th>조회수</th><th>좋아요</th><th>날짜</th><th>수정/삭제</th>
			</tr>
<%
			if(rList == null) {
%>
				<tr><td colspan="4">작성된 글이 없습니다.</td></tr>
<%
			}else {
				for(RecipeBoardDto rDto : rList) {
%>
					<tr>
						<td><%=rDto.getRecipeBoard_no() %></td>
						<td><%=rDto.getRecipeBoard_title() %></td>
						<td><%=rDto.getRecipeBoard_readCount() %></td>
						<td><%=rDto.getRecipeBoard_like() %></td>
						<td><%=rDto.getRecipeBoard_regdate() %></td>
						<td>
							<input type="button" value="수정">
							<input type="button" value="삭제">
						</td>
					</tr>
<%
				}
			}
%>
		</table>
		<jsp:include page="mypage_paging/myboard.jsp" flush="true">
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
	<%@ include file="static/remocon.jsp" %>
	<footer><%@ include file="static/footer.jsp" %></footer>
</body>
</html>