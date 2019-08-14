<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		parent.location.href='/PreparedKitchen/paymentinfo.jsp';
		
	}
</script>
<%
	String item_name = (String)session.getAttribute("item_name");
	String total = (String)session.getAttribute("total");
%>
</head>
<body>

	<h1><%=item_name %></h1>
	<h2><%=total %>원</h2>
	
</body>
</html>