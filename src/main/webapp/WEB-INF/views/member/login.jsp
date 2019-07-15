<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.error {
	font-size: 10px;
	color: red;
}

.join_content {
	margin: 0 auto;
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
</style>
</head>
<body>
<h1>로그인 화면</h1>
<hr>



<form action="/member/login" method="post">

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
			<span class="intext"> <input type="text" id="pw"
				name="pw" class="inputtext" maxlength="40" /></span>
			</div>
</div>
	<button id="btnLogin" class="btn_type">
		<span>로그인</span>
	</button>
</form>




</body>
</html>