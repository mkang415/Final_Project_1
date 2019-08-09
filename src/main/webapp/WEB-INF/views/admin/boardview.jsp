<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style type="text/css">

#btnBox {
	position: fixed;
	right: 400px;
	height: 100px;
	margin: auto;
	text-align: center;
}

</style>


<h1 style="text-align: center; "><a href="/admin/list">게시글 상세보기</a></h1>


<br><br>

<table class="table table-striped" border="1" style="text-align: center;
 	width: 60%; margin-left: auto; margin-right: auto;">
<tr>
<td>글번호</td><td colspan="3">${board.board_idx}</td>
</tr>

<tr>
<td>제목</td><td colspan="3">${board.title }</td>
</tr>

<tr>
<td>닉네임</td><td>${board.nickname }</td>  
<td>이메일</td><td>${board.email }</td>
</tr>

<tr>
<td>조회수</td><td>${board.hit }</td>
<td>작성일</td><td colspan="3"><fmt:formatDate value="${board.writtendate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
</tr>





<tr><td colspan="4">본문</td></tr>

<tr><td colspan="4">${board.content }</td></tr>

</table>

<div id="btnBox">
<a href="/admin/list"><button>목록</button></a>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"/> 

