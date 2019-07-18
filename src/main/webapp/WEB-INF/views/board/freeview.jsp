<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

table {
	width: 80%
}
</style>
</head>
<body>
<h1>자유 게시판 게시글</h1>
<hr>
<table class="table table-striped table hover table-condensed">
<tr>
	<td colspan="3"><h3>${freeView.getTitle()}</h3></td>
</tr>

<tr>
	<td>${freeView.getNickname()}</td>
	<td><fmt:formatDate value="${freeView.getWrittendate()}" pattern="yyyy-MM-dd HH:mm" /></td>
	<td>${freeView.getHit()}</td>
</tr>
<tr><td> </td></tr>
<tr>
	<td colspan="3">${freeView.getContent()}
</tr>
</table>
<c:if test="${login }">
<button type="button" onclick="location.href='/board/write?divide=1'">글쓰기</button>
	<c:if test="${checkId }">
		<button type="button" onclick="location.href='/board/update?brdidx=${freeView.getBoard_idx()}'">글수정</button>
		<button type="button" onclick="location.href='/board/delete?brdidx=${freeView.getBoard_idx()}'">글삭제</button>
	</c:if>
</c:if>
<button onclick="location.href='/board/freelist'">목록</button>
</body>
</html>