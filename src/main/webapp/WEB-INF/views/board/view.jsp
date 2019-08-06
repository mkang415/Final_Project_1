<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- summernote -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>



<% Boolean result = (Boolean)request.getAttribute("result"); %>

<script type="text/javascript">
/* $(document).ready(function() {
	
	//	추천버튼 초기화
	if(${result==true}) {
		$("#btnRecommend")
			.toggleClass("btn-danger")
			.text("추천 취소");
	}else{
		$("btnRecommend")
			.toggleClass("btn-primary")
			.text("추천");
	}
	
	//	추천 수행
	$("#btnRecommend").click(function(){
		$.ajax({
			type: "get",
			url: "/board/recommend",
			dataType: "json",
			data: {
				member_idx: '${sessionScope.member_idx}',
				board_idx: '${freeView.getBoard_idx()}'
			},
			success: function(data) {
				console.log(data);
				if(data.result) {
					$("#btnRecommend")
						.text("추천 취소")
						.toggleClass("btn-primary")
						.toggleClass("btn-danger");
				} else {
					$("#btnRecommend")
						.text("추천")
						.toggleClass("btn-danger")
						.toggleClass("btn-primary");
				}
				$("#recommend").text(data.recommend);
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	});
}); */
</script>

<style type="text/css">

table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

table {
	width: 80%
}
</style>

</head>
<body>
<c:choose>
	<c:when test="${freeView.getDivide() eq 1}">자유 게시판</c:when>
	<c:when test="${freeView.getDivide() eq 2}">후기 게시판</c:when>
	<c:when test="${freeView.getDivide() eq 3}">사진 게시판</c:when>
</c:choose>
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
<tr>
	<td colspan="3">${freeView.getContent()}
</tr>
<tr>
	<td>
		<c:if test="${login}">
			<c:if test="${checkId ne true}">
				<button id="btnRecommend" class="btn pull-right">추천</button>
			</c:if>
		</c:if>
	</td>
	<td>추천 : <span id="recommend">${freeView.getRecommend()}</span></td>
	<td>
		<c:if test="${login}">
			<c:if test="${checkId ne true}">
				<button>신고</button>
			</c:if>
		</c:if>
	</td>
</tr>
</table>
</div>

<c:import url="/WEB-INF/views/board/reply.jsp"></c:import>

<c:if test="${login }">
	<c:choose>
		<c:when test="${freeView.getDivide() eq 1}">
			<button type="button" onclick="location.href='/board/write?divide=1'">글쓰기</button>
		</c:when>
		<c:when test="${freeView.getDivide() eq 2}">
			<button type="button" onclick="location.href='/board/write?divide=2'">글쓰기</button>
		</c:when>
		<c:when test="${freeView.getDivide() eq 3}">
			<button type="button" onclick="location.href='/board/write?divide=3'">글쓰기</button>
		</c:when>
	</c:choose>

	<c:if test="${checkId}">
		<button type="button" onclick="location.href='/board/update?brdidx=${freeView.getBoard_idx()}'">글수정</button>
		<button type="button" onclick="location.href='/board/delete?brdidx=${freeView.getBoard_idx()}&divide=${freeView.divide }'">글삭제</button>
	</c:if>
</c:if>

<c:choose>
	<c:when test="${freeView.getDivide() eq 1}">
		<button onclick="location.href='/board/freelist'">목록</button>
	</c:when>
	<c:when test="${freeView.getDivide() eq 2}">
		<button onclick="location.href='/board/epillist'">목록</button>
	</c:when>
	<c:when test="${freeView.getDivide() eq 3}">
		<button onclick="location.href='/board/photolist'">목록</button>
	</c:when>
</c:choose>


</body>
</html>