<%@page import="dto.CalendarDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		
		$("#delete").remove();
});
</script>

<table border="1">
<col width="200"><col width="500">

<tr>
<td>아이디</td>
<td>${detail.member_idx }</td>
</tr>

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
<textarea rows="20" cols="60" readonly="readonly">${detail.title }</textarea>
</td>
</tr>

</table>

<input type="reset" id="cancel"
		class="btn btn-danger" value="뒤로가기"/>
<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }"><button class="btn btn-primary">수정</button></a>
<input type="button" id="delete" class="btn btn-danger" value="삭제"/>