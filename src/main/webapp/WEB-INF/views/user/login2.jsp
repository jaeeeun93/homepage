<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" />
<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<title>채식빌런 : 로그인</title>
	<link rel="stylesheet" href="style.css">
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			<div class="logo-wrap">
				 <a href="/" target="_blank"><img src="/images/NAVER.png" id="logo"></a>
			</div>
		</header>
		<section class="login-input-section-wrap">
			<form id="login" method="post">
			
			<div>
			<span class="box int_id">	
				<input placeholder="아이디" type="text" id="id" name="userid" class="id_input"></input>
			</span>	
				<span class="error_next_box"></span>
			</div>
			
			<div>
			 <span class="box int_pass">	
				<input placeholder="비밀번호" type="password" id="pswd1" name="userpw" class="pw_input"></input>
			</span>	
				<span class="error_next_box"></span>
			</div>
			<div class="login-button-wrap">
				<button type="button" class="login_button" id="btnLogin">로그인</button>
			</div>
			</form>
			<%-- <div class="login-stay-sign-in">
				<i class="far fa-check-circle"></i>
				<span>로그인 상태 유지</span>
			</div>--%>
		</section>
		
		<section class="Easy-sgin-in-wrap">
			<%-- <h2>더욱 간편한 로그인</h2>
			<ul class="sign-button-list">
				<li><button><i class="fas fa-qrcode"></i><span>Sign in with QR code</span></button></li>
				<li><button><i class="fab fa-facebook-square"></i><span>Facebook</span></button></li>
				<li><button><i class="fab fa-line"></i><span>line</span></button></li>
			</ul>--%>
			<p class="forget-msg">Forgot your Username or Password? | <a href='/user/join'>회원가입</a></p>
		</section>
		<footer>
			<div class="copyright-wrap">
				<span><img src="img/logo.png">Copyright © 채식빌런 Corp. All Rights Reserved.</span>
			</div>
		</footer>
		</div>
	</div>
</body>
<script src="/js/jquery.min.js"></script>
<script src="/js/login.js"></script>