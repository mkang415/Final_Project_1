<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<style type="text/css">
table, th, tr {
	text-align: center;
}

.container {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
</style>

</head>
<body>
<h1>메모 페이지</h1>
<hr>
<button type="button" onclick="location.href='/memo/write'">메모 작성</button>
<br>

<div style="width: 1100px">
	<c:forEach items="${memoList }" var = "m">
		<div style="width: 300px; height: 400px; border: 1px solid #eee; float: left; overflow: hidden"
		 onclick="location.href='/memo/view?memoidx=${m.MEMO_IDX}'">
			<div style="height: 60px; border: 1px solid #eee;">
				<h4>${m.TITLE }</h4>
			</div>
			<div style="height: 338px; border: 1px solid #eee;">
				${m.MEMO }
			</div>
		</div>
	</c:forEach>
</div>
</body>
</html>