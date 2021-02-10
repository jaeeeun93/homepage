<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!-- Wrapper -->
<div id="wrapper">
	<!-- Main -->
	<div id="main">
		<div class="inner">
			<!-- Banner -->
			<section>
				<header class="major">
					<h1>채식식당 리스트</h1>
					<h2>카페</h2>
				</header>
				<div id="map" style="width: 900px; height: 700px;"></div>

				<script
					src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4f3b0f4100978c526f6ffe9ca3cff6a3&libraries=clusterer"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
						level : 3, // 지도의 확대 레벨
						mapTypeId : kakao.maps.MapTypeId.ROADMAP
					// 지도종류
					};

					// 지도를 생성한다 
					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new kakao.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					
					// 마커 클러스터러를 생성합니다 
					var clusterer = new kakao.maps.MarkerClusterer({
						map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
						averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
						minLevel : 10
					// 클러스터 할 최소 지도 레벨 
					});

					// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
					if (navigator.geolocation) {

						// GeoLocation을 이용해서 접속 위치를 얻어옵니다
						navigator.geolocation.getCurrentPosition(function(
								position) {

							var lat = position.coords.latitude, // 위도
							lon = position.coords.longitude; // 경도

							var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
							message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다

							// 마커와 인포윈도우를 표시합니다
							displayMarker(locPosition, message);

						});

						// 지도에 마커와 인포윈도우를 표시하는 함수입니다
						function displayMarker(locPosition, message) {

							// 마커를 생성합니다
							var marker_present = new kakao.maps.Marker({
								map : map,
								position : locPosition
							});

							var iwContent = message, // 인포윈도우에 표시할 내용
							iwRemoveable = true;

							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
								content : iwContent,
								removable : iwRemoveable
							});

							// 인포윈도우를 마커위에 표시합니다 
							infowindow.open(map, marker_present);

							// 지도 중심좌표를 접속위치로 변경합니다
							map.setCenter(locPosition);
						}

					}
					var markers = [];
					var 데이터 = [
							[37.6363471,126.9305574,'<div style="padding:5px"><a href="#">원슈가데이</a></div>' ],
							[37.4962012,126.9949086,'<div style="padding:5px"><a href="#">푸드더즈매터</a></div>' ],
							[37.5730842,126.9688665,'<div style="padding:5px"><a href="#">뒤주르</a></div>' ],
							[37.5730635,126.9010156,'<div style="padding:5px"><a href="#">마이디주스</a></div>' ],
							[37.5120275,127.0536152,'<div style="padding:5px"><a href="#">샐러디언</a></div>' ],
							[37.5190769,127.0225191,'<div style="padding:5px"><a href="#">칙피스 가로수길점</a></div>' ],
							[37.3972599,126.8605509,'<div style="padding:5px"><a href="#">트루라이트</a></div>' ],
							[37.4962012,126.9949086,'<div style="padding:5px"><a href="#">푸드더즈매터</a></div>' ],
							[37.5637727,126.9293558,'<div style="padding:5px"><a href="#">마주이야기</a></div>' ],
							[37.5289736,126.8922191,'<div style="padding:5px"><a href="#">우부래도 상도본점</a></div>' ],
							[37.5539617,126.9038186,'<div style="padding:5px"><a href="#">미로테이블</a></div>' ],
							[37.5549574,126.9001753,'<div style="padding:5px"><a href="#">어라운드그린</a></div>' ],
							[37.5513383,126.9055554,'<div style="padding:5px"><a href="#">더로바이트윈스</a></div>' ],
							[37.5565158,126.9165375,'<div style="padding:5px"><a href="#">카페sun</a></div>' ],
							[37.4919329,127.0266785,'<div style="padding:5px"><a href="#">어니스트그린</a></div>' ],
							[37.5478789,127.0419166,'<div style="padding:5px"><a href="#">더피커</a></div>' ],
							[37.5865036,127.0082228,'<div style="padding:5px"><a href="#">패밀리앤프렌즈</a></div>' ],
							[37.5399727,126.9904945,'<div style="padding:5px"><a href="#">바리(bari) 경리단길점</a></div>' ],
							[37.5796649,126.9663803,'<div style="padding:5px"><a href="#">소이로움</a></div>' ],
							[37.5770401,126.9656142,'<div style="padding:5px"><a href="#">사직동 그 가게</a></div>' ],
							[37.5795869,126.9693505,'<div style="padding:5px"><a href="#">Petit TONG 쁘띠통</a></div>' ],
							[37.5927505,126.995955,'<div style="padding:5px"><a href="#">맞이한</a></div>' ],
							[37.5798411,126.9844044,'<div style="padding:5px"><a href="#">뿌리온더플레이트</a></div>' ],
							[37.5331073,126.9920306,'<div style="padding:5px"><a href="#">PLANT</a></div>' ],
							[37.5429191,126.9706203,'<div style="padding:5px"><a href="#">카페 시바</a></div>' ],
							[37.5639444,127.006297,'<div style="padding:5px"><a href="#">oons</a></div>' ]
							]
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
						return function() {
							infowindow.open(map, marker);
						};
					}
					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
						return function() {
							infowindow.close();
						};
					}

					for (var i = 0; i < 데이터.length; i++) {
						// 마커가 표시될 위치입니다 
						var markerPosition = new kakao.maps.LatLng(데이터[i][0],
								데이터[i][1]);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						var iwContent = 데이터[i][2];
						iwPosition = markerPosition //인포윈도우 표시 위치입니다

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
							position : iwPosition,
							content : iwContent
						});

						markers.push(marker);

						kakao.maps.event.addListener(marker, 'mouseover',
								makeOverListener(map, marker, infowindow));
						kakao.maps.event.addListener(marker, 'mouseout',
								makeOutListener(infowindow));

					}
					// 클러스터러에 마커들을 추가합니다
					clusterer.addMarkers(markers);
				</script>
			</section>
		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">

			<!-- Search -->
			<section id="search" class="alt">
				<form method="get" action="/sboard/list">
					<input type="hidden" name="perPageNum" value="10">
					<div>
						<select name="searchType" style="width: 150px; height: 47.66px;">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>글쓴이</option>
							<option value="tc"
								<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>
								selected>제목+내용</option>
							<option value="cw"
								<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용+글쓴이</option>
							<option value="tcw"
								<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목+내용+글쓴이</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value='${cri.keyword }' placeholder="Search & Enter" />
					</div>
				</form>
			</section>



			<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>Menu</h2>
				</header>
				<ul>
					<li><a href="/">Main</a></li>
					<li><span class="opener">채식가이드</span>
						<ul>
							<li><a href="/guide/start">채식 입문 가이드</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
					<li><span class="opener">뉴스</span>
						<ul>
							<li><a href="/news/home">뉴스 홈</a></li>
							<li><a href="#">산업</a></li>
							<li><a href="#">사회</a></li>
							<li><a href="#">일반</a></li>
						</ul></li>
					<li><span class="opener">채식식당 리스트</span>
						<ul>
							<li><a href="#">채식전문음식점</a></li>
							<li><a href="#">채식지원음식점</a></li>
							<li><a href="#">채식카페</a></li>
							<li><a href="#">채식베이커리</a></li>
						</ul></li>
					<li><span class="opener">레시피</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
					<li><span class="opener">쇼핑</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
					<li><span class="opener">제품 리뷰</span>
						<ul>
							<li><a href="/productReview/youtube">영상 리뷰</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
				</ul>
			</nav>

			<!-- Community -->
			<nav id="menu">
				<header class="major">
					<h2>Community</h2>
				</header>
				<ul>
					<li><a href="/">Gallery</a></li>
					<li><a href="/sboard/list">채식 게시판</a></li>
					<li><span class="opener">보도자료</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
					<li><span class="opener">레시피</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
					<li><span class="opener">쇼핑</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
					<li><span class="opener">제품 리뷰</span>
						<ul>
							<li><a href="/productReview/youtube">영상 리뷰</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul></li>
				</ul>
			</nav>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Get in touch</h2>
				</header>
				<p>Sed varius enim lorem ullamcorper dolore aliquam aenean
					ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin
					sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat
					tempus aliquam.</p>
				<ul class="contact">
					<li class="icon solid fa-envelope"><a href="#">jaeeeun93@gmail.com</a></li>
					<li class="icon solid fa-phone">010-8230-9980</li>
					<li class="icon solid fa-home">이영산업기계 기술교육원</li>
				</ul>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<p class="copyright">
					&copy; Untitled. All rights reserved. Demo Images: <a
						href="https://unsplash.com">Unsplash</a>. Design: <a
						href="https://html5up.net">HTML5 UP</a>.
				</p>
			</footer>

		</div>
	</div>

</div>

<!-- Scripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/browser.min.js"></script>
<script src="/js/breakpoints.min.js"></script>
<script src="/js/util.js"></script>
<script src="/js/main.js"></script>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>