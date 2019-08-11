<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table class="table table-striped table hover table-condensed">
<c:if test = "${admin ne true }">
<c:if test= "${!empty answer.answer_date}">
<tr>
	<th colspan="3">Answer</th>
</tr>
<tr>
	<td colspan="2">문의 사항에 대한 답변입니다.</td>
	<td><fmt:formatDate value="${answer.answer_date}" pattern="yyyy-MM-dd HH:mm" /></td>
</tr>
</c:if>
<tr>
	<td colspan="3">${answer.answer}</td>
</tr>
</c:if>
</table>

