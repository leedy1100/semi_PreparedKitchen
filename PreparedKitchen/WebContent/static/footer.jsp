<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.logo{
	height: 100px;
}
#foot{
	text-align: center;
}
#footmenu li{
	list-style: none;
	display: inline-block;
	border-left: 1px solid white;
	padding: 7px;
	line-height: 10%;
}
#footmenu li:first-child{
	border: none;
}
.footbox{
	display: inline-block;
	margin-top: 50px;
}
</style>
<title>footer</title>
</head>
<body>
	
	<div id="foot">
		<div class="footbox">
			<img id="logo" src="/PreparedKitchen/image/logo.png"/>
		</div>
		<div class="footbox">
			<ul id="footmenu">
				<li>회사소개</li>
				<li>오시는길</li>
				<li>고객센터</li>
				<li>개인정보보호정책</li>
				<li>이용약관</li>
			</ul>
		Copyright &copy; 2019 PreparedKitchen
		</div>
	</div>
</body>
</html>