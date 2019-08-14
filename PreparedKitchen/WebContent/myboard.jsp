<%@page import="com.pk.dto.RecipeBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<style type="text/css">
.myboardtable{
	  width: 100%;
    border-collapse: separate;
    border-spacing: 0px;
    border-top: 2px solid #b2b83b;
}
.myboardtable th{
	border-bottom: 1px solid #eaeaea;
	text-align: center;
}
.myboardtable td {
    font-weight: normal;
    color: #5a5a5a;
    text-align: center;
    line-height: 130%;
    vertical-align: middle;
    padding: 10px 0;
    font-size: 13px;
    border-bottom: 1px solid #eaeaea;
}

</style>
</head>
<%
	List<RecipeBoardDto> rList = (List<RecipeBoardDto>)request.getAttribute("rList");
%>
<body>
	<header><%@ include file="static/header.jsp" %></header>
	
	<section>
		<%@ include file="mypage_menu.jsp" %>
		<h2>내가 쓴 글</h2>
		
		<table class="myboardtable">
				<col width="10%" />
				<col width="*" />
				<col width="11%" />
				<col width="11%" />
				<col width="12%" />
				<col width="12%" />
			<tr>
				<th>글 번호</th><th>제목</th><th>조회수</th><th>좋아요</th><th>날짜</th><th>수정/삭제</th>
			</tr>
<%
			if(rList == null) {
%>
				<tr><td colspan="6">작성된 글이 없습니다.</td></tr>
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