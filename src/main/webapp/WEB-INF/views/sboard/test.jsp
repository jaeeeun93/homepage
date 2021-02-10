<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!-- 글 작성 -->

<table border=1>
	<tr>
		<td>REPLYER</td>
		<td><input type='text' name='replyer' id='newReplyWriter'></td>
	</tr>

	<tr>
		<td>REPLY TEXT</td>
		<td><input type='text' name='replytext' id='newReplyText'></td>
	</tr>
	<tr>
		<td></td>
		<td><button id="replyAddBtn">ADD REPLY</button></td>
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


</style>


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
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</td>
	</tr>
</table>



<!-- 댓글 목록 출력 영역 -->

<table id="replies" border=1>



</table>

<!-- 페이징 -->

<ul class="pagination">



</ul>	

<script>

var bno = 9; //존재하는 글번호
//getAllList();

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
						+ "<td>"+ this.replytext +"</td>"
						+ "<td data-rno='"+this.rno+"' data-str='"+this.replytext+"' class='replyLi'><button>mode</button></td>"
						+ "</tr>";
				}
			);			
			$("#replies").html(str);
		}
	);
}



//글 등록
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

	alert(rno + " : " + replytext);

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
				str += "<tr>"
					+ "<td>"+ this.rno + "</td>"
					+ "<td>"+ this.replytext +"</td>"
					+ "<td data-rno='"+this.rno+"' data-str='"+this.replytext+"' class='replyLi'><button>mode</button></td>"
					+ "</tr>";

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


<%@include file="/WEB-INF/views/include/footer.jsp" %>