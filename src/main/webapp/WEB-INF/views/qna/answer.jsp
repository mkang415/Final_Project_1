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
<div id="AnswerArea" style="width: 1000px; margin: auto;"></div>

<div style="width: 1000px; margin: auto;">
<form id="insertAnswer" name="insertAnswer" action = "/qna/answer" method=post>
		<input type="hidden" name="qna_idx" value="${qna.qna_idx}">
		<c:if test="${admin}">
		<div>
			<textarea id="summernote" name="answer">${qna.answer}</textarea>
		</div>
		<br>
		<div>
			<button type="submit" onClick="fn_answer()" class="btn btn-outline-success">작성</button>
			<button type="button" class="btn btn-outline-danger" onclick="location.href='/qna/newlist'">취소</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/qna/delete?qnaidx=${qna.getQna_idx()}'">질문 삭제</button>
		</div>
		</c:if>
	</form>
</div>
</body>
</html>