<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="stylesheet" href="static/base.css"/>

</head>
<body>

	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<form action="login.do" method="post">
			<input type="hidden" name="command" value="noemail"/>
			<table>
				<tr>
					<th>ID</th>
					<td>
						<input type="text" name="id">
						<span id="idchkSapn"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="pwConfirm">
						<span id="pwSpan"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email">
						<select id="emailback" name="emailback">
							<option selected="selected" label="직접입력"></option>
							<option>@naver.com</option>
							<option>@gmail.com</option>
							<option>@hanmail.net</option>
						</select>
						<input type="button" value="인증받기" onclick="emailChk()">
						<span id="emailSpan"></span>
					</td>
				</tr>
				<tr>
					<th>인증번호</th>
					<td>
						<input type="text" name="emailConfirm">
						<input type="button" value="확인" onclick="emailCon()">
						<span id="emailConSpan"></span>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>
						<input type="text" name="phone1" maxlength="3"> -
						<input type="text" name="phone2" maxlength="4"> -
						<input type="text" name="phone3" maxlength="4">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인">
						<input type="button" value="취소" onclick="location.href='login.do?command=gologin'">
					</td>
				</tr>
			</table>
		</form>
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>

</body>
</html>