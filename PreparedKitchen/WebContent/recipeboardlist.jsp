<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/base.css" />
<style type="text/css">

#recipeboardlist{
	text-align: center;
	align-content: center;
}

#button{
	text-align: left;
}

.boardtable{
	margin-top: 300px;
	border: 1px solid black;
	align-content: center;
	position: relative;
}

</style>
</head>
<body>
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp"%>
	</header>

	<section>
		<div id="recipeboardlist">
			<table class="boardtable">
				<col width="50" />
				<col width="100" />
				<col width="300" />
				<col width="80" />
				<col width="80" />
				<col width="200" />
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>제목</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>날짜</th>
				</tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="6">--------작성된 글이 존재하지 않습니다--------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${dto.recipeBoard_no }</td>
								<td>${dto.id }</td>
								<td><a
									href="recipeboard.do?command=selectone&recipeBoard_no=${dto.recipeBoard_no }
						&searchFiled=${paging.searchFiled}&searchValue=${paging.searchValue}
						&pages=${paging.currentPageNo}&lines=${paging.recordsPerPage}">${dto.recipeBoard_title }</a></td>
								<th>${dto.recipeBoard_readCount }</th>
								<td>${dto.recipeBoard_like }</td>
								<td>${dto.recipeBoard_regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr id="button">
					<td colspan="6"><input type="button" value="글 작성"
						onclick="location.href='recipeboard.do?command=insert'" /> <input
						type="button" value="전체 목록"
						onclick="location.href='recipeboard.do?command=list'" /> <input
						type="button" value="메인" onclick="location.href='index.jsp'" /></td>
				</tr>
			</table>

			<jsp:include page="paging.jsp" flush="true">
				<jsp:param name="searchFiled" value="${paging.searchFiled }" />
				<jsp:param name="searchValue" value="${paging.searchValue }" />
				<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
				<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
				<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
				<jsp:param name="startPageNo" value="${paging.startPageNo}" />
				<jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
				<jsp:param name="endPageNo" value="${paging.endPageNo}" />
				<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
				<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
			</jsp:include>
			<form action="recipeboard.do" method="post">
				<input type="hidden" value="search" name="command" /> <select
					name="searchFiled">
					<option value="RECIPEBOARD_TITLE" selected="selected">제목</option>
					<option value="ID">작성자</option>
				</select> <input type="text" name="searchValue" placeholder="내용을 입력하시오" /> <input
					type="submit" value="검색">
			</form>
		</div>
	</section>
	<%@ include file="static/remocon.jsp"%>
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp"%>
	</footer>
</body>
</html>