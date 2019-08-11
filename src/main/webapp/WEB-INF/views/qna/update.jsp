<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- summernote -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
<div style="width: 800px; margin: auto;">
<form action = "/qna/update" method = "post">
<!-- form 태그 영역 감싸기 -->
<fieldset>

<!-- fieldset 설명 -->
<legend>QnA 수정</legend>
<input type="hidden" name="qna_idx" value="${qna.qna_idx}">
<table>
<!-- 전달 파라미터, 전송할 데이터 -->

<tr>
	<td style="width: 10%"><label for="title">제목</label></td>
	<td style="width: 90%"><input type="text" style="width: 94%" id="title" name = "title" value="${qna.title}"/></td>
</tr>

<tr>
	<td>내용</td>
	<td><textarea id="summernote" name="question">${qna.question }</textarea></td>
</tr>

<!-- <form>데이터 전송(Submit) 버튼 -->
<tr>
	<td></td>
	<td>
		<input type="submit" class="btn btn-success" value="수정"/>
		<button type="button" class="btn btn-danger" onclick="location.href='/qna/newlist'">취소</button>	
	</td>
</tr>
</table>

</fieldset>
</form>
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

</body>
</html>