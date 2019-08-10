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
		location.href="/board/photolist?search="+$("#search").val();
	});
});

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
</script>

<h1>게시판 리스트</h1>
<hr>

<c:forEach items="${photoList}" var = "i">
<fmt:formatDate value="${i.WRITTENDATE}" pattern="yyyy-MM-dd" var="write_dt"/>
<div class="card mb-3">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="/resources/boardimg/${i.MAINIMAGE}" class="card-img" style="min-width: 240px; max-width: 480px; height: auto;" onclick="location.href='/board/view?brdidx=${i.BOARD_IDX}'">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">
        	
			<a href="/board/view?brdidx=${i.BOARD_IDX}">${i.TITLE}</a> 
			
        </h5>
        <p class="card-text">
        	작성자 : ${i.NICKNAME} &nbsp;&nbsp;
        	추천 : 
        	<c:choose>
				<c:when test="${i.RECOMMEND==0 }"><span class="badge badge-light">${i.RECOMMEND}</span></c:when>
				<c:when test="${i.RECOMMEND<=10}"><span class="badge badge-primary">${i.RECOMMEND}</span></c:when>
				<c:when test="${i.RECOMMEND>10}"><span class="badge badge-danger">${i.RECOMMEND}</span></c:when>
			</c:choose>
			&nbsp;&nbsp;
			댓글 : 
			<span class="badge badge-light">${i.CNTREPLY}</span>
			&nbsp;&nbsp;
			조회수 : 
			<c:choose>
				<c:when test="${i.HIT<=100 }"><span class="badge badge-light">${i.HIT}</span></c:when>
				<c:when test="${i.HIT<=1000}"><span class="badge badge-secondary">${i.HIT}</span></c:when>
				<c:when test="${i.HIT>1000}"><span class="badge badge-danger">${i.HIT}</span></c:when>
			</c:choose>
			&nbsp;&nbsp;
			<small class="text-muted">
			작성일 : 
        	<c:choose>
				<c:when test="${today <= write_dt }"><fmt:formatDate value="${i.WRITTENDATE}" pattern="HH:mm:ss"/></c:when>
				<c:when test="${today > write_dt }"><fmt:formatDate value="${i.WRITTENDATE}" pattern="yyyy-MM-dd"/></c:when>
			</c:choose>
        	</small>
        </p>
      </div>
    </div>
  </div>
</div>
</c:forEach>
<c:import url="/WEB-INF/views/layout/photoPaging.jsp"></c:import>

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
<button type="button" onclick="location.href='/board/write?divide=3'">글쓰기</button>
</c:if>
<button type="button" onclick="location.href='/main'">메인</button>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>