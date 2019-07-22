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

<h1 style="text-align: center; "><a href="/admin/member">회원 상세정보</a></h1>


<br><br>

<table class="table table-striped" border="1" style="text-align: center;
 	width: 60%; margin-left: auto; margin-right: auto;">
<tr>
<td>회원번호</td><td colspan="3">${member.member_idx}</td>
</tr>

<tr>
<td>이메일</td><td colspan="3">${member.email }</td>  
</tr>

<tr>
<td>닉네임</td><td>${member.nickname }</td>
<td>비밀번호</td><td>${member.pw }</td>
</tr>

<tr>
<td>가입일</td><td colspan="3"><fmt:formatDate value="${member.joindate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
</tr>

</table>






<br><br><br>

<h1 style="text-align: center; ">작성글 목록</h1>

<table class="table table-striped" border="1" style="text-align: center;
 	width: 60%; margin-left: auto; margin-right: auto;">

	<tr>
	
	<th style="text-align: center;">글번호</th>
	<th style="text-align: center;">제목</th>
	<th style="text-align: center;">내용</th>
	<th style="text-align: center;">작성자</th>
	<th style="text-align: center;">조회수</th>
	<th style="text-align: center;">추천수</th>
	<th style="text-align: center;">작성일</th>
	</tr>

	<c:forEach items="${list }" var="i">
		<tr>
			
			<td>${i.BOARD_IDX }</td>
			<td><a href="/admin/boardview?board_idx=${i.BOARD_IDX }">${i.TITLE }</a></td>
			<td>${i.CONTENT }</td>
			<td>${i.NICKNAME }</td>
			<td>${i.HIT }</td>
			<td>${i.RECOMMEND }</td>
			<td>${i.WRITTENDATE }</td>
		</tr>
	</c:forEach>

</table>


<c:import url="/WEB-INF/views/layout/adminmemberinfopaging.jsp"></c:import>
<div id="btnBox">
<a href="/admin/member"><button>목록</button></a>
</div>

















</body>
</html>