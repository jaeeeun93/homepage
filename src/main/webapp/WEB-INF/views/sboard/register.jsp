<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>

<script type="text/javascript" src="/js/upload.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=ctx %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,
              fOnBeforeUnload : function(){
            	  
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["content"].exec("PASTE_HTML", ['']);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#registerForm").submit();
      });    
});
 
</script>

<!-- <script>
$(function(){
	
	$("#test").on("click", function() {
		$( 'input#src' ).val( '${sessionScope.src}' );			
	});
});
</script> -->

<script>
	$("#registerForm").submit(function(event){
		event.preventDefault();	
		var that = $(this);
		var str ="";


		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";

		});

		that.append(str);
		that.get(0).submit();
	});
</script>
	<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
				<div id="main">
					
					<div class="inner">
					
						<!-- Header -->
							<header id="header">
								<a href="/sboard/list" class="logo"><strong>채식 갤러리</strong></a>
							</header>
							
							
						<!-- Banner -->
						<div>
						
							
						</div>
			<form id='registerForm' role="form" method="post" enctype="multipart/form-data">
				<c:choose>
				<c:when test="${sessionScope.id != null }">
					<table width=100% border=1>
						<tr>
							<td>말머리</td>
							<td>
								<div>
								  <input type="radio" id="normal" name="header" value="일반"
								         checked>
								  <label for="normal">일반</label>
								</div>
								
								<div>
								  <input type="radio" id="info" name="header" value="정보">
								  <label for="info">정보</label>
								</div>
								
								<div>
								  <input type="radio" id="etc" name="header" value="기타">
								  <label for="etc">기타</label>
								</div>
							</td>
						</tr>
					
						<tr>
							<td>제목</td>
							<td><input name="title"></td>
						</tr>
						<tr>
							<td>에디터 내용</td>
							<td>
								<textarea id="content" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="writer" value="${sessionScope.id }" readonly></td>
						</tr>
							<input type="hidden" id="src" name="src" size=80px;>
						<tr>
							<td></td>
							<td><input type="button" id="save" value="GO"></td>
						</tr>
					</table>
				</c:when>
				
				<c:otherwise>
					<table width=100% border=1>
						<tr>
							<td>말머리</td>
							<td>
								<div>
								  <input type="radio" id="normal" name="header" value="일반"
								         checked>
								  <label for="normal">일반</label>
								</div>
								
								<div>
								  <input type="radio" id="info" name="header" value="정보">
								  <label for="info">정보</label>
								</div>
								
								<div>
								  <input type="radio" id="etc" name="header" value="기타">
								  <label for="etc">기타</label>
								</div>
							</td>
						</tr>
					
						<tr>
							<td>제목</td>
							<td><input name="title"></td>
						</tr>
						<tr>
							<td>에디터 내용</td>
							<td>
								<textarea id="content" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="writer"></td>
						</tr>
							<input type="hidden" id="src" name="src" size=80px;>
						<tr>
							<td></td>
							<td><input type="button" id="save" value="GO"></td>
						</tr>
					</table>
				</c:otherwise>
				</c:choose>
					
					<!-- <button type="button" id="tbtn" class="mail_check_button">
                			<span>인증번호</span>
                	</button> -->
				</form>
				<!-- <select id="test" name="searchType" style="width:150px;height:50px;">
					<option value="t" selected="selected">b</option>
					<option value="t">Title</option>
					<option value="t">a</option>
				</select> -->
			</div>
			</div>

<!-- <script>
$(".mail_check_button").click(function(){
$.ajax({
	
		type:"GET",
		url:"/user/test",
		success:function(data){
			var option = $("<option>"+data+"</option>");
			alert(data);
			$("#test option:selected").val(data); //벨류값
			$("#test option:selected").text(data); //텍스트값
		}
	});
});
</script> -->
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