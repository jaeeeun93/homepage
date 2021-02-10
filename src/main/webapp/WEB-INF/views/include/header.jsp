<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>채식빌런</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css" />

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<style>

header2 {
  height: 75px;
  padding: 1rem;
  color: white;
  background: #3c3f48;
  font-weight: bold;
  display: flex;
  justify-content: space-between;
  align-items: center;
  text-decoration:none !important;
}
</style>
</head>
<body class="is-preload">

<header2>
<a href="/" style="border: 0px;"><img src="/images/NAVER.png" width=100></a>
  <nav>
  <c:choose>
	<c:when test="${sessionScope.id != null }">
		<a href="/user/dm_main"><span class="icon solid fa-paper-plane fa-2x" style="color:white"></span></a>
		<a href="/user/user_info?id=${sessionScope.id }"><span class="icon solid fa-user-circle fa-2x" style="color:white"></span></a>
		<span>${sessionScope.id }</span>
    	<span><button onclick="location.href='/user/logout'">LOGOUT</button></span>
    	<span><button onclick="location.href='/uploadAjax'">MODIFY</button></span>
  	</c:when>
  	<c:otherwise>
  		<span><button onclick="location.href='/user/login2'">LOGIN</button></span>
  		<span><button onclick="location.href='/user/find_id'">FIND ID/PW</button></span>
    	<span><button onclick="location.href='/user/join'">SIGN UP</button></span>
  	</c:otherwise>
  </c:choose>
  </nav>
</header2>