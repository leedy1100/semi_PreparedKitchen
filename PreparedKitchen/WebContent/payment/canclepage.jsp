<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload = function() {
		document.getElementById("do").submit();
		
	}

</script>
<%
	String tid = request.getParameter("tid");
%>
</head>
<body>
	<form action="/PreparedKitchen/payment" method="post" id="do">
		<input type="hidden" name="command" value="cancle">
		<input type="hidden" name="tid" value="<%=tid%>">
		
	</form>
</body>
</html>