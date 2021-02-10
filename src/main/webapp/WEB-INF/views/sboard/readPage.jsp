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
							
<table border=1 style="border-bottom : solid 5px #19ce60;">

	<tr>

		<td width=70>제목</td>

		<td width=500>${read.title }</td>

	</tr>

	<tr>

		<td>작성자</td>

		<td>${read.writer }</td>

	</tr>
	
	<tr>

		<td>내용</td>

		<td>${read.content }</td>

	</tr>
</table>

<table>
	<tr>
			<input type="hidden" id="userid" value="${sessionScope.id }">
		<!-- <td><input type="hidden" id='likeno' value="1"><button id="likeBtn">추</button></td>
		<td><button type="button" id="hateBtn">비추</button></td> -->
		<td><button type="button" id="openBtn">추천열기</button></td>
		<td><div id="like_num">추천 : ${read.like_cnt } </div></td>
		<td><div id="hate_num">비추 : ${read.hate_cnt } </div></td>
	</tr>
</table>

<style>

#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

	.pagination {
	  width: 100%;
	}
	
	.pagination li{
	  list-style: none;
	  float: left; 
	  padding: 3px; 
	  border: 1px solid blue;
	  margin:3px;  
	}
	
	.pagination li a{
	  margin: 3px;
	  text-decoration: none;
	}

#modDiv2 {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

</style>

<!-- 글 작성 -->
<c:choose>
	<c:when test="${sessionScope.id != null }">
    	<table border=1 style="border-bottom : solid 5px #19ce60; border-top : solid 5px #19ce60 ">
			<tr>
				<td>닉네임</td>
				<td><input type='text' name='replyer' id='newReplyWriter' value="${sessionScope.id }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type='text' name='replytext' id='newReplyText'></td>
			</tr>
			<tr>
				<td></td>
				<td><button id="replyAddBtn">댓글 등록</button></td>
			</tr>
		</table>
  	</c:when>
  	<c:otherwise>
  		<table border=1 style="border-bottom : solid 5px #19ce60; border-top : solid 5px #19ce60 ">
			<tr>
				<td>닉네임</td>
				<td><input type='text' name='replyer' id='newReplyWriter'></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type='text' name='replytext' id='newReplyText'></td>
			</tr>
			<tr>
				<td></td>
				<td><button id="replyAddBtn">댓글 등록</button></td>
			</tr>
		</table>
  	</c:otherwise>
  </c:choose>



<table>
	<tr>
		<td>전체 댓글</td>
	</tr>
</table>

<!-- MOD 버튼 -->
<table id='modDiv' style="display:none;">
	<tr>
		<td class='modal-title'></td>
	</tr>
	<tr>
		<td><input type='text' id='replytext'></td>
	</tr>
	<tr>
		<td>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id='closeBtn'>닫기</button>
		</td>
	</tr>
</table>

<!-- 추천열기 버튼 -->
<table id='modDiv2' style="display:none;">
	<tr>
		<td>
			<button type="button" id="likeBtn">추천</button>
			<button type="button" id="hateBtn">비추</button>
			<button type="button" id='closeBtn2'>닫기</button>
		</td>
	</tr>
</table>




<!-- 댓글 목록 출력 영역 -->

<table id="replies" border=1></table>

<!-- 페이징 -->

<ul class="pagination"></ul>	

<script>

var bno = ${read.bno}; //존재하는 글번호
//getAllList();

<!-- 좋아요 -->

//추천 열기
$("#openBtn").on("click", function() {

	var likeno = $("#likeno").val();
	var userid = $("#userid").val();
	
	$.ajax({
		type : 'post',
		url : '/like',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',

		data : JSON.stringify({
			bno : bno,
			likeno : likeno,
			userid : userid
			
		}),
	});
	
	
	var reply=$(this).parent();
	var rno = reply.attr("data-rno");

	$("#modDiv2").show("slow");
	$(window).scrollTop(0);	// 맨위로
});



//좋아요 등록
$("#likeBtn").on("click", function() {
	var likeno = $("#likeno").val();
	var userid = $("#userid").val();
	var likenum = ${read.like_cnt }+1;
	
	$.ajax({
		type : 'post',
		url : '/like/cnt',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',

		data : JSON.stringify({
			bno : bno,
			userid : userid
		}),

		success : function(result) {
			if (result == 'success') {
				alert("추천 되었습니다.");
				$("#like_num").text("추천 : "+likenum+" ");
			}else if(result == 'duple') {
				alert("중복");
			}else if(result == 'login'){
				alert("로그인 필요");
			}else{
				
			}
		}
	});
});

//싫어요 등록
$("#hateBtn").on("click", function() {
	var likeno = $("#likeno").val();
	var userid = $("#userid").val();
	var hatenum = ${read.hate_cnt }+1;
	
	$.ajax({
		type : 'post',
		url : '/like/hate',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',

		data : JSON.stringify({
			bno : bno,
			userid : userid
		}),

		success : function(result) {
			if (result == 'success') {
				alert("비추 되었습니다.");
				$("#hate_num").text("비추 : "+hatenum+" ");
			}else if(result == 'duple') {
				alert("중복");
			}else if(result == 'login'){
				alert("로그인 필요");
			}else{
				
			}
		}
	});
});




