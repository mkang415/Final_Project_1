<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

table {
	width: 80%
}
</style>

<script type="text/javascript">
//댓글 입력
function fn_comment(){
		
	$.ajax({
		type:'POST',
		url : "/reply/insert",
		data:$("#commentForm").serialize(),
		success : function(data){
		if(data=="success")
			{
				getCommentList();
				$("#reply").val("");
			}
		},
		error:function(request,status,error){
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(function(){
	console.log("function");
    getCommentList();
    
});

function getCommentList(){
    console.log("getCommentList");
    $.ajax({
        type:'POST',
        url : "/reply/list",
        dataType : "html",
        data:$("#comment").serialize(),
        success : function(data){
        	console.log("success");
            $("#commentList").html(data);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
</script>

</head>
<body>
<div class="container">
	<div class="container">
        	<div id="commentList"></div>
	</div>
    <form id="commentForm" name="commentForm" method="post">
    <input type="hidden" name="board_idx" value="${freeView.getBoard_idx()}">
    <br><br>
    <div>
        <span><strong>Comments</strong></span> <span id="cCnt"></span>
        <div>
        	<table class="table">                    
            	<tr>
                	<td>
                    	<textarea id="summernote" style="width: 800px" rows="3" cols="30" name="reply"></textarea>
                    	<br>
                    	<div>
                        	<a href='#' onClick="fn_comment()" class="btn pull-right btn-success">등록</a>
                    	</div>
                	</td>
				</tr>
			</table>
		</div>
	</div>      
    </form>
</div>
<form id="comment" method="post">
<input type="hidden" name="board_idx" value="${freeView.getBoard_idx()}">
</form>
<script>
	$('#summernote').summernote({
		height: 100,
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
 
</body>
</html>
