<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
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
$(document).ready(function() {
	//댓글 입력
	$("#btnReplyInsert").click(function(){
		
		console.log($("#replyWriter").val());
		
		$form=$("<form>").attr({
			action:"/reply/insert",
			method: "post"
		}).append(
				$("<input>").attr({
					type:"hidden",
					name:"boardno",
					value:"${freeView.board_idx}"
				})
				
		).append (
				$("<input>").attr({
					type:"hidden",
					name:"nickname",
					value:"${nickname}"
				})
		
		).append(
				$("<textarea>").attr("name","recontent")
				.css("display","none").text($("#reContent").val()) //입력칸에 퍼렇게 색 뜸
				);
		
		$(document.body).append($form);
		$form.submit();
	});
	
	//댓글삭제
	function deleteReply(replyno) {
		$.ajax({
			type: "post"
			,url:"/reply/delete"
			,dataType: "json"
			, data: {
				replyno: replyno
			}
		,success: function(data){
			if(data.success) {
				$("[data-replyno='"+replyno+"']").remove();
			} else {
				alert("댓글 삭제를 실패하였습니다.");
			}
		}
		
		, error: function() {
			console.log("error");
		}
		});
	}
	
});
</script>
</head>
<body>
<h1>자유 게시판 게시글</h1>
<hr>
<div>
<table class="table table-striped table hover table-condensed">
<tr>
	<td colspan="3"><h3>${freeView.getTitle()}</h3></td>
</tr>

<tr>
	<td>${freeView.getNickname()}</td>
	<td><fmt:formatDate value="${freeView.getWrittendate()}" pattern="yyyy-MM-dd HH:mm" /></td>
	<td>${freeView.getHit()}</td>
</tr>
<tr><td> </td></tr>
<tr>
	<td colspan="3">${freeView.getContent()}
</tr>
</table>
</div>
<div>
<hr>
<div>
<!-- 댓글 리스트 -->
<table class="table table-striped table-hover table-condensed table-bordered table-fixed
" id="replylist">
<thead>
<tr>
	<th style="width: 5%;">번호</th>
	<th style="width: 10%;">닉네임</th>
	<th style="width: 65%;">댓글</th>
	<th style="width: 15%;">작성일</th>
	<th style="width: 5%;">삭제</th>
</tr>
</thead>

<tbody id="replyBody">

<c:forEach items="${replyList }" var="reply">

<tr data-replyno="${reply.replyno }">

	<td>${reply.rnum }</td>
	<td><img src="/logo/semi_default.png" width="20px" height="20px"/>${reply.nickname }</td>
	<td>${reply.recontent }</td>
	<td><fmt:formatDate value="${reply.insertdate }" /></td>
	
	<td>	<c:if test="${sessionScope.nickname eq reply.nickname}">
		<button class="btn btn-danger btn-sm" onclick="deleteReply(${reply.replyno });">삭제</button>
		</c:if>
	</td>
</tr>

</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->
</div>

<c:if test="${login}">
<!-- 댓글입력 -->
<div class="form-inline text-center"  id="reply">

	<input type="text" size="10" class="form-control" id="replyWriter" value="${sessionScope.nickname }" readonly="readonly"/>
	<textarea rows="2" cols="100" class="form-control" id="reContent" ></textarea>
	<button id="btnReplyInsert" class="btn btn-warning" >입력</button>
</div>	<!-- 댓글 입력 end -->
</c:if>
</div>
<c:if test="${login }">
<button type="button" onclick="location.href='/board/write?divide=1'">글쓰기</button>
	<c:if test="${checkId }">
		<button type="button" onclick="location.href='/board/update?brdidx=${freeView.getBoard_idx()}'">글수정</button>
		<button type="button" onclick="location.href='/board/delete?brdidx=${freeView.getBoard_idx()}&divide=${freeView.divide }'">글삭제</button>
	</c:if>
</c:if>
<button onclick="location.href='/board/freelist'">목록</button>
</body>
</html>