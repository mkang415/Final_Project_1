<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#Diary</title>

<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">

<style type="text/css">

body, html {
    margin: 0;
    padding: 0;
    height: 100%;
}

.wrapper {
	margin: 0 auto;
	padding: 0;
	padding-top: 50px;
	border: 0;
/* 	background: #E3CEF6; */
	background-image: url('resources/diary/img/bg.jpg');
	min-height: 100%;
}

.diary {

	position: relative;

	background: white;
/* 	width: 50%; */
 	margin-left: 25%;
	margin-right: 25%;
	margin-top: 50px;
	margin-bottom: 100px;
	
	padding: 30px;
	
    box-shadow: 0px 0px 20px -5px rgba(0, 0, 0, 0.8);
}

.content {
	min-height: 3em;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 50px;
}

.title {
	margin-top: 1em;
	border-bottom: 1px solid grey;
	text-align: center;
	font-family: 'Nanum Barun Gothic';

	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

img {
	display: block;
	margin: 0px auto;
	max-width: 100%;
}

#modifyBtn {
	background: url('resources/diary/img/edit-2.png') no-repeat;
	width: 36px;
	height: 36px;
	cursor: pointer;
	border: 0;
	outline: 0;
}

#deleteBtn {
	background: url('resources/diary/img/delete-3.png') no-repeat;
	width: 36px;
	height: 36px;
	cursor: pointer;
	border: 0;
	outline: 0;
}

.datebox {
	position: absolute;
	width: auto;
	height: 1em;
	top: 1.5em;
	left: -3em;
	padding-left: 1em;
	padding-right: 1em;	
	padding-top: 0.5em;
	padding-bottom: 0.5em;		
	
	font-family: 'Nanum Barun Gothic';
	font-size: 0.9em;
	color: white;
	background: #515151;
	
	box-shadow: 0px 0px 10px -5px rgba(0, 0, 0, 0.8);
}

#write {
	display: scroll;
	position: fixed;
	
	bottom: 7%;
	right: 4%;
	
	border-radius: 50%;
	height: 64px;
	width: 64px;
	background: white;
	box-shadow: 0px 0px 20px -5px rgba(0, 0, 0, 0.9);
}

#write img {
	position: absolute; top:0; left: 0;
	width: 100%;
	height: 100%;
}

</style>

</head>
<body>

<h1 style="text-align:center">Diary</h1>
<hr>
<div class="wrapper">

<div id="write"><img src="resources/diary/img/write.png" onClick="location.href='/diary/write'"></div>

<c:forEach items="${diaryList }" var="list">
<div class="diary">
<div class="datebox"><fmt:formatDate value="${list.writtendate }" pattern="yyyy.MM.dd hh:mm"/></div>

<div class="title"><h2>${list.title }</h2></div>
<div class="content">${list.content }</div>
</div>

<div align="center">
	<button type="button" id="deleteBtn" onClick="location.href='/diary/delete?diary_idx=${list.diary_idx}'"></button> 
	<button type="button" id="modifyBtn" onClick="location.href='/diary/modify?diary_idx=${list.diary_idx}'"></button>
</div>

</c:forEach>

<div id="pagingbox" align="center">
	<c:import url="/WEB-INF/views/layout/diaryPaging.jsp" />
</div>

</div>


</body>
</html>