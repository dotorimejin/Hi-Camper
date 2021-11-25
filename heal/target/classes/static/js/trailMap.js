/**
 * 카카오맵 API + 등산로
 */
 	
window.onload = function() {
	kakaoMap('#kakaomap');
};
 	
 	/* 지도 표시 */
 	function kakaoMap(){
	 	var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div
			mapOption = { 
				center: new kakao.maps.LatLng(36.0429614310705, 127.95085177754578), // 지도 중심좌표
				level: 13 // 지도 확대 레벨 / 작을 수록 범위 좁음
			};  
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
	
		
		// 선을 구성하는 좌표 배열
		var linePath = [
			
			/* 여기에 json 파일 파싱해서 x,y 값 넣기 */
			
			new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
			new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
			new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
		];
	
		/* 지도에 표시할 선 */
		var polyline = new kakao.maps.Polyline({
			path: linePath, // 선을 구성하는 좌표배열
			strokeWeight: 3, // 선의 두께
			strokeColor: '#FFAE00', // 선의 색깔
			strokeOpacity: 0.9, // 선의 불투명도 0~1 사이의 값 / 0에 가까울수록 투명
			strokeStyle: 'solid' // 선의 스타일
		});
	
		// 지도에 선 표시
		polyline.setMap(map);
	
	}
	
	
