<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

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

</head>
<body>
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


<div id="btnBox">

<a href="/main"><button>메인</button></a>

&nbsp;&nbsp;&nbsp;&nbsp;

</div>


<c:import url="/WEB-INF/views/layout/adminmemberbanpaging.jsp"></c:import>

</body>
</html>