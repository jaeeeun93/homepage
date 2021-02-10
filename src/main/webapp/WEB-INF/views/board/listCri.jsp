<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
var result="${msg}"
if(result == "delete-success"){
	alert("삭제 되었습니다.");
}
var result="${msg}"
if(result == "modify-success"){
	alert("수정 되었습니다.");
}
</script>

<h1>List Page</h1>
<form method="post">
<table width=100% border=1>
	<tr>
		<td>bno</td>
		<td>title</td>
		<td>content</td>
		<td>writer</td>
		<td>regdate</td>
		<td>viewcnt</td>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.bno}</td>
		<td><a href="read?bno=${list.bno}">${list.title}</a></td>
		<td>${list.content}</td>
		<td>${list.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.regdate}"/></td>
		<td>${list.viewcnt}</td>
	</tr>
	</c:forEach>
</table>
</form>
<table>
	<tr>
		<td><a href="/board/register">[글쓰기]</a></td>
	</tr>
</table>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>