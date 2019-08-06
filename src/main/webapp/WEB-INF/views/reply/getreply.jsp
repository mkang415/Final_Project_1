<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div>
	<div>
	<table class='table'>
	<c:forEach items="${replylist}" var = "r" varStatus="st">
		<tr>
			<th>${r.NICKNAME}</th>
			<th><fmt:formatDate value="${r.WRITTENDATE}" pattern="yyyy-MM-dd HH:mm:SS" /></th>
			<th>
				
				<c:if test="${r.MEMBER_IDX==member_idx }">
				<div id="rebtn${r.REPLY_IDX}">
				<button type="button" onclick="showUpdate('reply${r.REPLY_IDX}', 'update${r.REPLY_IDX}', 'rebtn${r.REPLY_IDX}', 'upbtn${r.REPLY_IDX}')">댓글수정</button>
				<button type="button" onclick="location.href='/reply/delete?reidx=${r.REPLY_IDX}'">댓글삭제</button>
				</div>
				
				<div id="upbtn${r.REPLY_IDX}" style="display: none">
				<button type="button" onclick="up_comment()">수정</button>
				<button type="button" onclick="showReply('reply${r.REPLY_IDX}', 'update${r.REPLY_IDX}', 'rebtn${r.REPLY_IDX}', 'upbtn${r.REPLY_IDX}')">취소</button>
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
					<textarea id="summernote" style="width: 800px" rows="3" cols="30" name="reply">${r.REPLY}</textarea>
					</form>
				</div>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</div>


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
	
	function showUpdate(reply, update, replybtn, updatebtn) {
		document.getElementById(reply).style.display="none";
		document.getElementById(update).style.display="block";
		document.getElementById(replybtn).style.display="none";
		document.getElementById(updatebtn).style.display="block";
	}
	
	function showReply(reply, update, replybtn, updatebtn) {
		document.getElementById(reply).style.display="block";
		document.getElementById(update).style.display="none";
		document.getElementById(replybtn).style.display="block";
		document.getElementById(updatebtn).style.display="none";
	}
</script>