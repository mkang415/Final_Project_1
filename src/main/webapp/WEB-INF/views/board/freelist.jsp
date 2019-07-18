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
</head>
<body>
<h1>게시판 리스트</h1>
<hr>

<table class="table table-striped table hover table-condensed">
	<tr>
		<th style="width : 10%">추천</th>
		<th style="width : 45%">제목</th>
		<th style="width : 15%">작성자</th>
		<th style="width : 10%">조회수</th>
		<th style="width : 20%">작성일</th>
	</tr>
<c:forEach items="${freeList}" var = "i">
	<tr>
		<td>${i.RECOMMEND}</td>
		<td><a href="/board/freeview?brdidx=${i.BOARD_IDX}">${i.TITLE}</a></td>
		<td>${i.NICKNAME}</td>
		<td>${i.HIT}</td>
		<td><fmt:formatDate value="${i.WRITTENDATE}" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:forEach>
</table>

<c:import url="/WEB-INF/views/layout/freePaging.jsp"></c:import>

<c:if test="${login }">
${nick }<br>
<button type="button" onclick="location.href='/board/write?divide=1'">글쓰기</button>
</c:if>
<button type="button" onclick="location.href='/main'">메인</button>

</body>
</html>