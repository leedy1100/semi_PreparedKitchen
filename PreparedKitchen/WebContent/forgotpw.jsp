<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/forgotIdPw.js"></script>
</head>
<% String id = request.getParameter("id"); %>
<body>
	
	<h1>비밀번호 변경</h1>

	<form action="login.do" method="post">
		<input type="hidden" name="command" value="noConfirmPw">
		<input type="hidden" name="id" value="<%=id %>">
		<table>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" name="pw">
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호 확인</th>
				<td>
					<input type="password" name="pwConfirm" id="pwC">
					<span id=pwSpan></span>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="변경">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>