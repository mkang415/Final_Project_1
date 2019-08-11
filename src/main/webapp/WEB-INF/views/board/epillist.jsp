<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 


<style type="text/css">
table, th, tr {
	text-align: center;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/board/epillist?search="+$("#search").val();
	});
});

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
</script>

<h1>게시판 리스트</h1>
<hr>
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-primary" onclick="location.href='/board/freelist'">자유게시판</button>
  <button type="button" class="btn btn-primary">후기게시판</button>
  <button type="button" class="btn btn-outline-primary" onclick="location.href='/board/photolist'">사진게시판</button>
</div>
<table class="table table-striped table hover table-condensed">
	<tr>
		<th style="width : 10%">추천</th>
		<th style="width : 45%">제목</th>
		<th style="width : 15%">작성자</th>
		<th style="width : 10%">조회수</th>
		<th style="width : 20%">작성일</th>
	</tr>

<c:forEach items="${epilList}" var = "i" >
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
<c:import url="/WEB-INF/views/layout/epilPaging.jsp"></c:import>

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
<button type="button" onclick="location.href='/board/write?divide=2'">글쓰기</button>
</c:if>
<button type="button" onclick="location.href='/main'">메인</button>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>