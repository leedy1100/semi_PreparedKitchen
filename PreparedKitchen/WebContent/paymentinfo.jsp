<%@page import="java.util.List"%>
<%@page import="com.pk.dto.PaymentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/my_paymentinfo.css"/>
</head>
<%
	List<PaymentDto> pList = (List<PaymentDto>)request.getAttribute("pList");
%>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<%@ include file="mypage_menu.jsp" %>
		<h2>결제 내역</h2>
		<table id="paymentinfo">
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
		<jsp:include page="mypage_paging/paymentinfo.jsp" flush="true">
			<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
			<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			<jsp:param name="startPageNo" value="${paging.startPageNo}" />
			<jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
			<jsp:param name="endPageNo" value="${paging.endPageNo}" />
			<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
</html>