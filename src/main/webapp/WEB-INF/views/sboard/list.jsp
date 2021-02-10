<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
var result="${msg}"
if(result == "delete-success"){
	alert("삭제 되었습니다.");
}else if(result == "modify-success"){
	alert("수정 되었습니다.");
}else if(result == "write-success"){
	alert("작성 완료 되었습니다.");
}
</script>

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
				
					<!-- Header -->
							<header id="header">
								<a href="/sboard/list" class="logo"><strong>채식 게시판</strong></a>
								<span><button onclick="location.href='/sboard/list'">전체글</button></span>
							<span><button onclick="location.href=''">추천글</button></span>
							<span><button onclick="location.href=''">공지</button></span>
							<ul class="actions">
							
							
							<li>
								<select name="perPageNum" onchange="change(this.value)" style="width:120px;height:38px;">
									<option value="1" <c:if test="${pageMaker.cri.perPageNum == 1}">selected</c:if>>1개</option>
									<option value="2" <c:if test="${pageMaker.cri.perPageNum == 2}">selected</c:if>>2개</option>
									<option value="4" <c:if test="${pageMaker.cri.perPageNum == 4}">selected</c:if>>4개</option>
									<option value="6" <c:if test="${pageMaker.cri.perPageNum == 6}">selected</c:if>>6개</option>
									<option value="8" <c:if test="${pageMaker.cri.perPageNum == 8}">selected</c:if>>8개</option>
									<option value="10" <c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10개</option>
								</select>
							</li>
						</ul>
							</header>
							
							
						<!-- Banner -->
						
						<%-- Total : ${pageMaker.totalCount } --%>
							
<form method="post">
<table width=100% border=1>
	<tr>
		<td align="center">bno</td>
		<td align="center">번호</td>
		<td align="center">말머리</td>
		<td align="center">제목</td>
		<td align="center">글쓴이</td>
		<td align="center">작성일</td>
		<td align="center">조회</td>
		<td align="center">추천</td>
	</tr>
	<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" /> 
	<c:forEach var="list" items="${list}">
	<tr>
		<td align="center">${list.bno }</td>
		<td align="center">${number }</td>
		<td align="center">${list.header}</td>
		<td align="center"><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${list.bno}">${list.title}</a></td>
		<td align="center">${list.writer}</td>
		<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.regdate}"></fmt:formatDate></td>
		<td align="center">${list.viewcnt}</td>
		<td align="center">${list.like_cnt}</td>
	</tr>
	<c:set var="number" value="${number - 1 }"/> 
	</c:forEach>
</table>
</form>


		<form method="get">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
				<table>
					<tr>
						<td>
							<select name="searchType" style="width:150px;height:50px;">
								<option value="n"<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
								<option value="t"<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
								<option value="c"<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
								<option value="w"<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>글쓴이</option>
								<option value="tc"<c:out value="${cri.searchType eq 'tc'?'selected':''}"/> selected>제목+내용</option>
								<option value="cw"<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용+글쓴이</option>
								<option value="tcw"<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목+내용+글쓴이</option>
							</select>
						</td>
						<td>
							<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="width:400px;height:50px;">
						</td>
						<td>
							<input type="submit" value="Search">
							<button type="button" onclick="location.href='/sboard/register'">글쓰기</button>
						</td>
					</tr>
				</table>
		</form>

<table border=1>
	<tr>
		<c:if test="${pageMaker.prev}">
			<td><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></td>
		</c:if>
		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td align="center">
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
					<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td><a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></td>		
		</c:if>
	</tr>
</table>						
						

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