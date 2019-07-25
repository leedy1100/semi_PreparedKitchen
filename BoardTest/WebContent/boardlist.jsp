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
		<input type="text" name="title" placeholder="제목을 입력하시오"/>
		<input type="submit" value="검색">
	</form>
	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="300" />
		<col width="250" />
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4">--------작성된 글이 존재하지 않습니다--------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.myno }</td>
						<td>${dto.myname }</td>
						<td><a href="img.do?command=selectone&myno=${dto.myno }">${dto.mytitle }</a></td>
						<td>${dto.mydate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4">
				<input type="button" value="글 작성" onclick="location.href='img.do?command=insert'" />
				<input type="button" value="메인" onclick="location.href='index.html'" />
			</td>
		</tr>
	</table>
	
	    <jsp:include page="paging.jsp" flush="true">
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