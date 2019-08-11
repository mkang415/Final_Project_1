<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<style type="text/css">

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

#background {
/* background-image : url('/resources/admin/1.jpg'); */
background: #f0f0f0;
position: relative;
width:100%;
height:110%;
background-size: cover;
background-position: center center;

}

.table {
	background : #ffffff;
}

</style>
<div id="background">
	<div>
	<h1 style="text-align: center; "><a href="/admin/report">신고 게시글</a></h1>
	<br>
	<br>
	<table class="table table-striped" border="1" style="text-align: center;
 	width: 60%; table-layout:fixed; margin-left: auto; margin-right: auto;">
	<tr>
	<th style="text-align: center; width: 10%;">확인</th>
	<th style="text-align: center; width: 10%;">번호</th>
	<th style="text-align: center; width: 20%">신고내용 (상세보기)</th>
	<th style="text-align: center; width: 10%">닉네임</th>
	<th style="text-align: center; width: 25%">게시글 제목</th>
	<th style="text-align: center; width: 25%">작성일</th>	
	</tr>
	
	<c:forEach items="${list }" var="i">
		<tr>
			<td>
			<c:if test="${i.VIEWCHECK eq 0 }">미확인</c:if>
			<c:if test="${i.VIEWCHECK eq 1 }">확인</c:if>
			</td>
			<td>${i.REPORT_IDX }</td>
			<td><div id="over" data-toggle="modal" data-target="#Modal${i.REPORT_IDX }">${i.CONTENT }</div></td>
			<td>${i.NICKNAME }</td>
			<td><div id="over"><a href="/admin/boardview?board_idx=${i.BOARD_IDX }">${i.TITLE }</a></div></td>
			<td><fmt:formatDate value="${i.WRITTENDATE }" pattern="yy-MM-dd HH:mm:ss" /></td>
		</tr>
		
	<div class="modal fade" id="Modal${i.REPORT_IDX }" tabindex="-1" role="dialog"
		aria-labelledby="ModalWrite" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<form action="/ledger/write" method="post">
				
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<br>
					<h2 style="text-align: center">신고내용</h2>
					<div class="modal-header">
					</div>
					<div class="modal-body">
						${i.CONTENT }
					</div>

					<div class="modal-footer">
					<button type="button" onclick="location.href='/admin/viewcheck?report_idx=${i.REPORT_IDX}'">내용 확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</c:forEach>
	</table>
	
<br>


</div>
<c:import url="/WEB-INF/views/layout/adminreportpaging.jsp"></c:import>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/> 
