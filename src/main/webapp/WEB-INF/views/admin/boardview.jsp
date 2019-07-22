<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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






</body>
</html>