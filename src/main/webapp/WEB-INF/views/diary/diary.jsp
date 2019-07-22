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
	background: #E3CEF6;
}

.diary {
	background: white;
	width: 40%;
	margin-left: 30%;
	margin-right: 30%;
	margin-bottom: 100px;
}

.selector img{
width: 100%;
height: 100%;
}

</style>

</head>
<body>

<h1 style="text-align:center">Diary</h1>
<hr>
<div class="wrapper">

<button type="button" onClick="location.href='/diary/write'">글쓰기</button>

<c:forEach items="${diaryList }" var="list">
<div class="diary">
<h4>작성일 <fmt:formatDate value="${list.writtendate }" pattern="yyyy-MM-dd"/></h4>

<div class="title"><h2>${list.title }</h2></div>
<div class="content">${list.content }</div>
</div>

<div align="center">
	<button type="button" onClick="location.href='/diary/delete?diary_idx=${list.diary_idx}'">삭제</button> 
	<button type="button" onClick="location.href='/diary/modify?diary_idx=${list.diary_idx}'">수정</button>
</div>

<hr>
</c:forEach>
</div>

<div id="pagingbox" align="center">
	<c:import url="/WEB-INF/views/layout/diaryPaging.jsp" />
</div>

</body>
</html>