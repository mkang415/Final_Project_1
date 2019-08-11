<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.js"></script>

<style>
.error {
	font-size: 10px;
	color: red;
}

.join_content {
	margin-top:50px;
	margin-left:680px;
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

#btnJoin{position: relative;
			left: 745px; top:70px;
			margin-bottom:100px; }

#loginImg {position: relative;
			width: 800px; left:450px;}

#underLine{
			position:relative;
			top:0;
			width:1600px;
			left:30px;
}

.joinProcess {
			position:relative;
			float:right;
			display:block;
			bottom:30px;
			
		
			
}

.joinProcess ul li{		
						margin-right: 20px;
						padding-right: 20px;
						list-style:none;
						font-size: 12px;
						font-weight: 700;
						float:left; }
						



</style>




<script type="text/javascript">
$(document).ready(function() {
		//가입 버튼 클릭 시 form submit
		$("#btnJoin").click(function() {


		})

});	
</script>

</head>
<body>

<header>

<a href="/main">
<img id="loginImg" src="/resources/assets/img/Daily-logo.png"></img>
</a>

</header>
<div id="underLine">
<hr>
</div>

<nav>

	<div class="joinProcess">
	<ul class="clearfix">
			<li style="color:#00BFFF;"><h3>1. 이메일인증</h3></li>
			<li><h3>2. 인증코드입력</h3></li>
			<li><h3>3. 비밀번호변경</h3></li>

	</ul>
	</div>

</nav>

<form action="/member/findpwproc" method="post">

<div class="join_content">
	
	<div class="row_group">
		<h3 class="join_title">
		<label for="email">이메일 입력</label>
		</h3>
	<span class="intext"> <input type="email" id="member_email"
			name="email" class="inputtext" maxlength="100" /></span> 
		
			
	</div>



</div>
	<button id="btnJoin" class="btn_type">
		<span>인증코드받기</span>
	</button>
</form>

</body>
</html>