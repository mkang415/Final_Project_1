<%@page import="java.util.Calendar"%>
<%-- <%@page import="dto.MemberDto"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<h3 style="text-align:center">▷ 일정 쓰기 ◁</h3>

 
<% 
 String year = request.getParameter("year"); 
String month = request.getParameter("month"); 
 String day = request.getParameter("day"); 

// MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance(); 

int tyear = cal.get(Calendar.YEAR); 
int tmonth = cal.get(Calendar.MONTH) + 1; 
int tday = cal.get(Calendar.DATE); 
 %>


<script type="text/javascript">
$(document).ready(function() {
		$("#btnWrite").click(function(){
			$("form").submit();
		});
		
		
		$("#title").focus();
		$("#cancel").click(function(){
			history.back(-1);
		});
});
	

</script>

<style>

.writetb {
 text-align : center;
}

</style>

<div align="center">

<form action="/schedule/calwrite" method="post">

<table border="1" class="writetb" >
<col width="200px"><col width="100px">

<tr height="30"  valign="top">
	<td><label>아이디</label>	${member_idx }</td>
	<td>	<input type="hidden" name="id" value="${member_idx }">
	</td>
</tr>


<tr>
	<td><label for="title">제목</label></td>
	<td><input type="text" size="100%" name="title">
	</td>
</tr>

<tr>
	<td><label>일정날짜</label></td>
	<td>
<!-- 10년 전부터 5년 후 까지 보여주기 -->
		<select name="year"> 
		
		<%	
			for(int i = tyear - 10; i < tyear + 6; i++){
				%>	
				<option <%=year.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>				
				<%
			}		
		%>
		
		</select>년
			
		<select name="month">
		<%	
			for(int i = 1; i <= 12; i++){
				%>	
				<option <%=month.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>				
				<%
			}		
		%>
		</select>월
				
		<select name="day" id="day">
		<%	
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>	
				<option <%=day.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>				
				<%
			}		
		%>
		</select>일	
		
		
	</td>
</tr>



<tr>
	<td><label for="content">내용</label></td>
	<td><textarea rows="20" cols="100%" name="content"></textarea>
	</td>
</tr>

</table>
<br><br>
<button class="btn btn-primary" id="btnWrite">작성</button>
<input type="reset" id="cancel"
		class="btn btn-danger" value="취소"/>
		
</form>

</div>