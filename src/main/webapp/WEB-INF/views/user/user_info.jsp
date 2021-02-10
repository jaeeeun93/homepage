<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>

function change(ppn){

	location.href="user_info?id=${info.userid }&page=1&perPageNum="+ppn+"&searchType=${cri.searchType}&keyword=${cri.keyword}";

}

</script>


<style>
.photo2 {
    width: 200px; height: 200px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
}

li{
	margin-left: auto;
}

ul.actions{
	border : 3px solid #2db400;
	padding : 1em;
}

div.a{
	display : inline;
}

#modDiv2 {
	width: 300px;
	height: 100px;
	background-color: black;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

#modFollower {
	width: 300px;
	height: 100px;
	background-color: #f5f6f7;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

#modFollowing {
	width: 300px;
	height: 100px;
	background-color: black;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}
</style>

	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
				<div id="main">
					<div class="inner">
							
						<!-- Section -->
							<section>
								<header class="major">
									<ul class="actions">
									<c:choose>
									<c:when test="${sessionScope.id == info.userid}">
										<img class='photo2' src="/imgUpload${info.profile }" />
										<h2>
										<div>
											&nbsp;&nbsp;&nbsp;${info.userid }	<br>
											<div class="a"><a>게시글 ${post}</a></div>
											<div class="a" id="follower_num"><a id="click_follower">팔로워 ${info.follower_num }</a></div>
											<div class="a" id="following_num"><a id="click_following">팔로우 ${info.following_num }</a></div> 
										</div>	
										</h2>
									</c:when>
									
									<c:when test="${is_member == 0}">
										<img class='photo2' src="/images/simple.png" />
										<h2>
										<div>
											&nbsp;&nbsp;&nbsp;${click }	<br>
											<div class="a"><a>게시글 ${post}</a></div>
										</div>	
										</h2>
									</c:when>
									
									<c:otherwise>
										<img class='photo2' src="/images/simple.png" />
										<h2>
										<div>
											&nbsp;&nbsp;&nbsp;${info.userid }	<div class="a" style="border:1px solid black;"><a id="dm">메세지 보내기</a></div><br>
											<div class="a"><a>게시글 ${post}</a></div>
											<div class="a" id="follower_num"><a id="click_follower">팔로워 ${info.follower_num }</a></div>
											<div class="a" id="following_num"><a id="click_following">팔로우 ${info.following_num }</a></div> 
										</div>	
										</h2>
									</c:otherwise>
									</c:choose>	
										
									 	<c:set var="match" value="${info.userid }" />
										 <c:choose>
											<c:when test="${sessionScope.id == match}">
												<li class="b"><a href="/uploadAjax" class="button big">프로필 수정</a></li>
										  	</c:when>
										  	
										  	<c:when test="${sessionScope.id == null }">
										  		
										  	</c:when>
										  	
										  	<c:when test="${is_member == 0 }">
										  		
										  	</c:when>
										  	
										  	<c:when test="${check == 1}">
										  		<input type="hidden" id="unfollowid" value="${info.userid }">
										  		<li class="b"><button type="button" id="cancleBtn" class="button big">팔로잉</button></li>
										  	</c:when>
										  	
										  	<c:otherwise>
										  		<input type="hidden" id="followid" value="${info.userid }">
										  		<li class="b"><button type="button" id="follow" class="button big">+ 팔로우</button></li>
										  	</c:otherwise>
										  </c:choose>
									</ul>
								<form method="post">
								<table width=100% border=1>
										<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" />			
										<c:forEach var="item" items="${reply}" varStatus="status">
									<tr>
										<td>	
										     <a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${item.bno}">#${item.bno}</a> 게시물에 댓글을 남겼습니다. &nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value = "${item.regdate }" /><br> 
										    ${item.replytext}<br>
										</td>
									</tr>
										<c:set var="number" value="${number - 1 }" />
										</c:forEach>
								</table>
								</form>
								
								<form method="get">
									<%-- <input type="hidden" name="page" value="${cri.page}"> --%>
									<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
										<table>
											<tr>
												<td>
													<select name="searchType" style="width:150px;height:50px;">
														<option value="n"<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
														<option value="c"<c:out value="${cri.searchType eq 'c'?'selected':''}"/> selected>내용</option>
													</select>
												</td>
												<td>
													<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="width:400px;height:50px;">
													<input type="hidden" name='id' id="id" value='${info.userid}'>
												</td>
												<td>
													<input type="submit" value="Search">
												</td>
											</tr>
										</table>
								</form>
								
								<table border=1>
									<tr>
										<c:if test="${pageMaker.prev}">	<!-- boolean 기본값 false -->
											<td><a href="user_info${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></td>
										</c:if>
										<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
											<td align="center">
												<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
													<a href="user_info${pageMaker.makeSearch(idx)}&id=${info.userid }">${idx}</a>
												<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
											</td>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<td><a href="user_info${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></td>		
										</c:if>
									</tr>
								</table>			
								
								</header>
							</section>
							
							
						<!-- Banner -->
							<section>
								<header class="major">
								<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" />
								<c:forEach var="like" items="${like}" varStatus="status">
								    <a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${like.bno}">#${like.bno}</a> 게시물을 추천했습니다. &nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value = "${like.regdate }" /><br><br>
								</c:forEach>
	
									
								</header>
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

