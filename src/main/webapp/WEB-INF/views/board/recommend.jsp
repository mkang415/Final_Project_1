<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<ul class="list-group list-group-horizontal">
  <li class="list-group-item align-items-center">
  	<c:if test="${login}">
  	<c:if test="${result}">
		<button class="btn btn-danger" onclick="unreco()">취소</button>
	</c:if>
	<c:if test="${result ne true}">
		<button class="btn btn-success" onclick="reco()">추천</button>
	</c:if>
	</c:if>
  </li>
  <li class="list-group-item">
  	<h6>추천 : ${recocnt}</h6>
  </li>
  <li class="list-group-item">
  	<c:if test="${login}">
		<c:if test="${checkId ne true}">
			<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#ModalWrite">신고</button>
		</c:if>
	</c:if>
  </li>
</ul>

<!-- Modal -->
<div class="modal fade" id="ModalWrite" tabindex="-1" role="dialog" aria-labelledby="ModalWrite" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document">
    	<div class="modal-content">
    		<form action="/report/boardreport" method = "post">
      		<div class="modal-header">
      			신고 내용을 입력해주세요.
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true">&times;</span>
        	</button>
      		</div>
    		<div class="modal-body">
        		<textarea style="width: 94%; height: 300px" id="summernote" name="content" placeholder="신고 내용 입력"></textarea>
      		</div>
      		<div class="modal-footer">
      			<button type="submit" class="btn btn-danger">신고</button>      		
      		</div>
      		</form>
		</div>
  	</div>
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
</script>