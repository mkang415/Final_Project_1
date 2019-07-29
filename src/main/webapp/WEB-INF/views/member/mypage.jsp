<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Calendar" %>    
<% Calendar cal = Calendar.getInstance(); %>
    
<style>
#background {
background-image : url('/resources/img/back.jpg');
border: 0;
padding: 0; 
 min-height: -webkit-fill-available;
background-position: top;
background-size: contain;
}


</style>


<div id="background">
<h1>마이페이지</h1>

<div>
<h1>오늘날짜<br>
<%= cal.get(Calendar.YEAR) %>년
<%= cal.get(Calendar.MONTH)+1 %>월
<%= cal.get(Calendar.DATE) %>일</h1>
</div>


<div id="com">
<img src="/resources/img/com.png" width="100%" height="700px">


</div>


















</div>