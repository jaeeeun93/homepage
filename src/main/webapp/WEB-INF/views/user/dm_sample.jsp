<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
<title>채식빌런 DM</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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

.chat-messages {
    display: flex;
    flex-direction: column;
    max-height: 800px;
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
		<span>${sessionScope.id }님 환영합니다</span>
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
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="badge bg-success float-right">5</div>
						<div class="d-flex align-items-start">
							<img src="/images/simple.png" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								${list.following }
								<div class="small"><span class="fas fa-circle chat-online"></span> Online</div>
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
								<strong>${following }</strong>
								<div class="text-muted small"><em>Typing...</em></div>
							</div>
							<div>
								<button class="btn btn-light border btn-lg px-3"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal feather-lg"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg></button>
							</div>
						</div>
					</div>

					<div class="position-relative">
						<div class="chat-messages p-4">

							<div class="chat-message-right pb-4">
								<div>
									<img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
									<div class="text-muted small text-nowrap mt-2">2:33 am</div>
								</div>
								<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
									<div class="font-weight-bold mb-1">You</div>
									Lorem ipsum dolor sit amet, vis erat denique in, dicunt prodesset te vix.
								</div>
							</div>

							<div class="chat-message-left pb-4">
								<div>
									<img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
									<div class="text-muted small text-nowrap mt-2">2:34 am</div>
								</div>
								<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
									<div class="font-weight-bold mb-1">Sharon Lessman</div>
									Sit meis deleniti eu, pri vidit meliore docendi ut, an eum erat animal commodo.
								</div>
							</div>

							<div class="chat-message-right mb-4">
								<div>
									<img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
									<div class="text-muted small text-nowrap mt-2">2:35 am</div>
								</div>
								<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
									<div class="font-weight-bold mb-1">You</div>
									Cum ea graeci tractatos.
								</div>
							</div>

						</div>
					</div>

					<div class="flex-grow-0 py-3 px-4 border-top">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Type your message">
							<button class="btn btn-primary">Send</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>