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


<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/board/freelist?search="+$("#search").val();
	});
});
</script>

</head>
<body>

<h1>메모 페이지</h1>
<hr>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalWrite">
  	메모 작성
</button>

<!-- Modal -->
<div class="modal fade" id="ModalWrite" tabindex="-1" role="dialog" aria-labelledby="ModalWrite" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document">
    	<div class="modal-content">
    		<form action="/memo/write" method = "post">
      		<div class="modal-header">
      		<input type="text" style="width: 94%" id="title" name = "title" placeholder="제목 입력"/>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true">&times;</span>
        	</button>
      		</div>
    		<div class="modal-body">
        		<textarea style="width: 94%; height: 300px" id="summernote" name="memo" placeholder="메모 내용 입력"></textarea>
      		</div>
      		<div class="modal-footer">
      			<button type="submit" class="btn btn-primary">작성</button>      		
      		</div>
      		</form>
		</div>
  	</div>
</div>

<br>
<div id="memoList">

</div>
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
	  	    ['font', ['strikethrough']],
	  	    ['color', ['color']],
	  	    ['para', ['ul', 'ol', 'paragraph']],
	  	    ['height', ['height']],
	  	  	['insert', ['link']]
	  	  ]
	});

	function unmark(memoidx){
		$.ajax({
			type : 'GET',
			url : '/memo/unmark',
			data : {'memoidx' : memoidx },
			success : function() {
				getMemoList();
			}
		});
	}
	
	function mark(memoidx){
		$.ajax({
			type : 'GET',
			url : '/memo/mark',
			data : {'memoidx' : memoidx },
			success : function() {
				getMemoList();
			}
		});
	}
	
	$(function(){
		getMemoList();
	});
	
	function getMemoList(){
		$.ajax({
			type: 'GET',
			url : "/memo/getview",
			dataType : "html",
			data : { },
			success: function(data){
				$("#memoList").html(data);
			}
		})
	}
	
	function deleteMemo(memoidx){
		$.ajax({
			type : 'GET',
			url : '/memo/delete',
			data : {'memoidx' : memoidx },
			success : function(data) {
				getMemoList();
				
			}
		});
	}
	
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>