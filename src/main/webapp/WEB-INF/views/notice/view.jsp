<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.2.4.js"></script>
<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/notice/list");
	});
	
});

</script>
<style type="text/css">

#next > a{

font-size:16px;
}

#back > a{
font-size:16px;
}

#page{
margin-left: 50px;
margin-right:50px;
width:1200px;
margin-top: 50px;

}

.total {
	margin : 0 auto;
	width : 75%;
}
.sumnail{
	
	
	margin : 50px;
	width: 40%;
	float : left;
	position : relative; 
}

.info {
	margin : 80px;
	font-size : 16px;
}

.notice {
	font-size : 18px;
}

#filediv{
	position:absolute;
	top:600px;
	left:1100px;
}
#btnList {
width: 80px;
height: 40px;
background: #474e60;
font-size: 13px;
color: #fff;
border: solid 2px;
border-radius: 1px;
}
#btnUpdate{
	width: 80px;
	height: 40px;
	background: #1ec0ff;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
#btnDelete{
	width: 80px;
	height: 40px;
	background: #f1404b;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
</style>

</head>
<body>
<h1>게시판 view</h1>
<hr>


<h3 class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h3>


<div class="clearfix"></div>
<hr>


<div class="total">


<h1 class="pull-left">${notice.title }</h1><br><br><br><br>
<h5 class="pull-left">작성일 : <fmt:formatDate value="${notice.writtendate }" pattern="yyyy-MM-dd" /></h5>
<h5 class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 작성자 : ${notice.member_idx}  </h5>
<h5 class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${notice.hit }  </h5>
<div class="text-right">	
	<button id="btnList">목록</button>

	<button id="btnUpdate">수정</button>
	<button id="btnDelete">삭제</button>

</div>
<hr>

<div class = "notice">
${notice.content }
</div>

<div>
<a href="/file/download?fileno=${noticeFile.fileno }">${noticeFile.origin_name }</a>
</div>



</body>
</html>