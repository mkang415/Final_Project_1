<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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
			margin-right: 20px;
			
		
			
}

.joinProcess ul li{		
						margin-right: 20px;
						padding-right: 20px;
						list-style:none;
						font-size: 12px;
						font-weight: 700;
						float:left; }
						
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
	top:100px;
	left:65px;
}


			
.confirm{ position:relative;
		  left:690px; 
		  top:120px;
			}
			
a:link{ text-decoration: none;}
						
						
</style>

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
			<li><h3>1. 이메일, 비밀번호 입력</h3></li>
			<li><h3>2. 이메일인증</h3></li>
			<li style="color:#00BFFF;"><h3>3. 가입완료</h3></li>
	</ul>
	</div>

</nav>

<div class="confirm">
<h1> 인증이 완료되었습니다. </h1>
	<button id="btnLogin" class="btn_type">
		<a href="/member/login"><span>로그인&nbsp 하러가기</span></a>
	</button>
</div>

</body>
</html>