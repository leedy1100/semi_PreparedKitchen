<%@page import="com.pk.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	#pay_form{
		position:fixed; 
		left:0px; 
		bottom:0px; 
		height:70px; 
		width:100%; 
		background-color: rgb(241, 255, 76);
	}
	.pay_block{
		width: 30%;
		padding: 20px;
		margin-top: 5px;
		border-right: 1px solid black;
		float: left;
		text-align: center;
		color: black;
	}
	.pay_block:last-child {
		border-right: none;
	}
</style>
<script type="text/javascript">
	function payDo() {
		window.open("", "pay_target", "width=500, height=600, left=800, top=200");
		f1.submit();
	}
</script>
<%
	MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
	String id = "";
	if(mDto != null) {
		id = mDto.getId();
	}
%>
<body>

	<form action="/PreparedKitchen/payment" method="post" id="pay_form" target="pay_target" name="f1">
		<div class="pay_block">1111</div>
		<div class="pay_block">2222</div>
		<div class="pay_block">
			<input type="hidden" name="command" value="pay">
			<input type="hidden" name="partner_order_id" value="0000001">
			<input type="hidden" name="partner_user_id" value="user">
			<input type="hidden" name="item_name" value="레시피 이름 [ 돼지고기, 마늘, 양파 ] ...">
			<input type="hidden" name="item_code" value="000013,123123">
			<input type="hidden" name="quantity" value="1">
			<input type="hidden" name="total_amount" value="10000">
			<input type="hidden" name="tax_free_amount" value="1000">
			<input type="button" value="결제하기" onclick="payDo()">
		</div>
	</form>
	
</body>
</html>