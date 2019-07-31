<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<h1>메모 상세 보기</h1>
<hr>

<div style="width: 300px; border: 1px solid #eee; float: left">
	<div style="height: 60px; border: 1px solid #eee;">
		<h4>${memo.getTitle()}
		<button type="button" onclick="location.href='/memo/update?memoidx=${memo.getMemo_idx()}'">수정</button>
		<button type="button" onclick="location.href='/memo/delete?memoidx=${memo.getMemo_idx()}'">삭제</button></h4>
	</div>
	<div style="border: 1px solid #eee;" onclick="location.href='/memo/list'">
		${memo.getMemo()}
	</div>
</div>
</body>
</html>