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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<h1>QNA 페이지</h1>
<hr>
<div>
<table class="table table-striped table hover table-condensed">
<tr>
	<td colspan="2"><h3>${qna.getTitle()}</h3></td>
</tr>

<tr>
	<td>${qna.getNickname()}</td>
	<td><fmt:formatDate value="${qna.getWrittendate()}" pattern="yyyy-MM-dd HH:mm" /></td>
</tr>
<tr>
	<td colspan="2">${qna.getQuestion()}
</tr>
</table>
</div>

<c:if test="${login }">
	<button type="button" onclick="location.href='/qna/write'">질문하기</button>
	<c:if test="${checkId}">
		<button type="button" onclick="location.href='/qna/update?qnaidx=${qna.getQna_idx()}'">질문 수정</button>
		<button type="button" onclick="location.href='/qna/delete?qnaidx=${qna.getQna_idx()}'">질문 삭제</button>
	</c:if>
</c:if>

<button onclick="location.href='/qna/newlist'">목록</button>

</body>
</html>