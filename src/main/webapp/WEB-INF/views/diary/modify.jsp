<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#DiaryWrite</title>

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

<style type="text/css">

.wrapper {
	margin-left: 20%;
	margin-right: 20%;
}

#title {
	margin-bottom: 10px;
	border: white;
	width: 100%;
	font-size: 2em;
}

#summernote {
	width: 100%;
	height: 30em;
	margin-bottom: 10px;
}

</style>

</head>
<body>

<h1 style="text-align:center">Diary Modify</h1>
<hr>
<div class="wrapper">


<form action="/diary/modify" method="post">
	<div>
	<input type="text" id="title" name="title" placeholder="Title" value="${modifyDiary.title }"></input>
	<textarea id="summernote" name="content" placeholder="Contents">${modifyDiary.content }</textarea>
	<input type="hidden" name="diary_idx" value="${modifyDiary.diary_idx }"></input>
	</div>

	<div id="btnBox" align="center">
	<button>작성</button> <button type="button" onClick="history.go(-1)">취소</button>
	</div>
	
</form>

</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		height: 500,
		minHeight: null,
		maxHeight: null,
		placeholder: "Content",
		
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
        	url: '/diary/write/fileTemp',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(data) {
        		console.log(data);
//                 var image = $('<img>').attr('src', data);
//                 $('#summernote').summernote("insertNode", image[0]);
          		$(el).summernote('editor.insertImage', data);
          		$("#imageBoard > ul").append('<li><img src="'+data+'" width="480" height="auto"/></li>');
        	}
      	});
    }
});
</script>
</body>
</html>