<%@page import="com.pk.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/PreparedKitchen/css/mypage.css">
<script type="text/javascript" src="/PreparedKitchen/js/mypage.js"></script>
</head>

	<h1>관리자페이지</h1>
	<div id="mypage_menubar">
		<input type="button" value="회원 관리" class="mypage_menu" onclick="location.href='member.do?command=usermanagement'">
	</div>
	<hr>
	
</body>
</html>