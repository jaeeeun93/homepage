<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
    *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:300px;overflow:hidden;}
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 16s infinite;}
    .slide li:nth-child(1){background:#ffa;animation-delay:0s}
    .slide li:nth-child(2){background:#faa;animation-delay:4s}
    .slide li:nth-child(3){background:#afa;animation-delay:8s}
    .slide li:nth-child(4){background:#aaf;animation-delay:12s}
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
    }
</style>

	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
				<div id="main">
					<div class="inner">
						<!-- 광고 -->
							<div class="slide">
						     <ul>
								<li><a href="http://www.inven.co.kr/webzine/news/?news=249607" onfocus="blur();"><span><img src="/images/new1.png" /></span></a></li>
						       	<li></li>
						       	<li></li>
						       	<li></li>
						     </ul>
						    </div>
						<!-- Header -->
							<header id="header">
								<a href="/" class="logo"><strong>채식빌런</strong> '채식이 어때서?'</a>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
								</ul>
							</header>

						<!-- Banner -->
							<section id="banner">
								<div class="content">
									<header>
										<h1>'메인 페이지'<br />
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

						<!-- Section -->
							<section>
								<header class="major">
									<h2>개발</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
										<h3>Kim Jaeun</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
										<h3>Lee DongGun</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article style='visibility : hidden'>
										<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
										<h3>Tempus ullamcorper</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article style='visibility : hidden'>
										<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
										<h3>Sed etiam facilis</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article style='visibility : hidden'>
										<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
										<h3>Feugiat lorem aenean</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article style='visibility : hidden'>
										<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
										<h3>Amet varius aliquam</h3>
										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
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

						<!-- Community -->
							<nav id="menu">
								<header class="major">
									<h2>Community</h2>
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