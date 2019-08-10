<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 
<!-- summernnote -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>


<style>
#update {
align : "center";
}

#background {
background-image : url('/resources/img/back4.jpg');
position:relative;
width:100%;
height:130%;
background-size: cover;
background-position: center center;

}

.table-bordered td{
 border:1px solid black;
}

.table-bordered th{
 border:1px solid black;
}

.table td, .table th {
    padding: 0.2rem;
}
</style>

<div id="background">

<div id="update" align="center">
<br>
<h3 style="text-align:center">▷ 일정 수정하기 ◁</h3>
<br>
<form action="/schedule/calupdate" method="post">

<table class="table table-bordered" style="width: 80%; table-layout:fixed;">
<col width="100"><col width="500">

<tr>
	<th style="text-align : center;" class="table-active">
	<label for="title">제목</label></th>
	<td colspan="3">
	<input type="text" id="title" style="width: 100%; height: 100%; padding: 7px;" name="title" value="${detail.title }"/></td>
</tr>

<tr>
<th style="text-align : center;" class="table-active"><label>일정</label></th>
<td style="text-align : center;">${detail.rdate}</td>

<th style="text-align : center;" class="table-active" ><label>작성일</label></th>
<td style="text-align : center;"><fmt:formatDate value="${detail.wdate}" pattern="yyyy-MM-dd"/></td>
</tr>

<tr>
	<td colspan="4">
	<textarea rows="15" cols="163" name="content" id="summernote" style="text-align:left" 
	 >${detail.content }</textarea>
	</td>
</tr>


</table>
<br>

<a href="/schedule/calendar"><button class="btn btn-warning">목록</button></a>


<c:if test="${detail.member_idx eq detail.member_idx}">
		<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }">
		<button class="btn btn-primary">저장</button></a>

</c:if>
</form>
<br><br>
</div>
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
};
</script>
<c:import url="/WEB-INF/views/layout/footer.jsp"/> 