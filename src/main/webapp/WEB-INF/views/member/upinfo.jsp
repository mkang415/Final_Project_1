<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<form action="/member/upinfo" method="post">

<table border="1">

<tr>
<th>
<label>닉네임</label>
</th>
<td><input id="nickname" name="nickname" value="${upinfo.nickname }"/></td>
</tr>


<tr>
<th>
<label>비밀번호</label>
</th>
<td><input id="pw" name="pw" value="${upinfo.pw }"/></td>
</tr>




</table>


<a href="/member/mypage">
<button type="button" class="btn btn-warning">목록</button></a>


<c:if test="${upinfo.member_idx eq upinfo.member_idx}">
		<button type="submit">저장</button>

<%-- type="button" onclick="location.href='/member/upinfo?member_idx=${upinfo.member_idx }'" --%>
</c:if>

</form>




































<c:import url="/WEB-INF/views/layout/footer.jsp"/> 