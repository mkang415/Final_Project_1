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
<button>작성</button>
</form>
</div>

<div class="text-center">	
<!-- 	<button type="button" id="btnWrite">작성</button> -->
	<button type="button" id="btnCancel"><a href="/notice/list">취소</a></button>
</div>
</div>


</body>
</html>