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

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
function fn_comment(code){
		
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
    
    getCommentList();
    
});

function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "/reply/list",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].NICKNAME+"</strong></h6>"
                    html += "<tr><td>"+data[i].REPLY + "</td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
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
    	<form id="commentListForm" name="commentListForm" method="post">
        	<div id="commentList"></div>
   		</form>
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
                    	<textarea style="width: 1100px" rows="3" cols="30" id="reply" name="reply"></textarea>
                    	<br>
                    	<div>
                        	<a href='#' onClick="fn_comment('${freeView.getBoard_idx()}')" class="btn pull-right btn-success">등록</a>
                    	</div>
                	</td>
				</tr>
			</table>
		</div>
	</div>      
    </form>
</div>

 
<script>
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */

 
/**
 * 댓글 불러오기(Ajax)
 */

 
</script>
 
</body>
</html>
