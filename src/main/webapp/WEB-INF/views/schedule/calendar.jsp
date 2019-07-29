<%@page import ="dto.CalendarDto" %>
<%@page import = "java.util.List" %>
<%@page import="java.util.Calendar"%>
<%@page import = "schedule.CalendarUtil" %>
<%@page import = "schedule.controller.CalendarController" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
    
 <!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<style>
#bt {
text-aling : right;
margin-right : 10;
}

</style>    
    
    
    
<%!
CalendarUtil util = new CalendarUtil();
%>


<%

Calendar cal = (Calendar)request.getAttribute("jcal");
List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("list");


int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;

// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

// <<
String pp = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='/resources/img/left.gif'></a>", 
							"/schedule/calendar", year-1, month);

// <
String p = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='/resources/img/prec.gif'></a>", 
							"/schedule/calendar", year, month-1);

// >
String n = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='/resources/img/next.gif'></a>", 
							"/schedule/calendar", year, month+1);

// >>
String nn = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='/resources/img/last.gif'></a>", 
							"/schedule/calendar", year+1, month);

%>

<h2 style="text-align:center">▷ 일정을 관리하세욥 ◁</h2>
<hr>
<br>

<div id="bt">
<a href="/main">
<button class="btn">메인으로</button></a>
<a href="/member/mypage">
<button>마이페이지로</button></a>
</div>

<br>

<div align="center">

<table border="1">
<col width="200"><col width="200"><col width="200"><col width="200">
<col width="200"><col width="200"><col width="200">

<tr height="100">
	<td colspan="7" align="center">
		<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
		</font>
		<%=n %>&nbsp;<%=nn %>
	</td>
</tr>


<tr height="50">
	<td align="center">일</td>
	<td align="center">월</td>
	<td align="center">화</td>
	<td align="center">수</td>
	<td align="center">목</td>
	<td align="center">금</td>
	<td align="center">토</td>
</tr>

<tr height="100" align="left" valign="top">
<%
// 위쪽 빈칸
for(int i = 1; i < dayOfWeek; i++){
	%>
	<td>&nbsp;</td>	
	<%
}

// 날짜
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1;i <= lastDay; i++){
	%>
	<td><%=util.caldetail(year, month, i)%>&nbsp;<%=util.showPen(year, month, i) %>
		<%=util.makeTable(year, month, i, list) %>		
	</td>	
	<%
	if((i + dayOfWeek - 1) % 7 == 0 && i != lastDay){
		%>
		</tr>
		<tr height="100" align="left" valign="top">		
		<%
	}
	
}

// 밑칸
for(int i = 0;i < (7 - (dayOfWeek + lastDay - 1) % 7) % 7; i++){
	%>
	<td>&nbsp;</td>		
	<%
}
%>
</tr>


</table>
</div>



<br>
<br>
<br>


