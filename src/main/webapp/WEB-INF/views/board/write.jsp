<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- summernote -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<% int selBoard = (int)request.getAttribute("selBoard"); %>
</head>
<body>
<h1>게시글 작성 페이지</h1>
<hr>

<form action = "/board/write" method = "post">



<!-- form 태그 영역 감싸기 -->
<fieldset>

<!-- fieldset 설명 -->
<legend>글 작성</legend>

<table>
<!-- 전달 파라미터, 전송할 데이터 -->
<tr>
	<td>게시판</td>
	<td>
		<select name="divide">
			<option value="1"<% if(selBoard == 1){ %>selected<% } %>>자유게시판</option>
			<option value="2"<% if(selBoard == 2){ %>selected<% } %>>후기게시판</option>
			<option value="3"<% if(selBoard == 3){ %>selected<% } %>>사진게시판</option>
		</select>
	</td>
</tr>
<tr>
	<td style="width: 10%"><label for="title">제목</label></td>
	<td style="width: 90%"><input type="text" style="width: 94%" id="title" name = "title" placeholder="제목 입력"/></td>
</tr>

<tr>
	<td>내용</td>
	<td><textarea id="summernote" name="content"></textarea></td>
</tr>

<!-- <form>데이터 전송(Submit) 버튼 -->
<tr>
	<td></td>
	<td><input type="submit" value="작성"/>
		<input type="reset" value="취소"/></td>
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
	  	lang: 'ko-KR' // default: 'en-US'
	});
	
</script>

</body>
</html>