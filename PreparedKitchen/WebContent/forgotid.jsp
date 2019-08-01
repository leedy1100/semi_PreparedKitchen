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
<body>


	<fieldset>
		<legend>ID찾기</legend>
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" placeholder="이름"  id="name">
				</td>
			</tr>
			<tr>
				<th>email</th>
				<td>
					<input type="text" placeholder="이메일"  id="email">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="ID찾기" onclick="forgotId()">
					<span id="forgotIdSpan"></span>
				</td>
			</tr>
		</table>
	</fieldset>

	

	<fieldset>
		<legend>비밀번호 찾기</legend>
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" placeholder="ID"  id="id">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" placeholder="이름"  id="name2">
				</td>
			</tr>
			<tr>
				<th>email</th>
				<td>
					<input type="text" placeholder="이메일"  id="email2">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="PW찾기" onclick="forgotPw()">
					<span id="forgotPwSpan"></span>
				</td>
			</tr>
		</table>
	</fieldset>

</body>
</html>