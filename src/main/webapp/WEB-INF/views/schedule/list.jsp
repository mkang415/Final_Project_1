<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/schedule/list?search="+$("#search").val();
	});
});

</script>


<br>
<h4 style="border: 1px;">&nbsp;&nbsp;&nbsp; 총 일정 리스트 : ${paging.totalCount } 개</h4>
<br><br>
<div class="clearfix" align="center">
<table class="table table-striped table-hover" style="table-layout:fixed; text-align : center; width: 80%" >

<thead >
	<tr>
		<th style="width: 40%; text-align : center;">제목</th>
		<th style="width: 40%; text-align : center;">내용</th>
		<th style="width: 10%; text-align : center;">약속한날짜</th>
		<th style="width: 10%; text-align : center;">작성한날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list2 }" var="i">
	<tr>
		<td><a href="/schedule/caldetail?calendar_idx=${i.calendar_idx}">${i.title }</a></td>
		<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${i.content }</td>
		<td>${i.rdate }</td>
		<td><fmt:formatDate value="${i.wdate}" pattern="yyyy-MM-dd"/></td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search"  placeholder="제목만 검색 허용"  />
	<button id="btnSearch" class="btn" >검색</button>
</div> 
<br><br>
<jsp:include page="/WEB-INF/views/layout/schedulePaging.jsp" />
<br>


<div id="back" style="text-align:center">
<a href="/schedule/calendar">
<button type="button" class="btn btn-outline-warning">
일정관리로 돌아가기</button>
</a>
<br><br>
</div>
