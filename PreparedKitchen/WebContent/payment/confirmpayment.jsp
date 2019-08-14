<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
</head>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/payment.css"/>
<script type="text/javascript" src="/PreparedKitchen/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9224c175adc04d7602e956fcdd3fd17f&libraries=services"></script>
<script type="text/javascript" src="/PreparedKitchen/js/payment.js"></script>
<%@include file="../js/map.jsp" %>
<body>

	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file= "../static/header.jsp" %>
	</header>
	
	<section>
	
		<h1>결제하기</h1>	
		
		<form action="/PreparedKitchen/payment" method="post" id="pay_form" target="pay_target" name="f1">
			<h3>받는분 정보</h3>
			<hr>
			
			<div id="payMemberDiv">
				<div id="payMemberName">
					<span>주문자명</span>
					<span>${memberDto.name }</span>
				</div>
				<div id="payMemberAddr">			
					<span>배송지 정보</span>
					<c:choose>
						<c:when test="${memberDto.birth != 'KAKAO' }">
							<input name="addr1" type="text" readonly="readonly" value="${memberDto.addr }">
							<a href="javascript:changeAddr()">배송지 변경</a>
							<div id="map"></div>
						</c:when>
						<c:otherwise>
							<input name="addr1" type="text" readonly="readonly" placeholder="배송지를 입력해 주세요" onclick="changeAddr()">
							<div id="map"></div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr>
			
			<div id="payProductDiv">
				<c:forEach items="${recipeList }" var="recipeDto" varStatus="status">
					<c:choose>
						<c:when test="${status.first }">
							<c:set var="recipenos" value="${recipeDto.recipe_no }"/>
						</c:when>
						<c:otherwise>
							<c:set var="recipenos" value="${recipenos },${recipeDto.recipeno }"/>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:forEach items="${recipeList }" var="recipeDto">
					<input type="hidden" name="recipe_name" value="${recipeDto.recipe_name }">
					<input type="hidden" name="recipe_no" value="${recipeDto.recipe_no }">
				</c:forEach>
				<c:forEach items="${productList }" var="martDto" varStatus="status">
					<div class="proListDiv">
						<input type="hidden" name="mart_item_name" value="${martDto.item_name }">
						<input type="hidden" name="mart_price" value="${martDto.mart_price }">
						<span>${martDto.item_name }</span>
						<span>${martDto.mart_price }원</span>
					</div>
					<c:set var="totalPrice" value="${totalPrice + martDto.mart_price }"/>
					<c:choose>
						<c:when test="${status.first }">
							<c:set var="item_name" value="${martDto.item_name }"/>
						</c:when>
						<c:otherwise>
							<c:set var="item_name" value="${item_name },${martDto.item_name }"/>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${status.first }">
							<c:set var="item_code" value="${martDto.mart_no }"/>
						</c:when>
						<c:otherwise>
							<c:set var="item_code" value="${item_code },${martDto.mart_no }"/>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<hr>
			
			<div id="totalPriceDiv">
				총 : ${totalPrice }원
			</div>
			<input type="hidden" name="command" value="pay">
			<input type="hidden" name="partner_order_id" value="0000001">
			<input type="hidden" name="partner_user_id" value="${memberDto.id }">
			<input type="hidden" name="item_name" value="${item_name }">
			<input type="hidden" name="item_code" value="${item_code }">
			<input type="hidden" name="quantity" value="1">
			<input type="hidden" name="total_amount" value="${totalPrice }">
			<input type="hidden" name="tax_free_amount" value="0">
			<input type="hidden" name="recipenos" value="${recipenos }">
			<input type="hidden" name="recipe_name" value="${recipe_name }">
			<input type="hidden" name="recipe_no" value="${recipe_no }">
			<input id="pay_do" type="button" value="결제하기" onclick="payDo()">
		</form>
	</section>
	<iframe id="pay_frame" name="pay_target"></iframe>
	<%@ include file="../static/remocon.jsp" %>
		
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="../static/footer.jsp" %>
	</footer>
	<div id="pay_black" onclick="payBlack()"></div>
</body>
</html>