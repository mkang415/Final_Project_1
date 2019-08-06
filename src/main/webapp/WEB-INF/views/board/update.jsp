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
<h1>게시글 작성 페이지</h1>
<hr>

<form action = "/board/update" method = "post">



<!-- form 태그 영역 감싸기 -->
<fieldset>

<!-- fieldset 설명 -->
<legend>글 수정</legend>
<input type="hidden" name="divide" value="${board.divide}">
<input type="hidden" name="board_idx" value="${board.board_idx}">
<table>
<!-- 전달 파라미터, 전송할 데이터 -->
<tr>
	<td>게시판</td>
	<td>
		<c:choose>
			<c:when test="${board.divide==1 }">자유게시판</c:when>
			<c:when test="${board.divide==2 }">후기게시판</c:when>
			<c:when test="${board.divide==3 }">사진게시판</c:when>
		</c:choose>
	</td>
</tr>
<tr>
	<td style="width: 10%"><label for="title">제목</label></td>
	<td style="width: 90%"><input type="text" style="width: 94%" id="title" name = "title" value="${board.title}"/></td>
</tr>

<tr>
	<td>내용</td>
	<td><textarea id="summernote" name="content">${board.content}</textarea></td>
</tr>

<!-- <form>데이터 전송(Submit) 버튼 -->
<tr>
	<td></td>
	<td>
		<input type="submit" value="수정"/>
		<button type="button" onclick="location.href='/board/view?brdidx=${board.board_idx}'">취소</button>
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
	          $(el).summernote('editor.insertImage', url);
	          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
	        }
	      });
	    }

</script>

</body>
</html>