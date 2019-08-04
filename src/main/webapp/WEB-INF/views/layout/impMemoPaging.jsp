<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item">
			<a class="page-link" href="/memo/list?impCurPage=${impMemoPaging.curPage-1 }" tabindex="-1" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      		</a>
    	</li>
    	
    	<li class="page-item">
			<a class="page-link" href="/memo/list?impCurPage=${impMemoPaging.curPage+1 }" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      		</a>
		</li>
	</ul>
</nav>
