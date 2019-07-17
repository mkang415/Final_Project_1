<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#DiaryWrite</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<style type="text/css">

.wrapper {
	align:center;
}



</style>

</head>
<body>

<h1 style="text-align:center">Diary Write</h1>
<hr>
<div class="wrapper">
<form action="/diary/write" method="post">
	<textarea id="title" name="title"></textarea>
	<textarea id="summernote" name="content"></textarea>
	
	<button>작성</button> <button type="button" onClick="history.go(-1)">취소</button>
</form>

</div>

<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote();
});
</script>
</body>
</html>