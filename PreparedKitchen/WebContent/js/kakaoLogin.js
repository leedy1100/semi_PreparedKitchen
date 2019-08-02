
Kakao.init('9224c175adc04d7602e956fcdd3fd17f');
function loginWithKakao() {
	Kakao.Auth.login({
		success : function(authObj) {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					var id = res.kaccount_email;
					var nickname = res.properties.nickname;
					location.href="login.do?command=kakaologin&id="+id+"&nickname="+nickname;
				}
			})
		},
		fail : function(err) {
			alert("로그인 실패");
		}
	});
};

function forgot(){
	open("forgotid.jsp","","width=500,height=600,left=600,top=200")
}












