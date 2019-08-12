<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
</head>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="/PreparedKitchen/js/payment.js"></script>
<body>

	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file= "../static/header.jsp" %>
	</header>
	
	<section>
	
		<h1>결제하기</h1>	
		
		<form action="/PreparedKitchen/payment" method="post" id="pay_form" target="pay_target" name="f1">
			<input type="hidden" name="command" value="pay">
			<input type="hidden" name="partner_order_id" value="0000001">
			<input type="hidden" name="partner_user_id" value="${memberDto.id }">
			<input type="hidden" name="item_name" value="레시피 이름 [ 돼지고기, 마늘, 양파 ] ...">
			<input type="hidden" name="item_code" value="2,3,4">
			<input type="hidden" name="quantity" value="1">
			<input type="hidden" name="total_amount" value="10000">
			<input type="hidden" name="tax_free_amount" value="1000">
			<table>
				<caption>
					<b>받는분 정보</b>
				</caption>
				<tr>
					<th>배송지 정보</th>
					<td><input type="text" readonly="readonly" value="${memberDto.addr }"><a href="javascript:changeAddr()">배송지 변경</a></td>
				</tr>
			</table>
		</form>
	</section>
	
	<%@ include file="../static/remocon.jsp" %>
		
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/footer.jsp" %>
	</footer>

</body>
</html>