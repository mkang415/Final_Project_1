<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 


     <!-- Bootstrap 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->



<script type="text/javascript">

$(document).ready(function() {
	//글쓰기 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/notice/write";
	});
	
	$("#btnSearch").click(function() {
		location.href="/notice/list?select=" +$("#select").val()+"&search="+$("#search").val();
	});

	$("#chatting").click(function() {
		location.href="/notice/chatting";
	});


});

</script>



<style type="text/css">

table, th {
	text-align: center;
	
}



/* 글쓰기 버튼 위치 설정 */
#pagingBox {
	position: relative;
}
#btnBox {
	top: 0;
	bottom: 0;
	
	
	margin-left: 1050px;
}


tr {height: 40px;  }

td {padding-top: 10px;}



/* .container { */
/* 	border-left : 1px solid #eee; */
/* 	border-right : 1px solid #eee; */
/* } */
#btnWrite {
width: 100px;
height: 40px;
background: #474e60;
font-size: 13px;
color: #fff;
border: solid 2px;
border-radius: 1px;
}

#btnSearch {
position: relative; 
right:30px;

}
 
 
#chatting {
width: 100px;
height: 40px;
background: #474e60;
font-size: 13px;
color: #fff;
border: solid 2px;
border-radius: 1px;
} 
</style>





<c:if test="${login }">
<div id="btnBox" >
	<button style="position: absolute; float:right; left:1340px; top:230px;" id="btnWrite">글쓰기</button>
</div>
</c:if>
<div id="btnBox" >
	<button style="position: absolute; float:right; left:1340px; top:290px;" id="chatting">1대1 채팅</button>
</div>

<table class="table table-hover table-condensed" style="margin-top:300px; margin-left:240px;
 width:1200px;">

<thead style="background: #337AB7; color: white;" >
	<tr style="height: 50px;">
		<th style="width: 10%; padding-bottom: 13px;"></th>
		<th style="width: 45%; padding-bottom: 13px;">제목</th>
		<th style="width: 15%; padding-bottom: 13px;">작성자</th>
		<th style="width: 10%; padding-bottom: 13px;">조회수</th>
		<th style="width: 20%; padding-bottom: 13px;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="i">
	<tr>
		<td>${i.notice_idx }</td>
		<td><a href="/notice/view?notice_idx=${i.notice_idx }">${i.title }</a></td>
		<td>${i.writer }</td>
		<td>${i.hit }</td>
	<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>

	</tr>
</c:forEach>
</tbody>

</table>

<c:import url="/WEB-INF/views/layout/NoticePaging.jsp" />

<div class="form-inline text-center" style="margin-bottom:200px; position:relative; left:630px;">
<select class="custom-select" name="select" id="select">
	<option value="title" selected>제목</option>
	<option value="content">내용</option>
</select>
	<div class="col-2">
	<input class="form-control" type="text" id="search" />
	</div>
	
	<input type="button" id="btnSearch" class="btn btn-primary" value="검색"/>
<!-- 	<button id="btnSearch" class="btn">검색</button> -->
	
</div> 

<


<c:import url="/WEB-INF/views/layout/footer.jsp"/>

