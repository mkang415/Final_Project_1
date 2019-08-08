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

<% Board board = (Board) request.getAttribute("board"); %>
<% int selBoard = board.getDivide(); %>
</head>
<body>
<h1>게시글 작성 페이지</h1>
<hr>
<form id="boardForm" action = "/board/write" method = "post" style="width: 1200px">

<!-- form 태그 영역 감싸기 -->
<fieldset>

<!-- fieldset 설명 -->
<legend>글 작성</legend>

<table>
<!-- 전달 파라미터, 전송할 데이터 -->
<tr>
	<td style="min-width: 50px">게시판</td>
	<td style="min-width: 450px">
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
<tr>
	<td>이미지</td>
	<td>
	<div id="preveal">
	</div>
	</td>
</tr>

<!-- <form>데이터 전송(Submit) 버튼 -->
<tr>
	<td></td>
	<td>
		<input type="submit" value="작성"/>
		<button type="button" onclick="location.href='/board/delimg?divide=${board.getDivide()}'">취소</button>
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
	  	
	  	callbacks: {
	  		onImageUpload: function(files, editor, welEditable) {
	  			for (var i = files.length - 1; i >= 0; i--) {
	         	     sendFile(files[i], this);
	            }
          	}
	  	}

	});
	
	function sendFile(file, el) {
	      var form_data = new FormData();
	      form_data.append('file', file);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: '/upload/image',
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function(url) {

	        	$(el).summernote('editor.insertImage', "\\resources\\boardimg\\"+url);
	        	$('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');

	        	getImage(url);
	        }
	      });
	}
	
	function getImage(url){
		$.ajax({
			type : 'POST',
			url : "/board/getimg",
			dataType : "html",
			data : {"storename" : url},
			success: function(data) {
				console.log(data);
				$('#preveal').append(data);
			}
		});

	}
	
</script>

</body>
</html>