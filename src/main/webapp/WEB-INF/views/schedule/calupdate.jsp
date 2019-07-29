<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
#update {
align : "center";
}


</style>

<div id="update">
<form action="/schedule/calupdate" method="post">

	<input type="hidden" name="calendar_idx" value="${detail.calendar_idx }" />
	
	<table border="1">


<tr>
	<td><label for="title">제목</label></td>
	<td><input type="text" id="title" name="title" value="${detail.title }"/></td>
</tr>

<tr>
<td><label>일정</label></td>
<td>${detail.rdate}</td>
</tr>

<tr>
<td><label>작성일</label></td>
<td>${detail.wdate}</td>
</tr>

<tr>
	<td><label for="content">내용</label></td>
	<td><textarea rows="10" cols="40" id="contetn" name="content">${detail.content }</textarea></td>
</tr>


</table>
<br><br><br>

<a href="/schedule/calendar"><button class="btn btn-default">목록</button></a>


<c:if test="${detail.member_idx eq detail.member_idx}">
		<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }">
		<button class="btn btn-primary">저장</button></a>

</c:if>
</form>
</div>