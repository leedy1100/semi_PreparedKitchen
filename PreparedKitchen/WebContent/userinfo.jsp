<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="static/base.css"/>
<style type="text/css">
	.button01{
	width:100pt;
	height: 30pt;
	}
	.th01{
	width:60pt;
	height:20pt;
	text-align: left;
	padding: 5px;
	}
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
		<h1>MY PAGE</h1>
		<input type="button" value="회원 정보" class="button01">
		<input type="button" value="내가 쓴 글" class="button01" onclick="">
		<input type="button" value="식단 관리" class="button01" onclick="">
		<input type="button" value="장바구니" class="button01" onclick="location.href='member.do?command=cart'">
		<input type="button" value="관심 레시피" class="button01" onclick="">
		<input type="button" value="결제 내역" class="button01" onclick="location.href='member.do?command=paymentinfo'">
		<br/><br/>
		<form action="member.do?command=updateinfo&id=<%=dto.getId() %>" method="post" >
		<table>
			<tr>
			<th class="th01">아이디</th>
			<td><input type="text" value="<%=dto.getId() %>" readonly="readonly" name="id"></td>
			</tr>
			<tr>
			<th class="th01">비밀번호</th>
			<td><input type="password" value="<%=dto.getPw()%>" name="pw"></td>
			</tr>
			<tr>
			<th class="th01">이름</th>
			<td><input type="text" value="<%=dto.getName()%>" name="name"></td>
			</tr>
			<tr>
			<th class="th01">이메일</th>
			<td><input type="text" value="<%=dto.getEmail()%>" readonly="readonly" name="email"></td>
			</tr>
			<tr>
			<th class="th01">전화번호</th>
			<td><input type="text" value="<%=dto.getPhone()%>" name="phone"></td>
			</tr>
			<tr>
			<th class="th01">주소</th>
			<td><input type="text" value="<%=dto.getAddr()%>" name="addr"></td>
			</tr>
			<tr>
			<th class="th01">생년월일</th>
			<td><input type="text" value="<%=dto.getBirth()%>" name="birth"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="button" value="메인" onclick="location.href='index.jsp'">
		</form>
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
