<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<!-- summernote -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<style type="text/css">

table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

table {
	width: 80%
}
</style>

<div style="width: 1000px; margin: auto;">
<table class="table table-striped table hover table-condensed">
<tr>
	<td colspan="3"><h3>${qna.getTitle()}</h3></td>
</tr>

<tr>
	<td><c:choose>
			<c:when test="${empty qna.getAnswer_date()}">미확인</c:when>
			<c:when test="${not empty qna.getAnswer_date()}">답변완료</c:when>
		</c:choose></td>
	<td>${qna.getNickname()}</td>
	<td><fmt:formatDate value="${qna.getQuestion_date()}" pattern="yyyy-MM-dd HH:mm" /></td>
</tr>

<tr>
	<td colspan="3">${qna.getQuestion()}</td>
</tr>
</table>
</div>

<c:import url="/WEB-INF/views/qna/answer.jsp"></c:import>

<div style="width: 900px; margin: auto;">
<div class="btn-group" role="group" aria-label="Basic example">
<c:if test="${login }">
	<c:if test = "${admin ne true }">
		<button class="btn btn-outline-primary" onclick="location.href='/qna/write'">문의하기</button>
		<button class="btn btn-outline-primary" onclick="location.href='/qna/newlist'">목록</button>
	</c:if>
	<c:if test="${checkId}">
		<button class="btn btn-outline-primary" onclick="location.href='/qna/update?qnaidx=${qna.getQna_idx()}'">질문 수정</button>
		<button class="btn btn-outline-primary" onclick="location.href='/qna/delete?qnaidx=${qna.getQna_idx()}'">질문 삭제</button>
	</c:if>
</c:if>	
</div>
</div>
<br><br>
	


<script>
	$('#summernote').summernote({
		height: 300,
	  	minHeight: null,
	  	maxHeight: null,
	  	focus: true,
	  	lang: 'ko-KR', // default: 'en-US'
	  	toolbar: [
	  	    // [groupName, [list of button]]
	  	    ['style', ['bold', 'italic', 'underline', 'clear']],
	  	    ['font', ['strikethrough', 'superscript', 'subscript']],
	  	    ['fontsize', ['fontsize']],
	  	    ['color', ['color']],
	  	    ['para', ['ul', 'ol', 'paragraph']],
	  	    ['height', ['height']]
	  	  	['insert', ['link']]
	  	  ]
	});
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>