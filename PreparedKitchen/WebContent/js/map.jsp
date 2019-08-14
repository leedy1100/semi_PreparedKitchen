<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

$(function(){
	var addr = "${memberDto.addr}";
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.3884, 126.936),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">배송지</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 

});

function changeAddr() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
	    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
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
    	        geocoder.addressSearch(data.address, function(result, status) {
    	            // 정상적으로 검색이 완료됐으면
    	            if (status === daum.maps.services.Status.OK) {

    	            	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    	    	        // 결과값으로 받은 위치를 마커로 표시합니다
    	    	        var marker = new kakao.maps.Marker({
    	    	            map: map,
    	    	            position: coords
    	    	        });

    	    	        // 인포윈도우로 장소에 대한 설명을 표시합니다
    	    	        var infowindow = new kakao.maps.InfoWindow({
    	    	            content: '<div style="width:150px;text-align:center;padding:6px 0;">배송지</div>'
    	    	        });
    	    	        infowindow.open(map, marker);

    	    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	    	        map.setCenter(coords);
    	    	        $("input[name=addr2]").focus();
    	            }
    	        });
    	    }
    	}).open();
    });
}
</script>