<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>




<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/schedule/list?search="+$("#search").val();
	});
});


$('.dot').dotdotdot({
	ellipsis: '...',
	watch: true,
	wrap : 'letter',
	height: 10,
	tolerance: 10
});


</script>
<style>
#background {
background-image : url('/resources/img/back4.jpg');
position: absolute;
width:100%;
height:110%;
background-size: cover;
background-position: center center;

}

.table-bordered td{
 border:1px solid #787878;
}

.table-bordered th{
 border:1px solid #787878;
}

.table thead th {
 border:1px solid #787878;
}

#over {
overflow: hidden;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 1; 
-webkit-box-orient: vertical;
word-wrap:break-word; 
height: 30px; 
white-space: nowrap;
}

</style>

<div id="background">
<br>

<div ><h5>&nbsp;&nbsp;&nbsp; 총 일정 리스트 : ${paging.totalCount } 개</h5></div>
<br><br>
<div class="clearfix" align="center">
<table class="table table-Default table-bordered " style="table-layout:fixed;  text-align : center; width: 80%" >

<thead class="thead-dark" >
	<tr  class="table-active">
		<th style="width: 10%; text-align : center;">약속한날짜</th>
		<th style="width: 40%; text-align : center;">제목</th>
		<th style="width: 40%; text-align : center;">내용</th>
		<th style="width: 10%; text-align : center;">작성한날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list2 }" var="i">
	<tr>
		<td>${i.rdate }</td>
		<td><a href="/schedule/caldetail?calendar_idx=${i.calendar_idx}">${i.title }</a></td>
		<td class="dot" >
		<div  id="over">${i.content }</div></td>
		<td><fmt:formatDate value="${i.wdate}" pattern="yyyyMMdd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>

<div class="form-inline text-center" style="margin-left:58%;">
	<input size="50%" class="form-control" type="text" id="search" placeholder="제목만 검색 허용" />
	<button id="btnSearch" class="btn btn-secondary" >검색</button>
</div> 
<br>
<jsp:include page="/WEB-INF/views/layout/schedulePaging.jsp" />


<div id="back" style="text-align:center">
<a href="/schedule/calendar">
<button type="button" class="btn btn-success">
일정관리로 돌아가기</button>
</a>
<br>
</div>
</div>
