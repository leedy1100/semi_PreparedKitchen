<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String pg_token = request.getParameter("pg_token");
%>

<script type="text/javascript">

	window.onload = function() {
		document.getElementById("do").submit();
	}

</script>
</head>
<body>

	<form action="../payment" method="post" id="do">
		<input type="hidden" name="command" value="approval">
		<input type="hidden" name="pg_token" value="<%=pg_token %>">
	</form>
	
</body>
</html>