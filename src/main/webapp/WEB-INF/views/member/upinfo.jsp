<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<style>

#background {
background-image : url('/resources/img/back4.jpg');
position: relative;
width:100%;
height:600px;
background-size: cover;
background-position: center center;

}

#form2 {
position: absolute;
z-index: 2;
top: 10%;
left: 25%;
}

#form {
position: absolute;
z-index: 3;
top : 42%;
left:35%;
}

th {
text-align: center;
}

table {
width : 500px;
height : 100px;
z-index: 2;

}

input {
padding: 10px;
width: 100%;

}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btn").click(function(){
		alert("정말로 수정하시겠습니까?");
		
		$("form").submit();
	});
});


</script>


<div id="background">

<div id="form2">
<img id="modal_open_btn" src="/resources/img/form.png" width="900px" height="500px">
</div>
<div id="form" align="center" >


<form action="/member/upinfo" method="post" >
<br>
<br>

<table border="1">

<tr>
<th class="table-warning"><label>이메일</label></th>
<td style="text-align: center;" class="table-active">${upinfo.email }</td>
</tr>

<tr>
<th class="table-warning"><label>비밀번호</label></th>
<td class="table-active"><input type="text" id="pw" name="pw" value="${upinfo.pw }"/></td>
</tr>

<tr>
<th class="table-warning"><label>닉네임</label></th>
<td class="table-active"><input type="text" id="nickname" name="nickname" value="${upinfo.nickname }"/></td>
</tr>



</table>

<br>

		<button type="submit" id="btn" class="btn btn-danger">수정하기</button>


<a href="/member/mypage">
<button type="button" class="btn btn-info">마이페이지</button></a>




</form>

</div>

</div>





<c:import url="/WEB-INF/views/layout/footer.jsp"/> 