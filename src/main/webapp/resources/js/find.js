/* 변수 선언 */

var code = "";

var userName = document.querySelector('#username');	//[0]
var email = document.querySelector('#email');		//[1]
var id = document.querySelector('#userid');			//[2]	
var email2 = document.querySelector('#email2');		//[3]
var error = document.querySelectorAll('.error_next_box');

/* 유효성 검사 통과유무 변수 */

var nameCheck = false;            	// 이름
var idCheck = false;            	// 이름

var mailCheck = false;            	// 아이디 이메일
var mailnumCheck = false;        	// 아이디 이메일 인증번호 확인

var mail2Check = false;            	// 비밀번호 이메일
var mail2numCheck = false;        	// 비밀번호 이메일 인증번호 확인

/* 이벤트 핸들러 연결 */

userName.addEventListener("focusout", checkName);
email.addEventListener("focusout", isEmailCorrect);
id.addEventListener("focusout", checkId);
email2.addEventListener("focusout", isEmail2Correct);

// 아이디 찾기
$(document).ready(function(){

	$(".id_button").click(function(){
		
		/* 입력값 변수 */
        var name = $('.user_input').val();            // 이름 입력란
        var email = $('.mail_input').val();            // 이메일 입력란
        
        /* 이름 유효성 검사 */
        if(name == ""){
            nameCheck = false;
        }else{
            nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(email == ""){
            mailCheck = false;
        }else{
            mailCheck = true;
        }
        
        /* 최종 유효성 검사 */
        if(nameCheck&&mailCheck&&mailnumCheck){
 			$("#id").attr("action", "/user/idFind");
			$("#id").submit();
        }if(!nameCheck){
        	error[0].innerHTML = "필수 정보입니다.";
       		error[0].style.color = "#F00";
       		error[0].style.display = "block";
        }if(!mailCheck){
        	error[1].innerHTML = "필수 정보입니다. 인증이 필요합니다.";
       		error[1].style.color = "#F00";
       		error[1].style.display = "block";
        }else {
        	
        }
        return false;
	});
	
	$(".pass_button").click(function(){
		
		/* 입력값 변수 */
        var id = $('.id_input').val();            // 이름 입력란
        var email2 = $('.mail2_input').val();            // 이메일 입력란
        
        /* 이름 유효성 검사 */
        if(id == ""){
            idCheck = false;
        }else{
            idCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(email2 == ""){
            mail2Check = false;
        }else{
            mail2Check = true;
        }
        
        /* 최종 유효성 검사 */
        if(idCheck&&mail2Check&&mail2numCheck){
 			$("#pass").attr("action", "/user/passFind");
			$("#pass").submit();
        }if(!idCheck){
        	error[2].innerHTML = "필수 정보입니다.";
       		error[2].style.color = "#F00";
       		error[2].style.display = "block";
        }if(!mail2Check){
        	error[3].innerHTML = "필수 정보입니다. 인증이 필요합니다.";
       		error[3].style.color = "#F00";
       		error[3].style.display = "block";
        }else {
        	
        }
        return false;
	});
});

/*콜백 함수*/

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
        nameCheck = false;
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[0].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[0].style.display = "block";
        nameCheck = false;
    } else {
    	error[0].style.display = "none";
        nameCheck = true;
    }
}

function checkId() {
    var idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
        idCheck = false;
    } else if(!idPattern.test(id.value)) {
        error[2].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[2].style.display = "block";
        idCheck = false;
    } else {
        error[2].style.display = "none";
        idCheck = true;
    }
}

function isEmailCorrect() {
    var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

    if(email.value === ""){ 
    	error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
        mailCheck = false; 
    } else if(!emailPattern.test(email.value)) {
    	error[1].innerHTML = "올바르지 못한 이메일 형식입니다.";
        error[1].style.display = "block";
        mailCheck = false;
    } else {
        error[1].style.display = "none";
        mailCheck = true;
    }

}

function isEmail2Correct() {
    var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

    if(email2.value === ""){ 
    	error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
        mail2Check = false; 
    } else if(!emailPattern.test(email2.value)) {
    	error[3].innerHTML = "올바르지 못한 이메일 형식입니다.";
        error[3].style.display = "block";
        mail2Check = false;
    } else {
        error[3].style.display = "none";
        mail2Check = true;
    }

}



/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
	return form.test(email);
}

/* 입력 이메일 형식 유효성 검사 */
function mail2FormCheck(email2){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
	return form.test(email2);
}



/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){

	var email = $(".mail_input").val();			// 입력한 이메일
	var checkBox = $(".mail_check_input");		// 인증번호 입력란
	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
	var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
	
	/* 이메일 형식 유효성 검사 */
    if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
	
	$.ajax({
	
		type:"GET",
		url:"/user/mailCheck?email=" + email,
		success:function(data){
			
			checkBox.attr("disabled", false);
			boxWrap.attr("id", "mail_check_input_box_true");
			code = data;
		}
	});

});


/* 인증번호 이메일 전송 */
$(".mail2_check_button").click(function(){

	var email2 = $(".mail2_input").val();			// 입력한 이메일
	var checkBox = $(".mail2_check_input");		// 인증번호 입력란
	var boxWrap = $(".mail2_check_input_box");	// 인증번호 입력란 박스
	var warnMsg = $(".mail2_input_box_warn");	// 이메일 입력 경고글
	
	/* 이메일 형식 유효성 검사 */
    if(mail2FormCheck(email2)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
	
	$.ajax({
	
		type:"GET",
		url:"/user/mailCheck?email=" + email2,
		success:function(data){
			
			checkBox.attr("disabled", false);
			boxWrap.attr("id", "mail2_check_input_box_true");
			code = data;
		}
	});

});



/* 인증번호 비교 */
$(".mail_check_input").blur(function(){

	var inputCode = $(".mail_check_input").val();
	var checkResult = $("#mail_check_input_box_warn");
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");
		mailnumCheck = true;
	} else {
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
		mailnumCheck = false;
	}
	
});

/* 인증번호 비교 */
$(".mail2_check_input").blur(function(){

	var inputCode = $(".mail2_check_input").val();
	var checkResult = $("#mail2_check_input_box_warn");
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");
		mail2numCheck = true;
	} else {
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
		mail2numCheck = false;
	}
	
});