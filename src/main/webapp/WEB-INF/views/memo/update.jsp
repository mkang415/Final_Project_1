<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메모 수정</h1>
<hr>
<div style="width: 300px; height: 400px">
<form action="/memo/update" method = "post">
	<fieldset>
		<legend>메모 수정</legend>
		<input type="hidden" name = "memo_idx" value="${memo.getMemo_idx()}"/>
		<div style="height: 60px"><input type="text" style="width: 94%" id="title" name = "title" placeholder="제목 입력" value="${memo.getTitle() }"/></div>
		<div style="height: 335px"><textarea style="width: 94%; height: 300px" name="memo" placeholder="메모 내용 입력">${memo.getMemo()}</textarea></div>
		<button type="submit">수정</button>
		<button type="button" onclick="location.href='/memo/list'">취소</button>
	</fieldset>
</form>
</div>
</body>
</html>