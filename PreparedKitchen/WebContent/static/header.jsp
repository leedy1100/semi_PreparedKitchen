<%@page import="com.pk.dto.MemberDto"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/PreparedKitchen/css/header.css"/>
</head>
<%
	MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
%>

<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="/PreparedKitchen/js/header.js"></script>

<body>
	<div id="mainleft">
		<a id="maintitle" href="/PreparedKitchen/index.jsp">Prepared Kitchen</a>
	</div>
	<div id="mainright">
		<img id="search">
<%
	if(memberDto == null){
%>
		<a id="headerlogin" href="/PreparedKitchen/login.do?command=gologin">login</a>
<%
	} else {
%>
		<%= memberDto.getName() %>님 환영합니다.
		<a id="headerlogin" href="/PreparedKitchen/login.do?command=logout">logout</a>
<%
	}
%>
	</div>
	<div id="mainmenu">
		<ul class="mainmenu_big">
			<li>회사 소개
				<ul class="mainmenu_small">
					<li><a href="/PreparedKitchen/recipeboard.do?command=list">recipeboardlist</a></li>
					<li><a href="/PreparedKitchen/map.do?command=map">지도 테스트</a></li>
					<li><a href="/PreparedKitchen/cal.do?command=calendar2">달력</a></li>
					<li><a href="/PreparedKitchen/dummy.do?command=recipedb">더미데이터 만들기</a></li>
					<li><a href="/PreparedKitchen/prodetail.do?command=detail&recipeno=1">상품디테일</a></li>
					<li><a href="/PreparedKitchen/product.do?command=adminchart">차트</a></li>
					<li><a href="/PreparedKitchen/product.do?command=adminrecipeview">상품등록</a></li>
					<li><a href="/PreparedKitchen/product.do?command=productlist">상품리스트</a></li>
				</ul>
			</li>
		</ul>
		<ul class="mainmenu_big">
			<li>상품
				<ul class="mainmenu_small">
					<li><a href="">세부 메뉴</a></li>
					<li><a href="">세부 메뉴</a></li>
					<li><a href="">세부 메뉴</a></li>
				</ul>
			</li>
		</ul>
		<ul class="mainmenu_big">
			<li>유저 레시피
				<ul class="mainmenu_small">
					<li><a href="">세부 메뉴</a></li>
					<li><a href="">세부 메뉴</a></li>
					<li><a href="">세부 메뉴</a></li>
				</ul>
			</li>
		</ul>
		<ul class="mainmenu_big">
			<li>고객 센터
				<ul class="mainmenu_small">
					<li><a href="">세부 메뉴</a></li>
					<li><a href="">세부 메뉴</a></li>
					<li><a href="">세부 메뉴</a></li>
				</ul>
			</li>
		</ul>
		<ul class="mainmenu_big">
			<%if(memberDto == null || memberDto.getRole().trim().equals("USER")){ %>
			<li>마이페이지
				<ul class="mainmenu_small">
					<li><a href="/PreparedKitchen/member.do?command=mypage">내 정보 보기</a></li>
					<li><a href="/PreparedKitchen/member.do?command=id">내가 쓴 글</a></li>
					<li><a href="/PreparedKitchen/member.do?command=cal">식단 관리</a></li>
					<li><a href="/PreparedKitchen/member.do?command=cart">장바구니</a></li>
					<li><a href="/PreparedKitchen/member.do?command=interest">관심 레시피</a></li>
					<li><a href="/PreparedKitchen/member.do?command=paymentinfo">결제 내역</a></li>
				</ul>
			</li>
			<%}else if(memberDto.getRole().trim().equals("ADMIN")){ %>
			<li>마이페이지
				<ul class="mainmenu_small">
					<li><a href="/PreparedKitchen/member.do?command=mypage">내 정보 보기</a></li>
					<li><a href="/PreparedKitchen/member.do?command=id">내가 쓴 글</a></li>
					<li><a href="/PreparedKitchen/member.do?command=cal">식단 관리</a></li>
					<li><a href="/PreparedKitchen/member.do?command=cart">장바구니</a></li>
					<li><a href="/PreparedKitchen/member.do?command=like">관심 레시피</a></li>
					<li><a href="/PreparedKitchen/member.do?command=paymentinfo">결제 내역</a></li>	
				</ul>
			</li>
			<li>관리자권한
				<ul class="mainmenu_small">
					<li><a href="/PreparedKitchen/member.do?command=usermanagement">회원 관리</a>
				</ul>
			</li>
			<%} %>
		</ul>
	</div>
</body>
</html>