<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<style>
#update {
align : "center";
}


</style>

<div id="update" align="center">
<br>
<h3 style="text-align:center">▷ 일정 수정하기 ◁</h3>
<br>
<form action="/schedule/calupdate" method="post">

	<table class="table table-bordered" style="width: 80%">
<col width="150"><col width="500">

<tr>
	<td style="text-align : center;"  class="table-warning">
	<label for="title">제목</label></td>
	<td colspan="3"><input type="text" id="title" style="width: 100%; height: 100%; padding: 10px; " name="title" value="${detail.title }"/></td>
</tr>

<tr>
<td style="text-align : center;" class="table-warning">
<label>일정</label></td>
<td style="text-align : center;">
${detail.rdate}</td>

<td style="text-align : center;" class="table-warning">
<label>작성일</label></td>
<td style="text-align : center;"><fmt:formatDate value="${detail.wdate}" pattern="yyyy-MM-dd"/></td>
</tr>

<tr>
	<td  colspan="4"><textarea rows="20" cols="100%" id="summernote" name="content" style="text-align:left" >${detail.content }</textarea></td>
</tr>


</table>
<br>

<a href="/schedule/calendar"><button class="btn btn-default">목록</button></a>


<c:if test="${detail.member_idx eq detail.member_idx}">
		<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }">
		<button class="btn btn-primary">저장</button></a>

</c:if>
</form>
</div>

<script type="text/javascript">


$(document).ready(function() {

    $('#summernote').summernote({

height : 300, // 에디터의 높이 

minHeight : null,

maxHeight : null,

focus : true,

lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경

    });

});
var postForm = function() {

    var contents =  $('textarea[name="content"]').html($('#summernote').code());
}
</script>