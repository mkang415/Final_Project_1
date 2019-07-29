<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메모 상세 보기</h1>
<hr>

<div style="width: 300px; border: 1px solid #eee; float: left"
 onclick="location.href='/memo/list'">
	<div style="height: 60px; border: 1px solid #eee;">
		<h4>${memo.getTitle()}</h4>
	</div>
	<div style="border: 1px solid #eee;">
		${memo.getMemo()}
	</div>
</div>
</body>
</html>