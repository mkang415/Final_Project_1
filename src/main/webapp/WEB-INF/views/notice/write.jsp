<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.2.4.js"></script>
<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!-- summer note korean language pack -->
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">

$(document).ready(function(){

	$('#summernote').summernote({
		height: 300,          // 기본 높이값
	    minHeight: null,      // 최소 높이값(null은 제한 없음)
	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
	    focus: true,          // 페이지가 열릴때 포커스를 지정함
	    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
	});
	
	
	$("#btnSubmit").click(function() {
		
		$("form").submit();
		
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	

	
})



</script>

</head>
<body>
<h1>글쓰기 폼</h1>
<hr>

<div class="container">
<div>
<form action="/notice/write" method="post" enctype="multipart/form-data">
<table class="table table-bordered">
<tr><td class="info">아이디</td><td>${member.email }</td></tr>
<tr><td class="info">닉네임</td><td>${member.nickname }</td></tr>
<tr><td class="info">제목</td><td><input type="text" name="title" style="width:100%"/></td></tr>
<tr><td class="info" colspan="2">본문</td></tr>
<tr><td colspan="2"><textarea id="summernote" name="content" rows="10" cols="100"></textarea></td></tr>
</table>

<label>첨부파일 : <input type="file" name="file" /></label>

</form>
</div>

<div class="text-center">	
	<button type="button" id="btnSubmit">작성</button>
	<button type="button" id="btnCancel"><a href="/notice/list">취소</a></button>
</div>
</div>


</body>
</html>