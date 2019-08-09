<%@page import="dto.CalendarDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- bootstrap4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<%
CalendarDto dto = (CalendarDto)request.getAttribute("dto");
%>

<script type="text/javascript">
$(document).ready(function() {
		$("#cancel").click(function(){
			history.back(-1);
		});
		
		$("#caldel").remove();
});
</script>

<style>
table {
text-align : center;
}


#background {
background-image : url('/resources/img/back4.jpg');
position: absolute;
width:100%;
height:100%;
background-size: inherit;
background-position: center center;

}


.table-bordered td{
 border:1px solid black;
}

.table-bordered th{
 border:1px solid black;
}

#con {
width:100%;
overflow:hidden;
word-wrap:break-word;
text-align: left;

}


</style>

<div id="background">

<br>
<h3 style="text-align:center">▷ 일정 보기 ◁</h3>

<div class="detail" align="center">

<br>
<table class="table table-bordered" style="width: 80%; table-layout:fixed;" class="writetb">
<col width="100"><col width="500">

<tr>
<th  class="table-Active"><label>제목</label></th>
<td colspan="3">${detail.title }</td>
</tr>

<tr>
<th   class="table-Active"><label>일정 날짜</label></th>
<td >${detail.rdate}</td>

<th  class="table-Active"><label>작성한 날짜</label></th>
<td><fmt:formatDate value="${detail.wdate}" pattern="yyyyMMdd"/></td>
</tr>


<tr>
<th  width="200" height="300"  class="table-Active"><label>내용</label></th>
<td colspan="3" style="width: 100%" >
<div id="con">${detail.content }</div>
</td>
</tr>

</table>
</div>
<br><br>

<div align="center">
<a href="/schedule/calendar"><button class="btn btn-warning">목록</button></a>


<c:if test="${detail.member_idx eq detail.member_idx}">
		<a href="/schedule/calupdate?calendar_idx=${detail.calendar_idx }">
		<button class="btn btn-primary">수정</button></a>


<a href="/schedule/caldel?calendar_idx=${detail.calendar_idx}">
<button class="btn btn-danger">삭제</button></a>

</c:if>
</div>
</div>
<br><br>