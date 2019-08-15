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
.recipecnt{
	text-decoration: none;
	color: black;
}
</style>
</head>

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
				<th>글 번호</th><th>제목</th><th>작성날짜</th><th>작성자</th><th>좋아요</th><th>조회수</th>
			</tr>
				<c:choose>
					<c:when test="${empty rList }">
						<tr>
							<td colspan="6">작성된 글이 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${rList }" var="dto">
							<tr>
								<td>${dto.recipeBoard_no }</td>
								<td><a class="recipecnt"
									href="recipeboard.do?command=selectone&recipeBoard_no=${dto.recipeBoard_no }
						&searchFiled=${paging.searchFiled}&searchValue=${paging.searchValue}
						&pages=${paging.currentPageNo}&lines=${paging.recordsPerPage}">${dto.recipeBoard_title }</a></td>
								<td>${dto.recipeBoard_regdate }</td>
								<td>${dto.id }</td>
								<td>${dto.recipeBoard_like }</td>
								<td>${dto.recipeBoard_readCount }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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