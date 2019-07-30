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
position: relative;
}

#cal {
position: absolute;
top: 130px;
left: 390px;
with: 100px;

}

#caltext{
position: absolute;
top: 135px;
left: 398px;
}

#memo {
position: absolute;
top: 220px;
left: 395px;
with: 100px;
}

#memotext {
position: absolute;
top: 200px;
left: 413px;
}

#mm {
color: #EBFBFF;
}

#vote {
position: absolute;
top: 300px;
left: 395px;
with: 100px;
}

#vv {
position: absolute;
top: 305px;
left: 413px;
color: #EBFBFF;
}


#home {
position: absolute;
top: 480px;
left: 400px;
with: 100px;
}


#hh {
position: absolute;
top: 535px;
left: 425px;
color: #EBFBFF;
}



#diary {
position: absolute;
top: 388px;
left: 398px;
with: 100px;
}


#dd {
position: absolute;
top: 410px;
left: 420px;
color: #EBFBFF;
}

#d, #h, #a {
text-decoration:none 
}



</style>


<div id="background">
<h1>마이페이지</h1>




<div id="com">
<img src="/resources/img/pc.png" width="100%" height="900px">


<div id="cal">
<a href="/schedule/calendar">
<img src="/resources/img/cal.png" width="80px" height="80px"></a>
</div>
<div id="caltext">
<h4>
<a id="a" href="/schedule/calendar">
&nbsp;<%= cal.get(Calendar.YEAR) %>년
<br>
<%= cal.get(Calendar.MONTH)+1 %>월
<%= cal.get(Calendar.DATE) %>일
</a></h4>
</div>



<div id="memo">
<img src="/resources/img/memo.png"  width="75px" height="75px">
</div>
<div id="memotext">
<h5 id="mm">메모장</h5>
</div>

<div id="vote"> 
<img src="/resources/img/vote.png"  width="75px" height="75px">
</div>
<div id="votetext">
<h5 id="vv">가계부</h5>
</div>


<div id="home"><a href="/main">
<img src="/resources/img/home.png"  width="75px" height="75px"></a>
</div>
<div id="hometext">
<h4 id="hh"><a id="h" href="/main">메인</a></h4>
</div>



<div id="diary"><a href="/diary">
<img src="/resources/img/diary.png"  width="75px" height="75px"></a>
</div>
<div id="diarytext">
<h5 id="dd"><a id="d" href="/diary">일기장</a></h5>
</div>







</div> <!-- com end -->

</div>