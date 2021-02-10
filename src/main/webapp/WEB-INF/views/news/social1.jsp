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
						<!-- Banner -->
							<section id="banner">
								<div class="content">
									<header>
										<h1>[뉴스 큐레이터]<br />
										“이병 ○○○, 채식주의자입니다!”</h1>
									</header>
									<article>
										<img src="/images/news/social1.jpg" width="970" height="552" alt="" />
									</article>
									<p>
										‘채식주의자가 군대 가면 맨밥에 김만 먹어야 한다’는 말, 이제 옛말이 된다. 2021년부터 훈련소에 입소하는 신병들은 자신이 먹지 않는 음식을 자율적으로 표시해 제출한다. 이를 토대로 각 부대는 식단 구성에 장병들의 다양한 필요를 반영하게 된다.<br><br>
										앞서 국방부는 2020년 급식 방침에 채식주의자와 종교, 건강 등의 이유로 특정 음식을 못 먹는 ‘급식배려병사’ 지원 필요성을 처음 명문화했다. 이에 따라 일부 부대에선 2020년부터 우유 대신 두유, 고기 대신 연두부, 젓갈을 뺀 백김치, 버터와 우유를 넣지 않은 식빵 등 대체재를 매끼 제공했다(사진).
										하지만 병사가 먼저 요청해야 하는 한계가 있었다.<br><br>
										국방부 관계자는 “2020년 급식 방침에 근거가 마련됨에 따라 필요한 경우 채식주의 병사용 자율배식을 따로 운영하기 시작했지만, 전수조사를 강제할 근거는 없었다. 2021년부터 전수조사가 가능해지면서 이제 모든 부대에서 대체 식단을 일상적으로 제공할 수 있을 전망이다”라고 말했다.<br><br>
										윤지현 서울대 식품영양학과 교수는 2020년 12월 말 국방부가 연 ‘채식주의자와 무슬림 등 급식배려병사의 급식지원을 위한 전문가 포럼’에서 ‘급식배려병사’라는 용어를 ‘특별식단필요병사’로 바꿀 것을 제안했다. 단어 몇 개 바꿨을 뿐인데 일부를 위한 특혜나 배려가 아닌, 모두를 위한 권리 보장이란 의미를 더 강조했다.<br><br>
										국방부가 내디딘 변화의 발걸음은 한 달에 한두 번 ‘고기 없는 날’을 이벤트처럼 만드는 게 아니라, 채식 등 다양한 식단을 선택할 권리를 삼시세끼 보장하는 첫 사례라는 점에서 높이 평가할 만하다. 울산과 전북, 인천 등 일부 지역 교육청이 학교 급식에서 채식 식단을 점차 넓혀나가고 있지만, 국방부만큼 급진적이고 선제적이진 않다.
									</p>
								</div>
							</section>
						
						<div id="disqus_thread"></div>
								<script>
								    /**
								    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
								    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
								    /*
								    var disqus_config = function () {
								    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
								    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
								    };
								    */
								    (function() { // DON'T EDIT BELOW THIS LINE
								    var d = document, s = d.createElement('script');
								    s.src = 'https://vegevillain.disqus.com/embed.js';
								    s.setAttribute('data-timestamp', +new Date());
								    (d.head || d.body).appendChild(s);
								    })();
								</script>
								<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
						
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