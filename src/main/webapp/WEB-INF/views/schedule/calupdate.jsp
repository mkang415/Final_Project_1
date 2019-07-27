<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		$("form").submit();
	});
	
	$("#cancel").click(function() {
		history.back(-1);
	});

});

</script>


<form action="/schedule/calupdate" method="post">
	<input type="hidden" name="calendar_idx" value="${detail.calendar_idx }" />
<label for="member_idx">아이디</label>
<input type="text" id="member_idx" value="${detail.member_idx }" readonly="readonly"/>


<label for="title">제목</label>
<input type="text" id="title" name="title" value="${detail.title }"/>

<label for="content">내용</label>
<textarea rows="20" cols="100%" id="contetn" name="content">${detail.content }</textarea>


<button class="btn btn-primary" id="btnUpdate">수정</button>
<input type="reset" id="cancel"
			class="btn btn-danger" value="취소"/>
</form>