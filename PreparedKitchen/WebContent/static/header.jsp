<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#mainleft{float: left; margin: 10px 0px 0px 20px;}
	#mainright{float: right; margin: 25px 30px 0px 0px;}
	#mainmenu{width: 60; height: 60; margin: 10px 10px 10px 10px;}
	#maintitle{color: rgb(241, 255, 76); font-size: 40px; text-decoration: none; font-weight: bold;}
	#search{}
	#headerlogin{color: white; font-size: 14px; text-decoration: none;}
</style>
<body>
	<div id="mainleft">
		<img id="mainmenu" src="#">
		<a id="maintitle" href="index.jsp">Prepared Kitchen</a>
	</div>
	<div id="mainright">
		<img id="search" src="#">
		<a id="headerlogin" href="login.do?command=login">login</a>
	</div>
</body>
</html>