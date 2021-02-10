<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/join.css" />
<!DOCTYPE html>
<html lnag="ko">
    <head>
        <meta charset="UTF-8">
        <title>채식빌런 : 회원가입</title>
        <link rel="stylesheet" href="new_main.css">
        
    </head>
    <body>
        <!-- header -->
        <div id="header">
            <a href="/" target="_blank"><img src="/images/NAVER.png" id="logo"></a>
        </div>

        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <form id="join" method="post">
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="userid" class="id_input" maxlength="20">
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" name="userpw" class="pw_input" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="/images/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="pwck_input" maxlength="20">
                        <img src="/images/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="username" name="username" class="user_input" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>


                <!-- EMAIL -->
                <div class="mail_wrap">
                	<h3 class="join_title"><label for="email">이메일</label></h3>
					<span class="box int_email">
                        <input type="text" id="email" name="email" class="mail_input">
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
				
                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" name="mobile" class="mobile_input" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <input type="button" class="join_button" id="btnJoin" value="가입하기">
                </div>

            </div> 
            <!-- content-->
			</form>
        </div> 
        <!-- wrapper -->
    </body>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/naver.js"></script>
</html>