<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#Diary</title>

<style type="text/css">

.wrapper {
/* 	background: black; */
}

.diary {
	background: white;
	width: 50em;
	margin-left: 20%;
	margin-right: 20%;
}

</style>

</head>
<body>

<h1 style="text-align:center">Diary</h1>
<hr>
<div class="wrapper">

<c:forEach items="${diaryList }" var="list">
<div class="diary">
<h4>${list.diary_idx }</h4>
<h4>작성일 ${list.writtendate }</h4>

<div class="title">${list.title }</div>
<div class="content">${list.content }</div>
</div>
<hr>
</c:forEach>
</div>



</body>
</html>