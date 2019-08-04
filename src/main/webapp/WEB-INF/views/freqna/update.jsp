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
<h1>자주묻는 질문 수정 페이지</h1>
<hr>
<form action = "/freqna/update" method = "post">
<!-- form 태그 영역 감싸기 -->
<fieldset>

<!-- fieldset 설명 -->
<legend>자주묻는 질문 수정</legend>
<input type="hidden" name="freqna_idx" value="${freqna.freqna_idx}">
<table>
<!-- 전달 파라미터, 전송할 데이터 -->

<tr>
	<td style="width: 10%"><label for="question">질문</label></td>
	<td style="width: 90%"><input type="text" style="width: 94%" id="question" name = "question" value="${freqna.question}"/></td>
</tr>

<tr>
	<td>답변</td>
	<td><textarea id="summernote" name="answer">${freqna.answer }</textarea></td>
</tr>

<!-- <form>데이터 전송(Submit) 버튼 -->
<tr>
	<td></td>
	<td>
		<input type="submit" value="수정"/>
		<button type="button" onclick="location.href='/freqna/list'">취소</button>	
	</td>
</tr>
</table>

</fieldset>
</form>

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