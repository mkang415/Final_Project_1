<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	
  	<!-- 첫 페이지 아니라면 처음 버튼과 이전 페이지 버튼 활성화-->
  	<c:if test="${paging.curPage ne 1 }">
  		<li class="page-item"><a class="page-link" href="/schedule/list?search=${paging.search}"><span>처음</span></a></li>
  		<li class="page-item"><a class="page-link" href="/schedule/list?curPage=${paging.curPage-1 }&search=${SchedulePaging.search}"><span>&laquo;</span></a>
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
				<a class="page-link" href="/schedule/list?curPage=${i }&search=${paging.search}">${i }</a>
			</li>
		</c:if>
	</c:forEach>

	<!-- 마지막 페이지일 경우 다음 페이지 버튼 비활성화 -->
    <c:if test="${paging.curPage eq paging.totalPage }">
    	<li class="page-item disabled"><a class="page-link" aria-disabled="true"><span>&raquo;</span></a></li>
    </c:if>
    
    <!-- 마지막 페이지 아닐 경우 다음 페이지 버튼 활성화 -->
    <c:if test="${paging.curPage ne paging.totalPage }">
    	<li class="page-item"><a class="page-link" href="/schedule/list?curPage=${paging.curPage+1 }&search=${paging.search}"><span>&raquo;</span></a>
    </c:if>
  </ul>
</nav>