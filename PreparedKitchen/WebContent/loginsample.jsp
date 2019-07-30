<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>

	<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
		src="image/kakao_login_btn_small.png" />
	</a>

	<a id="custom-login-btn2" href="javascript:logoutWithKakao()"> <img
		src="image/kakao_login_btn_small.png" />
	</a>
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('9224c175adc04d7602e956fcdd3fd17f');
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
				success : function(authObj) {
					alert(JSON.stringify(authObj));
					Kakao.API.request({
						url : '/v1/user/me',
						success : function(res) {
							alert(res.properties.nickname);
						}

					})
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		};

		function logoutWithKakao() {
			Kakao.Auth.logout(function() {
				setTimeout(function() {
					location.href = "#";
				}, 1000);
			});
		};

		//]]>
	</script>
</body>
</html>