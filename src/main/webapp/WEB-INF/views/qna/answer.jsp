<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function fn_answer(code){
	
	$.ajax({
		type:'POST',
		url : "/qna/answer",
		data:$("#insertAnswer").serialize(),
		success : function(data){
		if(data=="success")
			{
				getAnswer();
				$("#summernote");
			}
		},
		error:function(request,status,error){
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(function(){
    
    getAnswer();
    
});

function getAnswer(){
    
    $.ajax({
        type:'GET',
        url : "/qna/answer",
        dataType : "html",
        data:$("#insertAnswer").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){            
			console.info(data);
            $("#AnswerArea").html(data);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
</script>

</head>
<body>
<div id="AnswerArea"></div>


<form id="insertAnswer" name="insertAnswer" method=post>
		<input type="hidden" name="qna_idx" value="${qna.qna_idx}">
		<c:if test="${admin}">
		<div>
			<textarea id="summernote" name="answer">${qna.answer}</textarea>
		</div>
		<div>
			<a href='#' onClick="fn_answer()" class="btn pull-right btn-success">작성</a>
			<button type="button" onclick="location.href='/qna/newlist'">취소</button>
			<button type="button" onclick="location.href='/qna/delete?qnaidx=${qna.getQna_idx()}'">질문 삭제</button>
		</div>
		</c:if>
	</form>

</body>
</html>