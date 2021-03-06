<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    

 

<!-- Bootstrap 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/notice/list");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/notice/update?notice_idx=${notice.notice_idx }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		$(location).attr("href", "/notice/delete?notice_idx=${notice.notice_idx }");
	});

	
	
	
	
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		// 게시글 번호.... ${board.board_no }
// 		console.log($("#commentWriter").val());
// 		console.log($("#commentContent").val());
		
		$form = $("<form>").attr({
			action: "/noticeReply/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"replying",
				value: "1"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"notice_idx",
				value:"${notice.notice_idx }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"member_idx",
				value:"${sessionScope.member_idx }"		
			})
		).append(
			$("<textarea>")
				.attr("name", "reply")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
	});
	
	




});
//ready function()


//답글 창 출력
function ReplyComment(commentNo, commentWriter) {

	 $.ajax({
		type: "get"
		, url: "/noticeReplyTo"
		, dataType: "html"
		, data: {
			step: commentNo,
			writer: commentWriter
			}
		, success: function(res){
			console.log(res);
			$("#replyForm").html(res);
		}
		, error: function(e) {
			console.log("error");
			console.log(e);
		}
		
	});	
	
}

//답글 입력 
function insertReply() {
	
	$form = $("<form>").attr({
		action: "/noticeReply/insert",
		method: "post"
	}).append(
		$("<input>").attr({
			type:"hidden",
			name:"step",
			value:$("#step").val()
		})
	).append(
		$("<input>").attr({
			type:"hidden",
			name:"replying",
			value:"2"
		})
	).append(
		$("<input>").attr({
			type:"hidden",
			name:"notice_idx",
			value:"${notice.notice_idx }"
			})
	).append(
		$("<input>").attr({
			type:"hidden",
			name:"member_idx",
			value:"${sessionScope.member_idx }"		
			})
	).append(
		$("<textarea>")
			.attr("name", "reply")
			.css("display", "none")
			.text($("#commentContent").val())
	);
	$(document.body).append($form);
	$form.submit();
	
	
	
}





//댓글 삭제
function deleteComment(commentNo) {
	$.ajax({
		type: "post"
		, url: "/noticeReply/delete"
		, dataType: "json"
		, data: {
			reply_idx: commentNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
	
	
	

</script>
<style type="text/css">

#next > a{

font-size:16px;
}

#back > a{
font-size:16px;
}

#page{
margin-left: 50px;
margin-right:50px;
width:1200px;
margin-top: 50px;

}

.total {
	margin-top: 100px;
	width : 1100px;
	margin-bottom: 300px;
	margin-left:290px;
}
.sumnail{
	
	
	margin : 50px;
	width: 40%;
	float : left;
	position : relative; 
}

.info {
	margin : 80px;
	font-size : 16px;
}

.notice {
	font-size : 18px;
	margin-bottom: 400px;
}

.filedown{
	position:relative;
	font-size:12px;
	left:870px;
}
#btnList {
width: 80px;
height: 40px;
background: #474e60;
font-size: 13px;
color: #fff;
border: solid 2px;
border-radius: 1px;
}
#btnUpdate{
	width: 80px;
	height: 40px;
	background: #1ec0ff;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
#btnDelete{
	width: 80px;
	height: 40px;
	background: #f1404b;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
</style>





<div class="total">


<h1 class="pull-left">${notice.title }</h1><br><br><br><br>
<h6 class="pull-left">작성일 : <fmt:formatDate value="${notice.writtendate }" pattern="yyyy-MM-dd" /></h6>
<h6 class="pull-left"> 작성자 : ${notice.writer}  </h6>
<h6 class="pull-left"> 조회수 : ${notice.hit }  </h6>
<div class="text-right">	
	<button id="btnList">목록</button>

	<button id="btnUpdate">수정</button>
	<button id="btnDelete">삭제</button>

</div>
<hr>

<div class="filedown">
첨부파일 : <a href="/file/download?fileno=${noticeFile.fileno }">${noticeFile.origin_name }</a>
</div>

<div class = "notice">
${notice.content }
</div>

<hr style="margin-bottom:300px;">

<!-- 댓글 처리 -->
<div>


<!-- 댓글 리스트 -->
<table class="table">
<thead class="thead-dark">
<tr>

	<th>작성자</th>
	<th>댓글</th>
	<th>작성일</th>
	<th></th>
	<th></th>

</tr>
</thead>
<tbody>
<c:forEach items="${commentList }" var="comment">
<tr data-commentno="${comment.reply_idx }">
	<c:if test="${comment.replyto eq 2 }">
	<td style="padding-left:50px;">${comment.writer }</td>
	</c:if>
	
	<c:if test="${comment.replyto eq 1 }">
	<td style=>${comment.writer }</td>
	</c:if>

	<c:if test="${comment.replyto eq 2 }">
	<td style="padding-left:50px;">${comment.reply }</td>
	</c:if>

	<c:if test="${comment.replyto eq 1 }">
	<td>${comment.reply }</td>
	</c:if>
	
	<c:if test="${comment.replyto eq 2 }">
	<td style="padding-left:50px;">
		<fmt:formatDate value="${comment.writtendate }"
			pattern="yy-MM-dd hh:mm:ss" />
	</td>
	</c:if>
	
	<c:if test="${comment.replyto eq 1 }">
	<td>
		<fmt:formatDate value="${comment.writtendate }"
			pattern="yy-MM-dd hh:mm:ss" />
	</td>
	</c:if>
	
	<td style="width:72px; padding-right:0;" >
		<c:if test="${sessionScope.nick eq comment.writer }">
		<button class="btn btn-outline-dark"
			onclick="deleteComment(${comment.reply_idx });">삭제</button>
		</c:if>
	</td>
	
	<td style="width:97px;">
		<button class="btn btn-outline-dark" onclick="ReplyComment(${comment.step}, '${comment.writer }');">답글</button>
	</td>
	
</tr>

<div id="replyForm"></div>

</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->


<!-- 댓글 입력 -->
<c:if test="${login }" >
<div class="form-inline text-center" style="margin-bottom: 30px; margin-top:100px; margin-left:230px;">
	<input type="text" size="7" class="form-control"
		id="commentWriter"
		value="${sessionScope.nick }" readonly="readonly"/>
	<textarea rows="2" cols="60"
		class="form-control" aria-label="With textarea" id="commentContent"></textarea>
	<button id="btnCommInsert" class="btn btn-outline-dark" style="margin-left:20px;">입력</button>
</div>	<!-- 댓글 입력 end -->
</c:if>

</div>	<!-- 댓글 처리 end -->

</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>
