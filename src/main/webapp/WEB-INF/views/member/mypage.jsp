<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Calendar" %>    
<% Calendar cal = Calendar.getInstance(); %>
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- bootstrap4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



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
min-width : 1200px;
}

#cal {
position: absolute;
top: 5.8%;
left: 25.5%;
}

#caltext{
position: absolute;
top: 8.8%;
left: 25.6%;
}

#free {
position: absolute;
top: 17.3%;
left: 26.2%;
}

#freetext {
position: absolute;
top: 22%;
left: 27%;
color: #464646;
}


#vote {
position: absolute;
top: 27%;
left: 25.9%;
}

#vv {
position: absolute;
top: 32%;
left: 26.2%;
font-size: medium;
}

#diary {
position: absolute;
top: 38.2%;
left: 25.7%;
}


#dd {
position: absolute;
top: 43.2%;
left: 27.2%;
font-size: medium;
}

#home {
position: absolute;
top: 73%;
left: 5.7%;
}


#d, #h, #a, #di, #q, #m {
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
left: 35%;
}

div#incom {
position: absolute;
width: 100%;
}

table, th {
	text-align: center;
}

#ca {
font-size: large;	
}

#ff {
 font-size: medium;
}

#logout {
position: absolute;
top: 65%;
left: 70%;
z-index: 1;
}

#qa {
position: absolute;
top: 70%;
right: 8.3%
}

#qq {
position: absolute;
top: 83%;
right: 8.8%
}


#memo {
position: absolute;
top: 48.8%;
left: 25.9%;
}

#mm {
position: absolute;
top: 48.7%;
left: 27%;

}

#member{
position: absolute;
top: 14.8%;
left: 4.3%;
z-index: 1;
}


#modal {
  display: none;
  position:absolute;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  text-align: center;
}

#modal .modal_content {
  width:600px;
  margin:100px auto;
  padding:20px 10px;
  background: 	#FFDAB9;
  border:2px solid #666;
}

#modal .modal_layer {
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}  

#modal_table {
	display:table;
	position:relative;
	width:100%;
	height:200px;
	border:2px solid #666;
}
#rrr {
color: red;
}


</style>



<div id="background">

<div id="logout">
<a href="/member/logout">
<button type="button" class="btn btn-dark">로그아웃</button></a>
</div>

<div id="member">
<a href="/member/upinfo">
<span><img src="/resources/img/mmodi.png" width="90px" height="90px"></span>
</a>
&nbsp;&nbsp;&nbsp;&nbsp;

<span>
<img id="modal_open_btn" src="/resources/img/drop.png" width="90px" height="90px">
</span>
</div>


<div id="modal">
   
    <div class="modal_content" style="text-align: center">
        <h2 id="rrr">
        	정말로 탈퇴하시겠어요? </h2><br>
        	<h2>모든 데이터가 날아갑니다! </h2>
        
       
       <br><br>
       <span style="text-align: cneter;"><a href="/member/delete">
       <button type="button" class="btn btn-danger">확인</button></a></span>
       &nbsp;&nbsp;&nbsp;&nbsp;
	   <span><a href="/member/mypage">
	   <button type="button" class="btn btn-primary">취소</button></a></span>
	
    </div>
   
 	   <div class="modal_layer"></div>
    
</div>

<div id="incom">

<div id="com">
<img src="/resources/img/pcpc.png" width="100%" height="100%">


<div id="cal">
<a href="/schedule/calendar">
<img src="/resources/img/cal.png" width="80px" height="80px"></a>
</div>
<div id="caltext">
<p id="ca">
<a id="a" href="/schedule/calendar" style="color: #942894;">
&nbsp;&nbsp;<%= cal.get(Calendar.YEAR) %>년
<br>
&nbsp;<%= cal.get(Calendar.MONTH)+1 %>월
<%= cal.get(Calendar.DATE) %>일
</a></p>
</div>



<div id="free">
<a id="d" href="/board/freelist">
<img src="/resources/img/folder.png"  width="70px" height="70px">
</a>
</div>
<div id="freetext">
<p id="ff"><a id="d" href="/board/freelist" style="color:#8B5927;">게시판</a></p>
</div>

<div id="vote"> 
<a href="/ledger/ledger">
<img src="/resources/img/wallet.png"  width="70px" height="70px">
</a>
</div>
<div id="votetext">
<p id="vv"><a id="d" href="/ledger/ledger" style="color: white;">가계부</a></p>
</div>


<div id="home"><a href="/main">
<img src="/resources/img/mainmain.png"  width="100px" height="100px"></a>
</div>


<div id="memo">
<a id="d" href="/memo/list">
<img src="/resources/img/memo.png"  width="70px" height="70px">
</a>
</div>
<div id="memotext">
<p id="mm"><a id="m" href="/memo/list" style="color:white;">메모</a></p>
</div>





<div id="diary"><a href="/diary">
<img src="/resources/img/ddiary.png"  width="70px" height="65px"></a>
</div>
<div id="diarytext">
<p id="dd"><a id="d" href="/diary" style="color: #00008C;">일기</a></p>
</div>


<div id="viewdiary">
<img src="/resources/img/note.png" width="70%" height="60%">
</div>


<div id="diaryview" style="height:310px; width:578px; overflow-y:scroll; overflow-x:scroll;">
<table style="table-layout:fixed;">
<tr >
<td><h3><a href="/diary" id="di" style="color: #3e48ab">☞ 가장 최근에 작성하신 일기 입니다 ☜</a></h3></td>
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
<td height="150px" width="500px;">${view.content }</td>
</tr>

</table>
</div> <!-- viewdiary -->

<div id="qa"><a href="/freqna/list">
<img src="/resources/img/qa.png"  width="90px" height="90px"></a>
</div>
<div id="qatext">
<p id="qq"><a id="q" href="/freqna/list" style="color: #00008C;">질의응답</a></p>
</div>

</div> <!-- com end -->
</div> <!-- incom end -->
</div>
<script>
$("#modal_open_btn").click(function(){
    $("#modal").attr("style", "display:block");
});

 $("#modal_close_btn").click(function(){
    $("#modal").attr("style", "display:none");
});     
</script>