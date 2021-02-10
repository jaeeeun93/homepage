<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" />
<!DOCTYPE HTML>
<head>
	<meta charset="UTF-8">
	<title>채식빌런 : 아이디/비밀번호 찾기</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="/css/find.css" />
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
		
		<!-- 아이디 찾기 -->
		
		<section class="login-input-section-wrap">
			<div class="login-stay-sign-in">
				<span><b>본인확인 이메일로 인증</b></span>
			</div>
			<form id="id" method="post">
			
				<div>
	            	<span class="box int_name">
	             		<input type="text" id="username" name="username" class="user_input" maxlength="20" placeholder="이름">
	               	</span>
	                <span class="error_next_box"></span>
	            </div>
	            
				<div class="mail_wrap">
				<span class="box int_email">
	            	<input type="text" id="email" name="email" class="mail_input" placeholder="이메일">
	            </span>
	            <span class="mail_input_box_warn"></span>
				<div class="mail_check_wrap">
	               	<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
	               	</div>
	               	<button type="button" class="mail_check_button">
	               		<span>인증번호</span>
	               	</button>
	               	
	               	<div class="clearfix"></div>
	               	<span id="mail_check_input_box_warn"></span>
	           	</div>
	           	<span class="error_next_box"></span>
	           	</div>
				<div class="login-button-wrap">
					<button type="button" class="id_button" id="btnId">아이디 찾기</button>
				</div>
			</form>
		</section>
		
		<!-- 비밀번호 찾기 -->
		
		<section class="login-find-section-wrap">
			<div class="login-stay-sign-in">
				<span><b>본인확인 이메일로 인증</b></span>
			</div>
			<form id="pass" method="post">
			<div>
            	<span class="box int_id">
             		<input type="text" id="userid" name="userid" class="id_input" maxlength="20" placeholder="아이디">
               	</span>
                <span class="error_next_box"></span>
            </div>
            
			<div class="mail2_wrap">
			<span class="box int_email">
            	<input type="text" id="email2" name="email2" class="mail2_input" placeholder="이메일">
            </span>
            <span class="mail2_input_box_warn"></span>
			<div class="mail2_check_wrap">
               	<div class="mail2_check_input_box" id="mail2_check_input_box_false">
					<input class="mail2_check_input" disabled="disabled">
               	</div>
               	<button type="button" class="mail2_check_button">
               		<span>인증번호</span>
               	</button>
               	
               	<div class="clearfix"></div>
               	<span id="mail2_check_input_box_warn"></span>
           	</div>
           	<span class="error_next_box"></span>
           	</div>
			<div class="login-button-wrap">
				<button type="button" class="pass_button" id="btnPass">비밀번호 찾기</button>
			</div>
			</form>
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
<script src="/js/find.js"></script>