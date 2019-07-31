<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="text-center">
	<ul class="pagination pagination-sm">

		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${impMemoPaging.curPage eq 1 }">
			<li class="disabled">
				<span>&laquo;</span>
			</li>
		</c:if>
		
		<c:if test="${impMemoPaging.curPage ne 1 }">
			<li>
				<a href="/memo/list?impCurPage=${impMemoPaging.curPage-1 }"><span>&laquo;</span></a>
	    	</li>
	    </c:if>
		
		<!-- 다음 페이지 -->
		<c:if test="${impMemoPaging.curPage eq impMemoPaging.totalPage }">
			<li class="disabled">
				<span>&raquo;</span>
			</li>
		</c:if>

		<c:if test="${impMemoPaging.curPage ne impMemoPaging.totalPage }">
			<li>
				<a href="/memo/list?impCurPage=${impMemoPaging.curPage+1 }">
				<span>&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
