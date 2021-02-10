<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<head>
<title>채식빌런 DM</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">

.emp{
	height:20px;
}

.chat-online {
    color: #34ce57
}

.chat-offline {
    color: #e4606d
}

.col-12{
 	max-height: 750px;
	overflow-y: scroll
}

.chat-messages {
    display: flex;
    flex-direction: column;
    height : 600px;
    max-height: 600px;
    overflow-y: scroll
}

.chat-message-left,
.chat-message-right {
    display: flex;
    flex-shrink: 0
}

.chat-message-left {
    margin-right: auto
}

.chat-message-right {
    flex-direction: row-reverse;
    margin-left: auto
}
.py-3 {
    padding-top: 1rem!important;
    padding-bottom: 1rem!important;
}
.px-4 {
    padding-right: 1.5rem!important;
    padding-left: 1.5rem!important;
}
.flex-grow-0 {
    flex-grow: 0!important;
}
.border-top {
    border-top: 1px solid #dee2e6!important;
}




header2 {
  height: 75px;
  padding: 1rem;
  color: white;
  background: #3c3f48;
  font-weight: bold;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

</style>
</head>
<body>

<header2>
<a href="/" style="border: 0px;"><img src="/images/NAVER.png" width=100></a>
  <nav>
  <c:choose>
	<c:when test="${sessionScope.id != null }">
		<a href="/user/dm_main"><span class="icon solid fas fa-paper-plane fa-2x" style="color:white"></span></a>
		<a href="/user/user_info?id=${sessionScope.id }"><span class="icon solid fas fa-user-circle fa-2x" style="color:white"></span></a>
		<span>${sessionScope.id }</span>
    	<span><button onclick="location.href='/user/logout'">LOGOUT</button></span>
    	<span><button onclick="location.href='/user/user_modify'">MODIFY</button></span>
  	</c:when>
  	<c:otherwise>
  		<span><button onclick="location.href='/user/login2'">LOGIN</button></span>
  		<span><button onclick="location.href='/user/find_id'">FIND ID/PW</button></span>
    	<span><button onclick="location.href='/user/join'">SIGN UP</button></span>
  	</c:otherwise>
  </c:choose>
  </nav>
</header2>

<main class="content">
    <div class="container p-0">
    	<div class="emp"></div>
		<h1 class="h3 mb-3">Messages</h1>

		<div class="card">
			<div class="row g-0">
				<div class="col-12 col-lg-5 col-xl-3 border-right">

					<div class="px-4 d-none d-md-block">
						<div class="d-flex align-items-center">
							<div class="flex-grow-1">
								<input type="text" class="form-control my-3" placeholder="Search...">
							</div>
						</div>
					</div>

					
					<c:forEach var="list" items="${following_list }">
					<a href="/user/dm?following=${list.to_id }" class="list-group-item list-group-item-action border-0">
						<div class="d-flex align-items-start">
							<img src="/images/simple.png" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								${list.to_id }
							</div>
						</div>
					</a>
					</c:forEach>
					
					<hr class="d-block d-lg-none mt-1 mb-0">
				</div>
				
				<div class="col-12 col-lg-7 col-xl-9">
					<div class="py-2 px-4 border-bottom d-none d-lg-block">
						<div class="d-flex align-items-center py-1">
							<div class="position-relative">
								<img src="/images/simple.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
							</div>
							<div class="flex-grow-1 pl-3">
								<strong>${to_id }</strong>
							</div>
							<div>
								<button class="btn btn-light border btn-lg px-3"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal feather-lg"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg></button>
							</div>
						</div>
					</div>

<!-- DM 내용 출력 -->
					<div class="position-relative">
						<div id="dm_context" class="chat-messages p-4">
							<!-- 전체 -->
							<c:forEach var="list" items="${dm_all }" varStatus="status">
							<c:choose>
								<c:when test="${list.context eq null}">
									
								</c:when>
								<c:when test="${list.to_id eq sessionScope.id }">
									<div class="chat-message-left pb-4">
										<div>
											<img src="/images/simple.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
											<div class="text-muted small text-nowrap mt-2">${list.regdate }</div>
										</div>
										<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
											<div class="font-weight-bold mb-1">${list.from_id }</div>
											${list.context }
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="chat-message-right pb-4">
										<div>
											<img src="/images/simple.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
											<div class="text-muted small text-nowrap mt-2">${list.regdate }</div>
										</div>
										<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
											<div class="font-weight-bold mb-1">${list.from_id }</div>
											${list.context }
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							</c:forEach>
						</div>
						
						<script>
						<!-- 채팅 스크롤 하단으로 보내기 -->
						$('#dm_context').scrollTop($('#dm_context')[0].scrollHeight);
	
						</script>
					</div>
					
					<div class="flex-grow-0 py-3 px-4 border-top">
						<div class="input-group">
							<input type="hidden" id="from_id" value="${sessionScope.id }">
							<input type="hidden" id="to_id" value="${to_id }">
							<input type="text" id='context' class="form-control" placeholder="Type your message">
							<button class="btn btn-primary" id="sendDM">Send</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>

<script src="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>