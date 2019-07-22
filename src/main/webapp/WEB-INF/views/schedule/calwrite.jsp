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

<h3>일정 쓰기</h3>

<% 
 String year = request.getParameter("year"); 
String month = request.getParameter("month"); 
 String day = request.getParameter("day"); 

// MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance(); 

int tyear = cal.get(Calendar.YEAR); 
int tmonth = cal.get(Calendar.MONTH) + 1; 
int tday = cal.get(Calendar.DATE); 
int thour = cal.get(Calendar.HOUR_OF_DAY);
int tmin = cal.get(Calendar.MINUTE);
 %>

<div align="center">

<form action="/schedule/calwrite" method="post">

<table border="1" >
<col width="200"><col width="500">

<tr>
	<td>아이디</td>
	<td>
		${member_idx }
		<input type="hidden" name="id" value="${member_idx }">
	</td>
</tr>

<tr>
	<td>제목</td>
	<td>
		<input type="text" size="60" name="title">
	</td>
</tr>

<tr>
	<td>일정</td>
	<td>
		<select name="year">
		<%	
			for(int i = tyear - 5; i < tyear + 6; i++){
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
	<td>내용</td>
	<td>
		<textarea rows="20" cols="60" name="content"></textarea>
	</td>
</tr>

</table>
<br><br>
<input type="submit" value="일정쓰기">
</form>

</div>