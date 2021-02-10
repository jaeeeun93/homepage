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
<script>

function change(ppn){

	location.href="listPage?page=1&perPageNum="+ppn;

}

</script>

<h1>List Page</h1>
<table border=0>
	<tr>
		<td>
			Total : ${pageMaker.totalCount } 
			<select name="perPageNum" onchange="change(this.value)">
				<option value="1" <c:if test="${pageMaker.cri.perPageNum == 1}">selected</c:if>>1개</option>
				<option value="2" <c:if test="${pageMaker.cri.perPageNum == 2}">selected</c:if>>2개</option>
				<option value="4" <c:if test="${pageMaker.cri.perPageNum == 4}">selected</c:if>>4개</option>
				<option value="6" <c:if test="${pageMaker.cri.perPageNum == 6}">selected</c:if>>6개</option>
				<option value="8" <c:if test="${pageMaker.cri.perPageNum == 8}">selected</c:if>>8개</option>
				<option value="10" <c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10개</option>
			</select>
		</td>
	</tr>
	<tr><td height=5></td></tr>
</table>
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
	<c:set var="number" value="${pageMaker.totalCount - (pageMaker.cri.page - 1) * pageMaker.cri.perPageNum }" /> 
	<c:forEach var="list" items="${list}">
	<tr>
		<td>${number }</td>
		<td><a href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${list.bno}">${list.title}</a></td>
		<td>${list.content}</td>
		<td>${list.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.regdate}"/></td>
		<td>${list.viewcnt}</td>
	</tr>
	<c:set var="number" value="${number - 1 }"/> 
	</c:forEach>
</table>
</form>
<table>
	<tr>
		<td><a href="/board/register">[글쓰기]</a></td>
	</tr>
</table>
<table border=1>
	<tr>
		<c:if test="${pageMaker.prev}">
			<td><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></td>
		</c:if>
		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<td>
				<c:if test="${pageMaker.cri.page == idx}"><b></c:if>
					<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
				<c:if test="${pageMaker.cri.page == idx}"></b></c:if>
			</td>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<td><a href="listPage${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></td>		
		</c:if>
	</tr>
</table>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>