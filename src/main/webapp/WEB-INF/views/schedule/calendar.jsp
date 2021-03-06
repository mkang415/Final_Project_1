<%@page import ="dto.CalendarDto" %>
<%@page import = "java.util.List" %>
<%@page import="java.util.Calendar"%>
<%@page import = "schedule.CalendarUtil" %>
<%@page import = "schedule.controller.CalendarController" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/>     

<style>
#bt {
text-aling : right;
margin-right : 10;
}


#background {
background-image : url('/resources/img/back5.jpg');
position: relative;
width:100%;
height:140%;
background-size: cover;
background-position: center center;

}

</style>    
    
    
    
<%!
CalendarUtil util = new CalendarUtil();
%>

<% Calendar cal2 = Calendar.getInstance(); %>
<%

Calendar cal = (Calendar)request.getAttribute("jcal");
List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("list");


int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
int newLine=0;

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


<div id="background">



<h3 style="text-align:center;">[CALENDAR]</h3>



<div align="center">

<table border="1">
<col width="200"><col width="200"><col width="200"><col width="200">
<col width="200"><col width="200"><col width="200">

<tr height="100">
	<td align="center">
		<a href="/main">
		<img src="/resources/img/mainmain.png"  width="80px" height="80px">
		</a>
	</td>
	<td colspan="5" align="center">
		<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
		</font>
		<%=n %>&nbsp;<%=nn %>
		<br>
		<label>오늘 날짜</label>&nbsp;&nbsp;&nbsp;
		<%= cal2.get(Calendar.YEAR) %>년&nbsp;
		<%= cal2.get(Calendar.MONTH)+1 %>월&nbsp;
		<%= cal2.get(Calendar.DATE) %>일
	</td>
	
	<td align="center">
		<a href="/member/mypage">
		<img src="/resources/img/mypageee.png"  width="80px" height="80px">
		</a>
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

<div id="all" style="text-align:center">
<a href="/schedule/list">
<button type="button" class="btn btn-success" >
모든일정보러가기</button></a>

</div>
<br>
</div>



<c:import url="/WEB-INF/views/layout/footer.jsp"/>