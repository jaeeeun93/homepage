<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE HTML>
	<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
				<div id="main">
					<div class="inner">

						<!-- Header -->
							<header id="header">
								<a href="index.html" class="logo"><strong>채식빌런</strong> '채식이 어때서?'</a>
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
								<header class="main">
									<h1>영상 리뷰</h1>
								</header>

								<span class="image main"></span>
								
								
								
								<hr class="major" />

								<h2>이건 고기가 아닙니다</h2>
								<iframe width="560" height="315" src="https://www.youtube.com/embed/5A2Ui98zk3U" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								
								<ul class="actions">
									<li><a href="#" class="button">사러가기</a></li>
								</ul>

								<hr class="major" />

								<h2>고기를 뛰어 넘는 고기? 식물성 고기, 비욘드 소세지</h2>
								<iframe width="560" height="315" src="https://www.youtube.com/embed/GcP3-6sMrv8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								<ul class="actions">
									<li><a href="#" class="button">사러가기</a></li>
								</ul>
								
								<hr class="major" />

								<h2>비건 버거, 맛도 어썸할까?│롯데리아 스위트 어스 어썸 버거</h2>
								<iframe width="560" height="315" src="https://www.youtube.com/embed/Y6P42l6BfM8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								<ul class="actions">
									<li><a href="#" class="button">사러가기</a></li>
								</ul>
								
								<hr class="major" />

								<h2>여기 비건 추가요│오뚜기 그린가든 시리즈</h2>
								<iframe width="560" height="315" src="https://www.youtube.com/embed/CxI10lMlUv0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								<ul class="actions">
									<li><a href="#" class="button">사러가기</a></li>
								</ul>
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
										<li><a href="#">영상 리뷰</a></li>
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

<%@ include file="/WEB-INF/views/include/footer.jsp"%>