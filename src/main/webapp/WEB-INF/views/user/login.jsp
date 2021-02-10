<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
				<div id="main">
					<div class="inner">
						<!-- Header -->
							<header id="header">
								<a href="/" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
								</ul>
							</header>

						<!-- Content -->
							<section>
								<h1>로그인</h1>
								<form action="/user/loginPost" method="post">
								<table width=100% border=1>
									<tr>
										<td>아이디</td>
										<td><input name="userid"></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input name="userpw"></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="submit" value="로그인"></td>
								</table>
								</form>
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
										<li><a href="/generic">Generic</a></li>
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
										<li><a href="#">Lorem Dolor</a></li>
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
								<h2>Ante interdum</h2>
							</header>
							<div class="mini-posts">
								<article>
									<a href="#" class="image"><img src="/images/pic07.jpg" alt="" /></a>
									<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
								</article>
								<article>
									<a href="#" class="image"><img src="/images/pic08.jpg" alt="" /></a>
									<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
								</article>
								<article>
									<a href="#" class="image"><img src="/images/pic09.jpg" alt="" /></a>
									<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
								</article>
							</div>
							<ul class="actions">
								<li><a href="#" class="button">More</a></li>
							</ul>
						</section>

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