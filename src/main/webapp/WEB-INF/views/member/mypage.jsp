<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Calendar" %>    
<% Calendar cal = Calendar.getInstance(); %>
<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    



<style>
#background {
background-image : url('/resources/img/back.jpg');
position: absolute;
width:100%;
height:100%;
background-size: cover;
background-position: center center;
}

#com {
position: absolute;
}

#cal {
position: absolute;
top: 5.8%;
left: 25.5%;
}

#caltext{
position: absolute;
top: 8.8%;
left: 25.8%;
}

#memo {
position: absolute;
top: 17.3%;
left: 25.7%;
}

#memotext {
position: absolute;
top: 16.6%;
left: 26.7%;
color: #EBFBFF;
}


#vote {
position: absolute;
top: 27.4%;
left: 25.9%;
}

#vv {
position: absolute;
top: 30%;
left: 26.9%;
color: #EBFBFF;
}

#diary {
position: absolute;
top: 38%;
left: 25.9%;
}


#dd {
position: absolute;
top: 42.5%;
left: 27.5%;
}

#home {
position: absolute;
top: 48.8%;
left: 25.9%;
}


#d, #h, #a, #di {
text-decoration:none 
}

#viewdiary {
position: absolute;
top: 2.5%;
left: 30%;
}


#diaryview {
position : absolute;
top:11%;
text-align: center;
left: 37%;
}

div#incom {
position: absolute;
width: 100%;
}

table, th {
	text-align: center;
}

</style>


<div id="background">
<h5>&nbsp;&nbsp;mypage</h5>
</div>

<div id="incom">

<div id="com">
<img src="/resources/img/pcpc.png" width="100%" height="100%">


<div id="cal">
<a href="/schedule/calendar">
<img src="/resources/img/cal.png" width="80px" height="80px"></a>
</div>
<div id="caltext">
<h4>
<a id="a" href="/schedule/calendar">
&nbsp;<%= cal.get(Calendar.YEAR) %>년
<br>
&nbsp;<%= cal.get(Calendar.MONTH)+1 %>월
<%= cal.get(Calendar.DATE) %>일
</a></h4>
</div>



<div id="memo">
<img src="/resources/img/memo.png"  width="70px" height="70px">
</div>
<div id="memotext">
<h5 id="mm"><a id="d" href="/memo/list">메모장</a></h5>
</div>

<div id="vote"> 
<img src="/resources/img/vote.png"  width="70px" height="70px">
</div>
<div id="votetext">
<h5 id="vv">가계부</h5>
</div>


<div id="home"><a href="/main">
<img src="/resources/img/mainmain.png"  width="70px" height="70px"></a>
</div>



<div id="diary"><a href="/diary">
<img src="/resources/img/diary.png"  width="70px" height="70px"></a>
</div>
<div id="diarytext">
<h5 id="dd"><a id="d" href="/diary">일기</a></h5>
</div>


<div id="viewdiary">
<img src="/resources/img/note.png" width="70%" height="60%">
</div>


<div id="diaryview" style="height:300px; overflow-y:scroll">
<table>
<tr >
<td><h3><a href="/diary" id="di">☞ 가장 최근에 작성하신 일기 입니다 ☜</a></h3></td>
</tr>

<tr>
	<th>제목</th>
</tr>
<tr height="30px">
	<td>${view.title }</td>
</tr>

<tr height="30px">
	<th>내용</th>
</tr>

<tr>
<td height="150px" width="500">${view.content }</td>
</tr>

</table>
</div> <!-- viewdiary -->











</div> <!-- com end -->
</div> <!-- incom end -->
