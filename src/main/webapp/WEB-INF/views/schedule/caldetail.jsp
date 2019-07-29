<%@page import="dto.CalendarDto" %>
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


<%
CalendarDto dto = (CalendarDto)request.getAttribute("dto");
%>

<script type="text/javascript">
$(document).ready(function() {
		$("#cancel").click(function(){
			history.back(-1);
		});
		
		$("#caldel").remove();
});
</script>

<style>
table {
text-align : center;
}



</style>
<div class="detail">
<table border="1">
<col width="200"><col width="500">

<tr>
<td>제목</td>
<td>${detail.title }</td>
</tr>

<tr>
<td>일정</td>
<td>${detail.rdate}</td>
</tr>

<tr>
<td>작성일</td>
<td>${detail.wdate}</td>
</tr>


<tr>
<td>내용</td>
<td>
<textarea rows="5" cols="80" readonly="readonly">${detail.content }</textarea>
</td>
</tr>

</table>
</div>
<br><br>


<a href="/schedule/calendar"><button class="btn btn-default">목록</button></a>


<c:if test="${detail.member_idx eq detail.member_idx}">
		<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }">
		<button class="btn btn-primary">수정</button></a>


<a href="/schedule/caldel?calendar_idx=${detail.calendar_idx}">
<button class="btn btn-danger">삭제</button></a>

</c:if>