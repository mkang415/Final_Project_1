<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<!-- summernote -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<style type="text/css">

table, th, td {
	border: 1px solid #ccc;
	border-collapse: collapse;
}

table {
	width: 80%
}
</style>
<br>

<div style="width: 1000px; margin: auto;">
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
</table>
<br><br>
<div class="container">
	<div class="row justify-content-md-center">
		<div class="col col-lg-2"></div>
		<div id="reco_area" class="col-md-auto"></div>
		<div class="col col-lg-2"></div>
	</div>
</div>

<br><br>
<c:import url="/WEB-INF/views/board/reply.jsp"></c:import>
</div>
<div style="width: 900px; margin: auto;">
<div class="btn-group" role="group" aria-label="Basic example">
  <c:if test="${login }">
	<c:choose>
		<c:when test="${freeView.getDivide() eq 1}">
			<button type="button" class="btn btn-outline-primary" onclick="location.href='/board/write?divide=1'">글쓰기</button>
		</c:when>
		<c:when test="${freeView.getDivide() eq 2}">
			<button type="button" class="btn btn-outline-primary" onclick="location.href='/board/write?divide=2'">글쓰기</button>
		</c:when>
		<c:when test="${freeView.getDivide() eq 3}">
			<button type="button" class="btn btn-outline-primary" onclick="location.href='/board/write?divide=3'">글쓰기</button>
		</c:when>
	</c:choose>

	<c:if test="${checkId}">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/board/update?brdidx=${freeView.getBoard_idx()}'">글수정</button>
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/board/delete?brdidx=${freeView.getBoard_idx()}&divide=${freeView.divide }'">글삭제</button>
	</c:if>
</c:if>

<c:choose>
	<c:when test="${freeView.getDivide() eq 1}">
		<button class="btn btn-outline-primary" onclick="location.href='/board/freelist'">목록</button>
	</c:when>
	<c:when test="${freeView.getDivide() eq 2}">
		<button class="btn btn-outline-primary" onclick="location.href='/board/epillist'">목록</button>
	</c:when>
	<c:when test="${freeView.getDivide() eq 3}">
		<button class="btn btn-outline-primary" onclick="location.href='/board/photolist'">목록</button>
	</c:when>
</c:choose>
</div>
</div>
<br><br>

<script>

$(function(){
	getRecommend();
});

function getRecommend(){
	$.ajax({
		type: 'POST',
		url : "/board/getreco",
		dataType : "html",
		data:$("#comment").serialize(),
		success: function(data){
			$("#reco_area").html(data);
		}
	});
}

function unreco(){
	$.ajax({
		type : 'POST',
		url : '/board/unreco',
		data : $("#comment").serialize(),
		success : function() {
			getRecommend();
		}
	});
}

function reco(){
	$.ajax({
		type : 'POST',
		url : '/board/reco',
		data : $("#comment").serialize(),
		success : function() {
			getRecommend();
		}
	});
}


</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>