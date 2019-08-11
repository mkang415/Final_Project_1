<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.2.4.js"></script>

<script type="text/javascript">


// $(document).ready(function() {
	
// //로그인실패
// $("#btnLogin").click(function() {
// 	$.ajax({
// 		type : "POST",
// 		url : "/member/login",
// 		data : {
// 			email: $("#email").val(),
// 			pw:$("#pw").val()
// 		},
// 		dataType : 'json',
// 		success : function(data) {
// 			if( data.success ) {
// 				$("#login").submit();

// 			} else {
// 				$("#loginMsg").html("아이디 혹은 비밀번호가 틀립니다.").css("color", "red");	
				
// 			}
	
// 		}
// 	})
// });



// });

</script>



<style>
.error {
	font-size: 10px;
	color: red;
}

.join_content {
	margin-top:50px;
	position:relative;
	left:680px;

	max-width: 335px;
	min-width: 200px;
}

.row_group {
	overflow: hidden;
	width: 100%;
}

.join_title {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.inputtext {
	border: none;
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
}

.intext, .genderdiv {
	display: block;
	position: relative;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	box-sizing: border-box;
	vertical-align: top;
}

.gen {
	width: 100%;
	height: 29px;
	font-size: 15px;
	line-height: 18px;
	color: #000;
	border: none;
	border-radius: 0;
	height: auto;
	margin-top: 3px;
}

.btnarea {
	margin: 30px 0 9px;
}

.btn_type {
	display: block;
	width: 200px;
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
	position: absolute;
	top:600px;
	left:700px;
}

#btnLogin{position: relative;
			left: 745px; top:70px; }

#loginImg {position: relative;
			width: 800px; left:450px;}

#memberjoin{
			position:relative;
			top:95px;
			left:860px;
}

#memberFind{
			position:relative;
			top:95px;
			left:690px;
}

#underLine{
			position:relative;
			top:90px;
			width:335px;
			left:680px;
}

a{	 color:black;	
	font-size: 14px;
	font-weight: 700;}
	
a:link{text-decoration: none;  }
a:hover {color:#00BFFF;}

</style>
</head>
<body>
<header>

<a href="/main">
<img id="loginImg" src="/resources/assets/img/Daily-logo.png"></img>
</a>

</header>





<form action="/member/login" id="login" method="post">

<div class="join_content">
		<div class="row_group">
			<h3 class="join_title">
				<label for="email">이메일</label>
			</h3>
			<span class="intext"> <input type="text" id="email"
				name="email" class="inputtext" maxlength="40" /></span>
			</div>
			
		<div class="row_group">
			<h3 class="join_title">
				<label for="pw">패스워드</label>
			</h3>
			<span class="intext"> <input type="password" id="pw"
				name="pw" class="inputtext" maxlength="40" /></span>
			</div>
</div>
	<button id="btnLogin" class="btn_type">
		<span>로그인</span>
	</button>
</form>
<div id="loginMsg">
</div>

<div id="underLine">
<hr>
</div>

<a id="memberjoin" href="/member/join">회원가입</a>
<a id="memberFind" href="/member/findpw">비밀번호찾기</a>






</body>
</html>