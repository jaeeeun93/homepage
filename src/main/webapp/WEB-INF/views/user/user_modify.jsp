<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
				<div id="main">
					<div class="inner">
							
						<!-- Section -->
							<section>
								<header class="major">
									<h1>회원정보</h1>
									<h2>${user.userid }</h2>
								</header>
								<div class="posts">
									<article>
										<a href="#" class="image"><img src="/images/news1.jpg" width="360.45" height="221.81" alt="" /></a>
									</article>
								</div>
							</section>

					</div>
					<form id='registerForm' role="form" method="post">

<table width=100% border=1>

	<tr>

		<td>제목</td>

		<td><input name="title"></td>

	</tr>

	<tr>

		<td>내용</td>

		<td><input name="content"></td>

	</tr>

	<tr>

		<td>작성자</td>

		<td><input name="writer"></td>

	</tr>

	<tr>

		<td>파일첨부</td>

		<td><label for="exampleInputEmail1">File DROP Here</label>

			<div class="fileDrop"></div><!-- 파일 드롭 앤 다운 영억 -->

			<div class="uploadedList"></div><!-- 파일 리스트 -->

		</td>

	</tr>

	<tr>

		<td></td>

		<td><input type="submit" value="글쓰기"></td>

	</tr>

</table>

</form>



<!-- 아래 추가 -->



<style>

.fileDrop {

	width: 100%;

	height: 200px;

	border: 1px dotted blue;

}



small {

	margin-left: 3px;

	font-weight: bold;

	color: gray;

}

</style>

<div class='fileDrop'></div>



<div class='uploadedList'></div>



<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>



<script>

$(".fileDrop").on("dragenter dragover", function(event) {

	event.preventDefault();

});



$(".fileDrop").on("drop", function(event){

	event.preventDefault();

	

	var files = event.originalEvent.dataTransfer.files;			

	var file = files[0];

	//console.log(file);

			

	var formData = new FormData();			

	formData.append("file", file);

			

	$.ajax({

		url: '/uploadAjax',

		data: formData,

		dataType:'text',

		processData: false,

		contentType: false,

		type: 'POST',

		success: function(data){				 

			//alert(data);

			//추가 페이지

			var str ="";

					  

				if(checkImageType(data)){

					str ="<div><a href=displayFile?fileName="+getImageLink(data)+">"

						  +"<img src='displayFile?fileName="+data+"'/>"

						  +"</a><small data-src="+data+">X</small></div>";

				}else{

					str = "<div><a href='displayFile?fileName="+data+"'>" 

						  + getOriginalName(data)+"</a>"

						  +"<small data-src="+data+">X</small></div></div>";

				}

					  

				$(".uploadedList").append(str);

		}

	});

});

		



$(".uploadedList").on("click", "small", function(event){

			

   var that = $(this);

		

   $.ajax({

	   url:"deleteFile",

	   type:"post",

	   data: {fileName:$(this).attr("data-src")},

	   dataType:"text",

	   success:function(result){

		   if(result == 'deleted'){

			   that.parent("div").remove();

		   }

	   }

   });

});

</script>





<script>

// 파일 첨부시 이름만 뽑아오는 코드

function getOriginalName(fileName){	



	if(checkImageType(fileName)){

		return;

	}			



	var idx = fileName.indexOf("_") + 1 ;



	return fileName.substr(idx);

}



function getImageLink(fileName){			



	if(!checkImageType(fileName)){

		return;

	}



	var front = fileName.substr(0,12);

	var end = fileName.substr(14);			



	return front + end;

}		



//전송 문자열이 이미지 파일인지 확인 여부

function checkImageType(fileName){

	var pattern = /jpg|gif|png|jpeg/i;



	return fileName.match(pattern);

}

</script>
					
					





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