<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">
table, th, tr {
	text-align: center;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/qna/newlist?search="+$("#search").val();
	});
});
</script>

<h1>QNA 리스트</h1>
<hr>
<table class="table table-striped table hover table-condensed">
	<tr>
		<th style="width : 15%">답변</th>
		<th style="width : 50%">제목</th>
		<th style="width : 15%">작성자</th>
		<th style="width : 20%">작성일</th>
	</tr>

<c:forEach items="${newList}" var = "n">
	<tr>
		<td><c:choose>
			<c:when test="${empty n.ANSWER_DATE}">미확인</c:when>
			<c:when test="${not empty n.ANSWER_DATE}">답변완료</c:when>
		</c:choose></td>
		<td><a href="/qna/view?qnaidx=${n.QNA_IDX}">${n.TITLE}</a></td>
		<td>${n.NICKNAME}</td>
		<td><fmt:formatDate value="${n.QUESTION_DATE}" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:forEach>
</table>
<c:import url="/WEB-INF/views/layout/qnaPaging.jsp"></c:import>

<div>
<c:if test="${login }">
${nick }<br>
<button type="button" onclick="location.href='/qna/write'">글쓰기</button>
</c:if>
<button type="button" onclick="location.href='/main'">메인</button>
</div>

<div class="form-row" style="margin: auto;">
	<div class="col-5">
	</div>
	<div class="col-2">
	<input class="form-control" type="text" id="search"/>
	</div>
	<div class="col">
	<input type="button" id="btnSearch" class="btn btn-primary" value="검색"/>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>