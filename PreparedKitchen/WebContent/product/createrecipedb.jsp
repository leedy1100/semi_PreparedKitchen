<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/PreparedKitchen/js/createrecipedb.js"></script>
</head>
<body>
	
	<h1>1번을 눌러주세요</h1>
	
	<input type="button" value="1번" onclick="getJsonInfo()">
	<input type="button" value="2번" onclick="getJsonContent()">
	<input type="button" value="3번" onclick="getJsonMaterial()">
	
	<h1>더미데이터 삭제하기</h1>
	<input type="button" value="삭제" onclick="deleteDummy()">

</body>
</html>