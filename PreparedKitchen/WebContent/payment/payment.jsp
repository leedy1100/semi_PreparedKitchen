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
		var selecProduct = $("#materialProduct .selected");
		var proForm = $("#productForm");
		var command = $("input[name=command]");
		var selecList = "";
		
		for(var i = 0; i < selecProduct.length; i++){
			
			if(i != selecProduct.length-1){
				selecList += selecProduct.eq(i).attr("title") + ",";
			} else {
				selecList += selecProduct.eq(i).attr("title");
			}
		}
		
		if(selecList.length != 0){
			command.val("confirmpay");
			proForm.html(proForm.html()+"<input type='hidden' name='proList' value='" + selecList + "'>");
			proForm.submit();
			
		} else {
			alert("상품을 선택해 주세요");
		}
	}
</script>
<body>
	<div id="pay_form">
		<div class="pay_block">
			<input type="button" value="장바구니" onclick="cartDo()">
		</div>
		<div class="pay_block">
			<input type="button" value="관심 레시피" onclick="interestDo()">
		</div>
		<div class="pay_block">
			<input type="button" value="결제하기" onclick="payDo()">
		</div>
	</div>
</body>
</html>