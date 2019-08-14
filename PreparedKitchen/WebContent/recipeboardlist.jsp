<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/base.css" />
<style type="text/css">
input, select, option {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;  
}
input, select {
    width:80px;
    height:20px;
    border : 1px #ccc solid;
    vertical-align:top;
}
#recipeboardlist{
	position: relative;
	text-align: center;
	top: 30px;
}

#button{
	text-align: left;
}

.boardtable{
	  width: 100%;
    border-collapse: separate;
    border-spacing: 0px;
    border-top: 2px solid #b2b83b;
}
.boardtable th{
	border-bottom: 1px solid #eaeaea;
	text-align: center;
}
.boardtable td {
    font-weight: normal;
    color: #5a5a5a;
    text-align: center;
    line-height: 130%;
    vertical-align: middle;
    padding: 10px 0;
    font-size: 13px;
    border-bottom: 1px solid #eaeaea;
}
.recipecnt {
    text-decoration: none;
    cursor: pointer;
    color: #58585a;
}
#imgicon{
	width: 50px;
	margin-top: 100px;
}
</style>
</head>

<body>
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
		<section>
		<h1><a href="/PreparedKitchen/recipeboard.do?command=list" style="text-decoration: none; color: black;"><img alt="사진" src="/PreparedKitchen/image/board.png" id="imgicon">유저 추천 레시피</a></h1>
		<div id="recipeboardlist">
			<table class="boardtable">
				<col width="10%" />
				<col width="*" />
				<col width="11%" />
				<col width="11%" />
				<col width="12%" />
				<col width="12%" />
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>좋아요</th>
					<th>조회수</th>
				</tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="6">작성된 글이 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
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
				<tr id="button">
					<td colspan="6" style="text-align: left; border-bottom: none;">
					<c:choose>
						<c:when test="${memberDto.id != null }">
							<input type="button" value="글쓰기" onclick="location.href='recipeboard.do?command=insert'" /> 
							<input type="button" value="전체 목록" onclick="location.href='recipeboard.do?command=list'" /> 
						</c:when>
						<c:otherwise>
							<input type="button" value="전체 목록" onclick="location.href='recipeboard.do?command=list'" /> 
						</c:otherwise>
					</c:choose>
					</td>
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
				<input type="hidden" value="search" name="command" /> 
				<select name="searchFiled">
					<option value="RECIPEBOARD_TITLE" selected="selected">제목</option>
					<option value="ID">작성자</option>
				</select> <input type="text" name="searchValue" placeholder="내용을 입력하시오" style="width: 200px;"/> <input
					type="submit" value="검색">
			</form>
		</div>
			</section>
			<%@ include file="static/remocon.jsp" %>
			<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>