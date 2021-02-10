<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<h1>Board 내용</h1>
<form method="post">
<table width=100% border=1>
	<tr>
		<td>제목</td>
		<td>${read.title}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${read.content}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${read.writer}</td>
	</tr>
	<tr>
		<td>
			<a href="/board/modifyPage?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${read.bno}">[수정]</a>
			<a href="/board/removePage?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${read.bno}">[삭제]</a>
		</td>
</table>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>