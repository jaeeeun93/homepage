<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>

function change(ppn){

	location.href="list?page=1&perPageNum="+ppn+"&searchType=${cri.searchType}&keyword=${cri.keyword}";

}

</script>

	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
				<div id="main">
					<div class="inner">
						<!-- Section -->
							<section>
								<header class="major">
									<h1>뉴스 홈</h1>
									<h2>BEST NEWS</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="/images/pic01.jpg" alt="" /></a>
										<h3>Kim Jaeun</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/pic02.jpg" alt="" /></a>
										<h3>Lee DongGun</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/pic03.jpg" alt="" /></a>
										<h3>Tempus ullamcorper</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
								</div>
							</section>
							
							
						<!-- Section -->
							<section>
								<header class="major">
									<h2>산업</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="/images/news1.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>롯데마트 잠실점에 새롭게 오픈된 비건 식당 <br> '제로비건'의 모습 (사진= 롯데마트 제공)</p>
										<h3>"150만 채식인구 잡아라"…이마트·롯데마트, 비건시장 '정조준'</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/news2.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>
											국방부, 개인의 신념 존중위해 '비건식' 도입<br>
											추가 예산 확보 등 현실적 문제 있어<br>
										</p>
										<h3>군대에서도 비건식 제공한다는데… “전쟁나도 채식 별도 제공?”</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/news3.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>국내 채식주의자 수 150만명으로 늘어나…편의점·마트업계 관련 상품 속속 출시</p>
										<h3>"채식주의자 잡아라"…유통가 채식 열풍</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									
								</div>
							</section>
							
						<!-- Section -->
							<section>
								<header class="major">
									<h2>사회</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="/images/news/social1.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>기사의 이해를 돕기 위한 자료 사진</p>
										<h3>[뉴스 큐레이터] “이병 ○○○, 채식주의자입니다!”</h3>
										<ul class="actions">
											<li><a href="/news/social1" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/news/social2.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>기사의 이해를 돕기 위한 자료 사진</p>
										<h3>'채식 식단' 따로 만들어야 해 잠도 못 자고 노예처럼 일하는 취사병들</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/news/social3.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>경기 고양 지역의 자가격리자 보급품</p>
										<h3>채식하는 자가격리자는 맨밥만 먹어야 하나요</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									
								</div>
							</section>
							
						<!-- Section -->
							<section>
								<header class="major">
									<h2>일반</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="/images/news1.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>롯데마트 잠실점에 새롭게 오픈된 비건 식당 <br> '제로비건'의 모습 (사진= 롯데마트 제공)</p>
										<h3>"150만 채식인구 잡아라"…이마트·롯데마트, 비건시장 '정조준'</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/news2.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>
											국방부, 개인의 신념 존중위해 '비건식' 도입<br>
											추가 예산 확보 등 현실적 문제 있어<br>
										</p>
										<h3>군대에서도 비건식 제공한다는데… “전쟁나도 채식 별도 제공?”</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="/images/news3.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>국내 채식주의자 수 150만명으로 늘어나…편의점·마트업계 관련 상품 속속 출시</p>
										<h3>"채식주의자 잡아라"…유통가 채식 열풍</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									
								</div>
							</section>	
							
							
						<!-- Banner -->
							<section id="banner">
								<div class="content">
									<header>
										<h1>'채식빌런'<br />
										채식이 어때서?</h1>
										<p>채식은 선택입니다. 개인의 선택은 존중받아야 합니다.</p>
									</header>
									<p>'채식빌런'은 채식주의자들을 위한 웹 서비스입니다.<br>
									채식에 관련된 정보, 상품, 레시피 등 다양한 정보를 제공합니다.<br>
									지금 바로 시작해보세요!</p>
									<ul class="actions">
										<li><a href="#" class="button big">Learn More</a></li>
									</ul>
								</div>
								<span class="image object">
									<img src="/images/main.jpg" alt="" />
								</span>
							</section>

						<!-- Section -->
							<section>
								<header class="major">
									<h2>채식빌런이란?</h2>
								</header>
								<div class="features">
									<article>
										<span class="icon solid fa-paper-plane"></span>
										<div class="content">
											<h3>Logo</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										</div>
									</article>
									<article>
										<span class="icon solid fa-paper-plane"></span>
										<div class="content">
											<h3>Sapien veroeros</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										</div>
									</article>
									<article>
										<span class="icon solid fa-rocket"></span>
										<div class="content">
											<h3>Quam lorem ipsum</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										</div>
									</article>
									<article>
										<span class="icon solid fa-signal"></span>
										<div class="content">
											<h3>Sed magna finibus</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										</div>
									</article>
								</div>
							</section>

					</div>
				</div>

			<!-- Sidebar -->
				<div id="sidebar">
					<div class="inner">

						<!-- Search -->
							<section id="search" class="alt">
								<form method="post" action="#">
									<input type="text" name="query" id="query" placeholder="Search" />
								</form>
							</section>

						<!-- Menu -->
							<nav id="menu">
								<header class="major">
									<h2>Menu</h2>
								</header>
								<ul>
									<li><a href="/">Homepage</a></li>
									<li>
										<span class="opener">채식가이드</span>
										<ul>
											<li><a href="/guide/start">채식 입문 가이드</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">뉴스</span>
										<ul>
											<li><a href="#">뉴스 홈</a></li>
											<li><a href="#">생활</a></li>
											<li><a href="#">산업</a></li>
											<li><a href="#">칼럼</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">레시피</span>
										<ul>
											<li><a href="#">Lorem Dolor</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">쇼핑</span>
										<ul>
											<li><a href="#">Lorem Dolor</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">제품 리뷰</span>
										<ul>
											<li><a href="/productReview/youtube">영상 리뷰</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
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
									<li>
										<span class="opener">보도자료</span>
										<ul>
											<li><a href="#">Lorem Dolor</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">레시피</span>
										<ul>
											<li><a href="#">Lorem Dolor</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">쇼핑</span>
										<ul>
											<li><a href="#">Lorem Dolor</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
									<li>
										<span class="opener">제품 리뷰</span>
										<ul>
											<li><a href="/productReview/youtube">영상 리뷰</a></li>
											<li><a href="#">Ipsum Adipiscing</a></li>
											<li><a href="#">Tempus Magna</a></li>
											<li><a href="#">Feugiat Veroeros</a></li>
										</ul>
									</li>
								</ul>
							</nav>

						<!-- Section -->
							<section>
								<header class="major">
									<h2>Get in touch</h2>
								</header>
								<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
								<ul class="contact">
									<li class="icon solid fa-envelope"><a href="#">jaeeeun93@gmail.com</a></li>
									<li class="icon solid fa-phone">010-8230-9980</li>
									<li class="icon solid fa-home">이영산업기계 기술교육원</li>
								</ul>
							</section>

						<!-- Footer -->
							<footer id="footer">
								<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
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