<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>

<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>


<!-- Bootstrap 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<!-- <div class="text-center"> -->
<!-- 	<ul class="pagination pagination-sm"> -->
	 		<!-- 처음으로 가기 -->
<%-- 		<c:if test="${paging.curPage ne 1 }"> --%>
<!-- 		<li> -->
<!-- 			<a href="/diary"><span>&larr;처음</span></a> -->
<!-- 		</li> -->
<%-- 		</c:if> --%>


	 		<!-- 이전 페이지 --> 
			<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
<%-- 		<c:if test="${paging.curPage eq 1 }"> --%>
<!-- 		<li class="disabled"> -->
<!-- 			<span>&laquo;</span> -->
<!-- 		</li> -->
<%-- 		</c:if> --%>

<%-- 		<c:if test="${paging.curPage ne 1 }"> --%>
<!-- 		<li> -->
<%-- 			<a href="/diary?curPage=${paging.curPage-1 }"><span>&laquo;</span></a> --%>
<!-- 	    </li> -->
<%-- 	    </c:if> --%>


			<!-- 페이징 리스트 -->
<%-- 		<c:forEach --%>
<%-- 	     begin="${paging.startPage }" end="${paging.endPage }" --%>
<%-- 	     var="i"> --%>
	
	 			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
<%-- 			<c:if test="${paging.curPage eq i}"> --%>
<!-- 			<li> -->
<%-- 				<a href="/diary?curPage=${i }">${i }</a> --%>
<!-- 			</li> -->
<%-- 			</c:if> --%>
		
<%-- 			<c:if test="${paging.curPage ne i}"> --%>
<!-- 			<li> -->
<%-- 				<a href="/diary?curPage=${i }">${i }</a> --%>
<!-- 			</li> -->
<%-- 			</c:if> --%>
			
<%-- 	    </c:forEach> --%>



		
	 		<!-- 다음 페이지 -->
<%-- 		<c:if test="${paging.curPage eq paging.totalPage }"> --%>
<!-- 		<li class="disabled"> -->
<!-- 			<span>&raquo;</span> -->
<!-- 		</li> -->
<%-- 		</c:if> --%>

<%-- 		<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<!-- 		<li> -->
<%-- 			<a href="/diary?curPage=${paging.curPage+1 }"> --%>
<!-- 			<span>&raquo;</span> -->
<!-- 		</a> -->
<!-- 		</li> -->
<%-- 		</c:if> --%>
<!-- 	</ul> -->
<!-- </div> -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	
  	<!-- 첫 페이지 아니라면 처음 버튼과 이전 페이지 버튼 활성화-->
  	<c:if test="${paging.curPage ne 1 }">
  		<li class="page-item"><a class="page-link" href="/diary"><span>처음</span></a></li>
  		<li class="page-item"><a class="page-link" href="/diary?curPage=${paging.curPage-1 }"><span>&laquo;</span></a>
  	</c:if>
  	
  	<!-- 첫 페이지일 경우 처음 버튼과 이전 페이지 버튼 비활성화 -->
    <c:if test="${paging.curPage eq 1 }">
    	<li class="page-item disabled"><a class="page-link" aria-disabled="true"><span>처음</span></a></li>
    	<li class="page-item disabled"><a class="page-link" aria-disabled="true"><span>&laquo;</span></a></li>
    </c:if>

	<!-- 1페이지부터  마지막 페이지까지 반복문 -->
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	
		<!-- 현재 보고 있는 페이지일 경우 강조 -->
		<c:if test="${paging.curPage eq i}">
			<li class="page-item active" aria-current="page">
				<span class="page-link">
					${i } <span class="sr-only">(current)</span>
				</span>
			</li>
		</c:if>
		
		<!-- 현재 보고 있는 페이지가 아닐 경우 그냥 보여줌 -->
		<c:if test="${paging.curPage ne i}">
			<li class="page-item">
				<a class="page-link" href="/diary?curPage=${i }">${i }</a>
			</li>
		</c:if>
	</c:forEach>

	<!-- 마지막 페이지일 경우 다음 페이지 버튼 비활성화 -->
    <c:if test="${paging.curPage eq paging.totalPage }">
    	<li class="page-item disabled"><a class="page-link" aria-disabled="true"><span>&raquo;</span></a></li>
    </c:if>
    
    <!-- 마지막 페이지 아닐 경우 다음 페이지 버튼 활성화 -->
    <c:if test="${paging.curPage ne paging.totalPage }">
    	<li class="page-item"><a class="page-link" href="/diary?curPage=${paging.curPage+1 }"><span>&raquo;</span></a>
    </c:if>
  </ul>
</nav>

<!-- BootStrap 4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
