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







<c:choose>
	<c:when test="${empty login }">
		<a href="/member/login"><button class="btn pull-right">로그인</button></a>
	</c:when>
	<c:otherwise>
		<div class="pull-right">
			<c:out value="${nick }" />님 환영합니다<br><br>
			<a href="/member/logout"><button class="btn btn-warning">로그아웃</button></a>
		</div>
	</c:otherwise>
</c:choose>

<h5 class="pull-right"> 총 일정 리스트 : ${paging.totalCount }</h5>
<br>
<div class="clearfix"></div>
<table class="table table-striped table-hover">
<thead>
	<tr>
		<th>일정번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>약속날짜</th>
		<th>작성날짜</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list2 }" var="i">
	<tr>
		<td>${i.calendar_idx }</td>
		<td><a href="/schedule/caldetail?calendar_idx=${i.calendar_idx}">${i.title }</a></td>
		<td>${i.content }</td>
		<td>${i.rdate }</td>
		<td>${i.wdate }</td>
	</tr>
</c:forEach>
</tbody>
</table>


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
