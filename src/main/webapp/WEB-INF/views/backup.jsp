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
									<h1>홈 화면</h1>
									<h2>BEST 게시글</h2>
								</header>
								<div class="posts">
									<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" />
									<c:forEach var="list" items="${list}">
									<article>
										<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${list.bno}" class="image"><img src="images/p.jpg" width="360.45" height="221.81" alt="" /></a>
										<h3 style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">ID : ${list.writer }</h3>
										<p style="width:360.44px; height:50px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">조회수 : ${list.viewcnt} / 추천 : ${list.like_cnt }</p>
										<p><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${list.bno}" class="button">More</a></p>
									</article>
									<c:set var="number" value="${number - 1 }"/>
									</c:forEach>								
								</div>
							</section>
							
							
						<!-- Section -->
							<section>
								<header class="major">
									<h2>뉴스</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="images/news1.jpg" width="360.45" height="221.81" alt="" /></a>
										<p>롯데마트 잠실점에 새롭게 오픈된 비건 식당 <br> '제로비건'의 모습 (사진= 롯데마트 제공)</p>
										<h3>"150만 채식인구 잡아라"…이마트·롯데마트, 비건시장 '정조준'</h3>
										<ul class="actions">
											<li><a href="#" class="button">More</a></li>
										</ul>
									</article>
									<article>
										<a href="#" class="image"><img src="images/news2.jpg" width="360.45" height="221.81" alt="" /></a>
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
										<a href="#" class="image"><img src="images/news3.jpg" width="360.45" height="221.81" alt="" /></a>
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
								<form method="get" action="/sboard/list">
								<input type="hidden" name="perPageNum" value="10">
								<div>
									<select name="searchType" style="width:150px;height:47.66px;">
										<option value="n"<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
										<option value="t"<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
										<option value="c"<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
										<option value="w"<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>글쓴이</option>
										<option value="tc"<c:out value="${cri.searchType eq 'tc'?'selected':''}"/> selected>제목+내용</option>
										<option value="cw"<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용+글쓴이</option>
										<option value="tcw"<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목+내용+글쓴이</option>
									</select>
									<input type="text" name="keyword" id="keywordInput" value='${cri.keyword }' placeholder="Search & Enter" />
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
											<li><a href="/news/home">뉴스 홈</a></li>
											<li><a href="#">산업</a></li>
											<li><a href="#">사회</a></li>
											<li><a href="#">일반</a></li>
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