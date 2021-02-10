<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<script>
var result = "${msg}";
if(result=="가입하지 않은 아이디이거나, 잘못된 비밀번호입니다."){
	alert(result);
	location.href="/user/login2";
}else if(result == "이름이나 이메일 정보가 일치하지 않습니다."){
	alert(result);
	location.href="/user/find_id";
}else if(result == "아이디나 이메일 정보가 일치하지 않습니다."){
	alert(result);
	location.href="/user/find_id";
}else {
	alert(result);
	location.href="/";
}

</script>

<body>
공사중<br>
${msg }
<h4>${exception.getMessage() }</h4>



<ul>

<c:forEach var="stack" items="${exception.getStackTrace() }">

	<li>${stack.toString() }</li>

</c:forEach>

</ul>

</body>

</html>