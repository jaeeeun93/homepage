<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<h1>Board 글쓰기</h1>
<form method="post">
<input type="hidden" name="bno" value="${modify.bno}">
<input type="hidden" name="page" value="${param.page}">
<table width=100% border=1>
	<tr>
		<td>제목</td>
		<td><input name="title" value="${modify.title}"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input name="content" value="${modify.content}"></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input name="writer" value="${modify.writer}"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="GO"></td>
</table>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>