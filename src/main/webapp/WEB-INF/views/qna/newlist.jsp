<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
table, th, tr {
	text-align: center;
}

.container {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/qna/newlist?search="+$("#search").val();
	});
});
</script>
</head>
<body>
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

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" />
	<button id="btnSearch" class="btn">검색</button>
</div> 
</body>
</html>