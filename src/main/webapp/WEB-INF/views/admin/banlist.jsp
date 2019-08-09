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






	<h1 style="text-align: center; "><a href="/admin/banlist">영구 정지 목록</a></h1>
	<br>
	<br>
	<table class="table table-striped" border="1" style="text-align: center;
 	width: 80%; margin-left: auto; margin-right: auto;">
	<tr>
	
	<th style="text-align: center;">회원번호</th>
	<th style="text-align: center;">닉네임</th>
	<th style="text-align: center;">이메일</th>
	<th style="text-align: center;">가입일</th>
	<th style="text-align: center;">정지 해제</th>	
	</tr>
	
	<c:forEach items="${list }" var="i">
		<tr>
			
			<td>${i.MEMBER_IDX }</td>
			<td>${i.NICKNAME }</td>
			<td>${i.EMAIL }</td>
			<td>${i.JOINDATE }</td>
			<td><button style="color: red;" type="button" onclick="location.href='/admin/noban?member_idx=${i.MEMBER_IDX}'">정지 해제</button></td>
		</tr>
	</c:forEach>
	</table>

<br>





<c:import url="/WEB-INF/views/layout/adminmemberbanpaging.jsp"></c:import>

<c:import url="/WEB-INF/views/layout/footer.jsp"/> 
