<%@page import="dto.CalendarDto" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
CalendarDto dto = (CalendarDto)request.getAttribute("dto");
%>

<table border="1">
<col width="200"><col width="500">

<tr>
<td>아이디</td>
<td>${member_idx }</td>
</tr>

<tr>
<td>제목</td>
<td>${title }</td>
</tr>

<tr>
<td>일정</td>
<td>${rdate}</td>
</tr>

<tr>
<td>내용</td>
<td>
<textarea rows="20" cols="60" readonly="readonly">${TITLE }</textarea>
</td>
</tr>

</table>