var replyPage = 1;

getPageList(1);

function getAllList() {
	$.getJSON("/replies/all/"+bno,
		function(data){
			console.log(data.length);//리스트 갯수		

			var str="";
			$(data).each(
				function(){
					str += "<tr>"
						+ "<td>"+ this.rno + "</td>"
						+ "<td>"+ this.replyer + "</td>"
						+ "<td>"+ this.replytext +"</td>"
						+ "<td data-rno='"+this.rno+"' data-str='"+this.replyer+"' data-str='"+this.replytext+"' class='replyLi'><button>수정/삭제</button></td>"
						+ "</tr>";
				}
			);			
			$("#replies").html(str);
		}
	);
}



//댓글 등록
$("#replyAddBtn").on("click", function() {
	var replyer = $("#newReplyWriter").val();
	var replytext = $("#newReplyText").val();

	$.ajax({
		type : 'post',
		url : '/replies',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',

		data : JSON.stringify({
			bno : bno,
			replyer : replyer,
			replytext : replytext
		}),

		success : function(result) {
			if (result == 'success') {
				alert("등록 되었습니다.");
				//getAllList();

				getPageList(1); 
			}
		}
	});
});



// mode 열기
$("#replies").on("click", ".replyLi button", function() {

	var reply=$(this).parent();
	var rno = reply.attr("data-rno");
	var replytext = reply.attr("data-str");


	$(".modal-title").html(rno);
	$("#replytext").val(replytext);
	$("#modDiv").show("slow");
});

//수정
$("#replyModBtn").on("click",function(){
	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers: { 
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "PUT" },
		data:JSON.stringify({
			replytext:replytext
		}), 

		dataType:'text', 
		success:function(result){
			console.log("result: " + result);
			if(result == 'success'){
				alert("수정 되었습니다.");
				$("#modDiv").hide("slow");
				//getAllList();

				getPageList(replyPage); 
			}
		}
	});
});



// 삭제
$("#replyDelBtn").on("click", function() {
	var rno = $(".modal-title").html();

	$.ajax({
		type : 'delete',
		url : '/replies/' + rno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			console.log("result: " + result);
			if (result == 'success') {
				alert("삭제 되었습니다.");
				$("#modDiv").hide("slow");
				//getAllList();

				getPageList(1); 
			}
		}
	});
});

// mode닫기
$("#closeBtn").on("click", function() {
	$("#modDiv").hide("slow");
	//getAllList();

	getPageList(1); 
});

//추천닫기
$("#closeBtn2").on("click", function() {
	$("#modDiv2").hide("slow");
	//getAllList();
});





//페이징
//페이지 번호를 입력받아 데이터를 처리
//서버에서 전송된 데이터 중 댓글 목록인 list 데이터를 이용해서 댓글 내용 표시
//페이징 처리를 위해 만들어진 pageMaker 데이터를 이용해서 printPaging() 호출
function getPageList(page){
	$.getJSON("/replies/"+bno+"/"+page , function(data){ 
		console.log(data.list.length);

		var str="";

		$(data.list).each( // Map 타입의 속성 list
			function(){
				var timestamp = this.regdate;
				var date = new Date(timestamp);
				var dateString = date.toLocaleString();
				var ip = this.ip;
				
				str += '<tr>'
					+ '<td>'+ this.rno + '</td>'
					+ '<td>'+ '<a href=/user/user_info?id='+this.replyer+'>'+ this.replyer + '</a>' + '(' + ip + ')' + '</td>'
					+ '<td>'+ this.replytext +'</td>'
					+ '<td>' + dateString + '</td>'
					+ '<td data-rno="'+this.rno+'" data-str="'+this.replyer+'" data-str="'+this.replytext+'" class="replyLi"><button>수정/삭제</button></td>'
					+ '</tr>';
				
			}
		);
		$("#replies").html(str);
		printPaging(data.pageMaker); // Map 타입의 속성 pageMaker
	});
}



//pageMaker를 이용해서 화면에 페이지 번호를 출력
//상단에 getPageList(1); 추가
function printPaging(pageMaker){	

	var str = "";

	if(pageMaker.prev){
		str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}	



	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		var strClass= pageMaker.cri.page == i?'class=active':'';
			str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}

	if(pageMaker.next){
		str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
	}	
	$('.pagination').html(str);
}



//상단에 replyPage=1; 추가
$(".pagination").on("click", "li a", function(event){
	event.preventDefault(); // <a href="">태그의 기본 동작인 페이지 전환을 막는 역활을 한다.
	replyPage = $(this).attr("href"); // 클릭된 페이지의 번호를 얻는 역활을 한다.
	getPageList(replyPage);
});

</script>

${pageMaker.makeSearch(pageMaker.cri.page)} 


<br>

<a href="/sboard/modifyPage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&bno=${read.bno}">[수정]</a>

<a href="/sboard/removePage?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&bno=${read.bno}">[삭제]</a>

<a href="/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">[목록]</a>



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