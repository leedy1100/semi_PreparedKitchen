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

	<form action="/PreparedKitchen/product.do" method="post">
		<input type="hidden" name="command" value="createdb"/>
		<input type="submit" value="db에 저장하기">
		<table>
			<thead></thead>
			<tbody></tbody>
		</table>
	</form>

</body>
</html>