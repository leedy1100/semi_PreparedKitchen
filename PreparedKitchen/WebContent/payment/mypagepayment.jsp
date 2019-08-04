<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pk.dto.PaymentDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pk.biz.PaymentBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<%
	PaymentBiz pBiz = new PaymentBiz();
	List<PaymentDto> pList = pBiz.mySelectList("user");
%>
</head>
<body>
	<header><%@ include file="../static/header.jsp" %></header>
	
	<section>
		
		<h1>마이페이지</h1>
		<table>
			<tr>
				<td class="mypage_menu">회원정보</td>
				<td class="mypage_menu">결제내역</td>
				<td class="mypage_menu">장바구니</td>
				<td class="mypage_menu">관심목록</td>
				<td class="mypage_menu">식단관리</td>
				<td class="mypage_menu">내가쓴글</td>
			</tr>
		</table>
		<hr>
		<h2>결제 내역</h2>
		<table border="1">
			<tr>
				<th>결제 번호</th><th>내용</th><th>가격</th><th>결제날짜</th><th>취소/환불</th>
			</tr>
<%
			if(pList == null) {
%>
				<tr><td colspan="4">결제 내역이 없습니다.</td></tr>
<%
			}else {
				for(PaymentDto pDto : pList) {
%>
					<tr>
						<td><%=pDto.getPayment_group() %></td>
						<td><%=pDto.getItem_name() %></td>
						<td><%=pDto.getPayment_price() %></td>
						<td><%=pDto.getPayment_date()%></td>
						<td><input type="button" value="취소" onclick="location.href='canclepage.jsp?tid=<%=pDto.getPayment_group()%>'"></td>
					</tr>
<%
				}
			}
%>
		</table>
		
	</section>
	<%@ include file="/static/remocon.jsp" %>
	<footer><%@ include file="../static/footer.jsp" %></footer>
</body>
</html>