<!-- 팔로우 취소 버튼 -->
<table id='modDiv2' style="display:none;">
	<tr>
		<td align="center"><img class='photo2' src="/images/news1.jpg" /></td>
	</tr>
	<tr>
		<td align="center">
			<button type="button" id="">${info.userid}님의 팔로우를 취소하시겠어요?</button>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="button" id="unfollow">팔로우 취소</button>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="button" id="closeBtn">취소</button>
		</td>
	</tr>
</table>

<!-- 팔로워 목록 열기 -->
<table id='modFollower' style="display:none;">
	<tr>
		<td align="center" colspan=2><img class='photo2' src="/images/simple.png" /></td>
	</tr>
	<tr>
		<td align="center">
			팔로워
		</td>
	</tr>
	<c:forEach var="list" items="${follower_list}" varStatus="status">
	<tr>
		<td align="center">
			<a href="/user/user_info?id=${list.follower }">${list.follower }</a>
		</td>
		<td aling="right"><button type="button">+ 팔로우</button></td>
	</tr>
	</c:forEach>
	<tr>
		<td align="center" colspan=2>
			<button type="button" id="closeFollower">닫기</button>
		</td>
	</tr>
</table>

<!-- 팔로잉 목록 열기 -->
<table id='modFollowing' style="display:none;">
	<tr>
		<td align="center" colspan=2><img class='photo2' src="/images/simple.png" /></td>
	</tr>
	<tr>
		<td align="center">
			팔로잉
		</td>
	</tr>
	<c:forEach var="list2" items="${following_list}" varStatus="status">
	<tr>
		<td align="center">
			<a href="/user/user_info?id=${list2.following }">${list2.following }</a>
		</td>
		<td aling="right"><button type="button">+ 팔로우</button></td>
	</tr>
	</c:forEach>
	<tr>
		<td align="center" colspan=2>
			<button type="button" id="closeFollowing">닫기</button>
		</td>
	</tr>
</table>		


		<script>
		// 팔로우
		$("#follow").on("click", function() {
			var userid = $("#followid").val();
			var followernum = ${info.follower_num }+1;
			
			$.ajax({
				type : 'post',
				url : '/user/follow',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				
				data : JSON.stringify({
					following_num : userid
				}),
				
				success : function(result) {
					if (result == 'success') {
						alert("팔로우 했습니다.");
						$("#follower_num").text("팔로워 "+followernum+"");
						$("#follow").text("팔로잉");
					}else{
						
					}
				}
			});
		});
		
		//팔로잉 눌러서 열기
		$("#cancleBtn").on("click", function() {
			$("#modDiv2").show("slow");
		});
			
		// 언팔로우
		$("#unfollow").on("click", function() {
			var userid = $("#unfollowid").val();
			var followernum = ${info.follower_num }-1;
			
			$.ajax({
				type : 'post',
				url : '/user/unfollow',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				
				data : JSON.stringify({
					following_num : userid
				}),
				
				success : function(result) {
					if (result == 'success') {
						alert("언팔로우 했습니다.");
						$("#follower_num").text("팔로워 "+followernum+"");
						$("#follow").text("+ 팔로우");
						$("#modDiv2").hide("slow");
					}else{
						
					}
				}
			});
		});
		
		// mode닫기
		$("#closeBtn").on("click", function() {
			$("#modDiv2").hide("slow");
		});
		
		// 팔로워 창 닫기
		$("#closeFollower").on("click", function() {
			$("#modFollower").hide("slow");
		});
		
		// 팔로잉 창 닫기
		$("#closeFollowing").on("click", function() {
			$("#modFollowing").hide("slow");
		});
		
		//팔로워 클릭
		$("#click_follower").on("click", function(){
			
			$("#modFollower").show("slow");
		});
		
		//팔로잉 클릭
		$("#click_following").on("click", function(){
			
			$("#modFollowing").show("slow");
		});
		
		
		//메세지 보내기
		$("#dm").on("click", function(){
			location.href = '/user/dm?following=${info.userid }';
		});
		</script>

	<!-- Scripts -->
		<script src="/js/jquery.min.js"></script>
		<script src="/js/browser.min.js"></script>
		<script src="/js/breakpoints.min.js"></script>
		<script src="/js/util.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>