<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<style type="text/css">
td{text-align: center;}

</style>
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("memberDto");
%>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<%@ include file="manager_menu.jsp" %>
		<h2>회원 정보</h2>
		
		<table border="1">
		<col width="100">
		<col width="100">
		<col width="200">
		<col width="200">
		<col width="400">
		<col width="50">
		<col width="80">
		<col width="350">
		<col width="80">
			<tr>
				<th>I    D</th>
				<th>이      름</th>
				<th>E-mail</th>
				<th>전화번호</th>
				<th>주      소</th>
				<th>가입여부</th>
				<th>생년월일</th>
				<th>가  입  일</th>
				<th>회원등급</th>
			</tr>
			<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4"> ----- 와 이게 회원이 없네 ---- </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.id }</td>
						<td>${dto.name }</td>
						<td>${dto.email }</td>
						<td>${dto.phone }</td>
						<td>${dto.addr }</td>
						<td>
						${dto.enabled }
							<c:if test="${dto.role eq 'USER' and dto.enabled eq 'Y'}">
								<input type="button" value="탈퇴시키기" onclick="location.href='member.do?command=goodbyeuser&id=${dto.id}'">
							</c:if>
						</td>
						<td>${dto.birth }</td>
						<td>${dto.regdate }</td>
						<td>
						${dto.role }
							<c:choose>
								<c:when test="${dto.role eq 'USER' }">
									<input type="button" value="관리자권한 부여" onclick="location.href='member.do?command=managergrant&id=${dto.id}'">
								</c:when>
								<c:when test="${dto.role eq 'MANAGER' }">
									<input type="button" value="관리자권한 회수" onclick="location.href='member.do?command=managercollect&id=${dto.id}'">
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		</table>
		
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
