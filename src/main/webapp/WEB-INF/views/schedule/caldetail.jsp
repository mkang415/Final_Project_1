<%@page import="dto.CalendarDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


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
<br>
<h3 style="text-align:center">▷ 일정 보기 ◁</h3>

<div class="detail" align="center">

<br>
<table border="1">
<col width="200"><col width="700px">

<tr>
<td ><label>제목</label></td>
<td>${detail.title }</td>
</tr>

<tr>
<td><label>일정 날짜</label></td>
<td>${detail.rdate}</td>
</tr>

<tr>
<td><label>작성한 날짜</label></td>
<td><fmt:formatDate value="${detail.wdate}" pattern="yyyy-MM-dd"/></td>
</tr>


<tr>
<td  width="200" height="300"><label>내용</label></td>
<td>
<div >${detail.content }</div>
</td>
</tr>

</table>
</div>
<br><br>

<div align="center">
<a href="/schedule/calendar"><button class="btn btn-default">목록</button></a>


<c:if test="${detail.member_idx eq detail.member_idx}">
		<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }">
		<button class="btn btn-primary">수정</button></a>


<a href="/schedule/caldel?calendar_idx=${detail.calendar_idx}">
<button class="btn btn-danger">삭제</button></a>

</c:if>
</div>

<br><br>