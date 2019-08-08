<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h2>일정상세보기</h2>


<div align="center">
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
</div>
<!-- 버튼영역 -->
<div class="text-center">
<a href="/schedule/calendar"><button class="btn btn-default">목록</button></a>
<a href="/schedult/delete?calendar_idx=${viewcal.calendar_idx}"><button class="btn btn-danger">삭제</button></a>
</div>
