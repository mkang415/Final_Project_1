<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.2.4.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//글쓰기 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/notice/write";
	});

});

</script>
<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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




table, th {
	text-align: center;
}

.container {
	border-left : 1px solid #eee;
	border-right : 1px solid #eee;
}
#btnWrite {
width: 100px;
height: 40px;
background: #474e60;
font-size: 13px;
color: #fff;
border: solid 2px;
border-radius: 1px;
}
 
</style>

</head>
<body>

<h1>공지사항</h1>


<hr>

<c:if test="${login }">
<div id="btnBox" >
	<button style="float: right;" id="btnWrite">글쓰기</button>
</div>
</c:if>
<table class="table table-hover table-condensed" style="margin-top:200px; margin-left:240px;
 width:1200px;">

<thead style="background: #337AB7; color: white;" >
	<tr>
		<th style="width: 10%;">번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 20%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="i">
	<tr>
		<td>${i.notice_idx }</td>
		<td><a href="/notice/view?notice_idx=${i.notice_idx }">${i.title }</a></td>
		<td>${i.notice_idx }</td>
		<td>${i.hit }</td>
	<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>

	</tr>
</c:forEach>
</tbody>

</table>

<c:import url="/WEB-INF/views/layout/NoticePaging.jsp" />

</body>
</html>