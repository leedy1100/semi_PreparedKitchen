<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>list</h1>
	<form action="recipeboard.do" method="post">
		<input type="hidden" value="search" name="command"/>
		<input type="text" name="searchFiled" value="RECIPEBOARD_TITLE"/>
		<input type="text" name="searchValue" placeholder="제목을 입력하시오"/>
		<input type="submit" value="검색">
	</form>
	<table border="1">
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
						<td><a href="recipeboard.do?command=selectone&recipeBoard_no=${dto.recipeBoard_no }">${dto.recipeBoard_title }</a></td>
						<th>${dto.recipeBoard_readCount }</th>
						<td>${dto.recipeBoard_like }</td>
						<td>${dto.recipeBoard_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="6">
				<input type="button" value="글 작성" onclick="location.href='recipeboard.do?command=insert'" />
				<input type="button" value="메인" onclick="location.href='index.jsp'" />
			</td>
		</tr>
	</table>
	
	    <jsp:include page="paging.jsp" flush="true">
	  		<jsp:param name="searchFiled" value="${paging.searchFiled }"/>
	    	<jsp:param name="searchValue" value="${paging.searchValue }"/>
            <jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
            <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
            <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
            <jsp:param name="startPageNo" value="${paging.startPageNo}" />
            <jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
            <jsp:param name="endPageNo" value="${paging.endPageNo}" />
            <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
            <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
        </jsp:include>

</body>
</html>