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
	<form action="img.do" method="post">
		<input type="hidden" value="search" name="command"/>
		<input type="text" name="searchFiled" value="MYTITLE"/>
		<input type="text" name="searchValue" placeholder="제목을 입력하시오"/>
		<input type="submit" value="검색">
	</form>
	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="300" />
		<col width="250" />
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
						<td><a href="img.do?command=selectone&recipeBoard_no=${dto.recipeBoard_no }">${dto.recipeBoard_title }</a></td>
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
				<input type="button" value="메인" onclick="location.href='index.html'" />
			</td>
		</tr>
	</table>
	
	    <jsp:include page="paging.jsp" flush="true">
	  		<jsp:param name="searchFiled" value="${pagingdto.searchFiled }"/>
	    	<jsp:param name="searchValue" value="${pagingdto.searchValue }"/>
            <jsp:param name="recordsPerPage" value="${pagingdto.recordsPerPage}" />
            <jsp:param name="firstPageNo" value="${pagingdto.firstPageNo}" />
            <jsp:param name="prevPageNo" value="${pagingdto.prevPageNo}" />
            <jsp:param name="startPageNo" value="${pagingdto.startPageNo}" />
            <jsp:param name="currentPageNo" value="${pagingdto.currentPageNo}" />
            <jsp:param name="endPageNo" value="${pagingdto.endPageNo}" />
            <jsp:param name="nextPageNo" value="${pagingdto.nextPageNo}" />
            <jsp:param name="finalPageNo" value="${pagingdto.finalPageNo}" />
        </jsp:include>

</body>
</html>