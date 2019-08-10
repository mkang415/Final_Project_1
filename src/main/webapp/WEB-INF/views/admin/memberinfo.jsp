<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

#btnBox {
	position: absolute;
	right: 400px;
	height: 100px;
	margin: auto;
	text-align: center;
}

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






<br>

<h1 style="text-align: center; ">작성글 목록</h1>
<br>
<table class="table table-striped" border="1" style="text-align: center;
 	width: 60%; table-layout:fixed; margin-left: auto; margin-right: auto;">

	<tr>
	
	<th style="text-align: center; width: 10%;">글번호</th>
	<th style="text-align: center; width: 45%;">제목</th>
	<th style="text-align: center; width: 15%;">작성자</th>
	<th style="text-align: center; width: 10%;">조회수</th>
	<th style="text-align: center; width: 20%;">작성일</th>
	</tr>

	<c:forEach items="${list }" var="i">
		<tr>
			
			<td>${i.BOARD_IDX }</td>
			<td><div id="over"><a href="/admin/boardview?board_idx=${i.BOARD_IDX }">${i.TITLE }</a></div></td>
			<td>${i.NICKNAME }</td>
			<td>${i.HIT }</td>
			<td>${i.WRITTENDATE }</td>
		</tr>
	</c:forEach>

</table>


<c:import url="/WEB-INF/views/layout/adminmemberinfopaging.jsp"></c:import>
<div id="btnBox">
<a href="/admin/member"><button>목록</button></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/admin/ban?member_idx=${member.member_idx} "><button style="color: red;">영구정지</button></a>
<br>
<br>


</div>







<br>
<br>
<br>





<c:import url="/WEB-INF/views/layout/footer.jsp"/> 

