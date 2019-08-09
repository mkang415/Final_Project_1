<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style type="text/css">
table, th, tr {
	text-align: center;
}

.container {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/board/freelist?search="+$("#search").val();
	});
});

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
</script>
</head>
<body>
<h1>게시판 리스트</h1>
<hr>
<table class="table table-striped table hover table-condensed">
	<tr>
		<th style="width : 10%">추천</th>
		<th style="width : 45%">제목</th>
		<th style="width : 15%">작성자</th>
		<th style="width : 10%">조회수</th>
		<th style="width : 20%">작성일</th>
	</tr>

<c:forEach items="${freeList}" var = "i" >
<fmt:formatDate value="${i.WRITTENDATE}" pattern="yyyy-MM-dd" var="write_dt"/>
	<tr>
		<td>
			<c:choose>
				<c:when test="${i.RECOMMEND==0 }"><span class="badge badge-light">${i.RECOMMEND}</span></c:when>
				<c:when test="${i.RECOMMEND<=10}"><span class="badge badge-primary">${i.RECOMMEND}</span></c:when>
				<c:when test="${i.RECOMMEND>10}"><span class="badge badge-danger">${i.RECOMMEND}</span></c:when>
			</c:choose>
		</td>
 		<td><a href="/board/view?brdidx=${i.BOARD_IDX}"> ${i.TITLE} <span class="badge badge-light">${i.CNTREPLY}</span></a></td>
		<td>${i.NICKNAME}</td>
		<td>
			<c:choose>
				<c:when test="${i.HIT<=100 }"><span class="badge badge-light">${i.HIT}</span></c:when>
				<c:when test="${i.HIT<=1000}"><span class="badge badge-secondary">${i.HIT}</span></c:when>
				<c:when test="${i.HIT>1000}"><span class="badge badge-danger">${i.HIT}</span></c:when>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${today <= write_dt }"><fmt:formatDate value="${i.WRITTENDATE}" pattern="HH:mm:ss"/></c:when>
				<c:when test="${today > write_dt }"><fmt:formatDate value="${i.WRITTENDATE}" pattern="yyyy-MM-dd"/></c:when>
			</c:choose>
		</td>
	</tr>
</c:forEach>
</table>
<c:import url="/WEB-INF/views/layout/freePaging.jsp"></c:import>

<div class="form-row" style="margin: auto;">
	<div class="col-5">
	</div>
	<div class="col-2">
	<input class="form-control" type="text" id="search"/>
	</div>
	<div class="col">
	<input type="button" id="btnSearch" class="btn btn-primary" value="검색"/>
	</div>
</div>

<div>
<c:if test="${login }">
${nick }<br>
<button type="button" onclick="location.href='/board/write?divide=1'">글쓰기</button>
</c:if>
<button type="button" onclick="location.href='/main'">메인</button>
</div>

</body>
</html>