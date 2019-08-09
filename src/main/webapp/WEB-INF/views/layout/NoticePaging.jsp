<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav aria-label="Page navigation example">

	<ul class="pagination justify-content-center">
		<!-- 처음으로 가기 -->
		<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="/notice/list"><span>&larr;처음</span></a>
		</li>
		
		</c:if>




		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${paging.curPage eq 1 }">
		<li class="page-item disabled">
			<a class="page-link" aria-disabled="true"><span>&laquo;</span></a>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="/notice/list?curPage=${paging.curPage-1 }&search=${param.search }"><span>&laquo;</span></a>
	    </li>
	    </c:if>





		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
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
				<a class="page-link" href="/notice/list?curPage=${i }&search=${param.search }">${i }</a>
			</li>
			</c:if>
			
	    </c:forEach>



		
		<!-- 다음 페이지 -->
		<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="page-item disabled">
		<a class="page-link" aria-disabled="true">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="/notice/list?curPage=${paging.curPage+1 }&search=${param.search }">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>
	</ul>

</nav>