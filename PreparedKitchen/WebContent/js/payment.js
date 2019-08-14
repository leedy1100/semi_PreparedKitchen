
function payDo() {
	var pay_frame = document.getElementById("pay_frame");
	var pay_black = document.getElementById("pay_black");
	
	window.open("/PreparedKitchen/payment/success.jsp", "pay_target", "");
//	window.open("", "pay_target", "");
//	f1.submit();
	
	pay_frame.style.display = "block";
	pay_black.style.display = "block";
}

function payBlack() {
	var pay_frame = document.getElementById("pay_frame");
	var pay_black = document.getElementById("pay_black");
	
	pay_frame.style.display = "none";
	pay_black.style.display = "none";
}

function changeAddr() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
	    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.537187, 127.005476),
		map: map
	});
	
    daum.postcode.load(function(){
    	new daum.Postcode({
    	    oncomplete: function(data) {
    	        var addr = data.address; // 최종 주소 변수
    	        var addr1 = $("input[name=addr1]").eq(0)

    	        // 주소 정보를 해당 필드에 넣는다.
    	        addr1.val(addr);
    	        addr1.after("<br><input name='addr2' type='text' placeholder='상세주소'>");
    	        // 주소로 상세 정보를 검색
    	        geocoder.addressSearch(data.address, function(results, status) {
    	            // 정상적으로 검색이 완료됐으면
    	            if (status === daum.maps.services.Status.OK) {

    	                var result = results[0]; //첫번째 결과의 값을 활용

    	                // 해당 주소에 대한 좌표를 받아서
    	                var coords = new daum.maps.LatLng(result.y, result.x);
    	                // 지도를 보여준다.
    	                mapContainer.style.display = "block";
    	                map.relayout();
    	                // 지도 중심을 변경한다.
    	                map.setCenter(coords);
    	                // 마커를 결과값으로 받은 위치로 옮긴다.
    	                marker.setPosition(coords)
    	            }
    	        });
    	    }
    	}).open();
    });
}
