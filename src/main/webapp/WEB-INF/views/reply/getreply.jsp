<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div style="width : 900px; margin: auto;">
	<div>
	<span><strong>댓글</strong></span>
	<table class='table'>
	<c:forEach items="${replylist}" var = "r" varStatus="st">
		<tr>
			<th style="width: 30%">${r.NICKNAME}</th>
			<th style="width: 45%"><fmt:formatDate value="${r.WRITTENDATE}" pattern="yyyy-MM-dd HH:mm:SS" /></th>
			<th style="width: 25%">
				
				<c:if test="${r.MEMBER_IDX==member_idx }">
				<div id="rebtn${r.REPLY_IDX}" style="float: right;">
				<button type="button" class="btn btn-outline-primary" onclick="showUpdate('reply${r.REPLY_IDX}', 'update${r.REPLY_IDX}', 'rebtn${r.REPLY_IDX}', 'upbtn${r.REPLY_IDX}', 'writecmt')">수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='/reply/delete?reidx=${r.REPLY_IDX}'">삭제</button>
				</div>
				
				<div id="upbtn${r.REPLY_IDX}" style="float: right; display: none;">
				<button type="button" class="btn btn-outline-success" onclick="up_comment()">수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="showReply('reply${r.REPLY_IDX}', 'update${r.REPLY_IDX}', 'rebtn${r.REPLY_IDX}', 'upbtn${r.REPLY_IDX}', 'writecmt')">취소</button>
				</div>
				</c:if>
			</th>
		</tr>
		<tr>
			<td colspan="3">
				<div id="reply${r.REPLY_IDX}">${r.REPLY}</div>
				<div id="update${r.REPLY_IDX}"style="display: none">
					<form id="updateForm" name="fupdateForm" method="post">
					<input type="hidden" name="reply_idx" value="${r.REPLY_IDX}">
					<textarea id="summernote1" style="width: 800px" rows="3" cols="30" name="reply">${r.REPLY}</textarea>
					</form>
				</div>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</div>


<script>
	$('#summernote1').summernote({
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
	
	function showUpdate(reply, update, replybtn, updatebtn, writecmt) {
		document.getElementById(reply).style.display="none";
		document.getElementById(update).style.display="block";
		document.getElementById(replybtn).style.display="none";
		document.getElementById(updatebtn).style.display="block";
		document.getElementById(writecmt).style.display="none";
	}
	
	function showReply(reply, update, replybtn, updatebtn, writecmt) {
		document.getElementById(reply).style.display="block";
		document.getElementById(update).style.display="none";
		document.getElementById(replybtn).style.display="block";
		document.getElementById(updatebtn).style.display="none";
		document.getElementById(writecmt).style.display="block";
	}
	
	function up_comment(){
		
		$.ajax({
			type:'POST',
			url : "/reply/update",
			data:$("#updateForm").serialize(),
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
</script>