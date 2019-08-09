<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<!-- header -->


<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

window.onload = function() {
	
	var content = document.getElementsByClassName('content');
	var openDiv = document.getElementsByClassName('openDiv');
	var collapseDiv = document.getElementsByClassName('collapseDiv');
	
	for(var i=0; i<content.length; i++) {

		content[i].value=i;
		openDiv[i].value=i;
		collapseDiv[i].value=i;
		console.log(openDiv[i].value)
// 		console.log(content[i].value);
// 		console.log(content[i].scrollHeight);
		
		if(content[i].scrollHeight>500) {
			content[i].style.height = '20em';
			openDiv[i].style.display = 'block';
			
		}
		
	}
	
}



function clickOpenBtn(value) {
	
	var content = document.getElementsByClassName('content');
	var openDiv = document.getElementsByClassName('openDiv');
	var collapseDiv = document.getElementsByClassName('collapseDiv');
	
	for(i=0; i<content.length; i++) {
		if(value==i) {
		openDiv[i].style.display = 'none';
		collapseDiv[i].style.display = 'block';
		content[i].style.height = 'auto';
			
		}
	}
}

function clickCollapseBtn(value) {
	
	var content = document.getElementsByClassName('content');
	var openDiv = document.getElementsByClassName('openDiv');
	var collapseDiv = document.getElementsByClassName('collapseDiv');
	
	for(i=0; i<content.length; i++) {
		if(value==i) {
		openDiv[i].style.display = 'block';
		collapseDiv[i].style.display = 'none';
		content[i].style.height = '20em';
		
		}
	}
	
}

</script>


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
 	background: #F1F1F1; 
/*   	background-image: url('resources/diary/img/bggrey.jpg'); */
	min-height: 100%;

}



.diary {

	position: relative;

	background: white;
/* 	width: 50%; */
 	margin-left: 25%;
	margin-right: 25%;
	margin-top: 50px;
	margin-bottom: 200px;
	
	padding: 30px;
	
    box-shadow: 0px 0px 20px -5px rgba(0, 0, 0, 0.8);
}

.content {
	height: none;
	min-height: 20em;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 50px;
	overflow: hidden;
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
	height: 2em;
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
	
	cursor: pointer;
}

#write img {
	position: absolute; top:0; left: 0;
	width: 100%;
	height: 100%;
}

.openDiv {
	display: none;
	height: 3em;
	width: 92%;
	bottom: 1.8em;
	position: absolute;
	box-shadow: inset 0px -20px 20px -5px rgba(255, 255, 255, 1);
	align: center;

}

.openBtn {
	border-radius : 28px;
	position: absolute;
/* 	width: 10%; */
	bottom: 0.7em;
	left: 45%;
	background-color: rgb(81, 81, 81);
	border: none;
	color: white;
}

.collapseDiv {
	display: none;
	height: 3em;
	width: 92%;
	bottom: 1.8em;
	position: absolute;
	box-shadow: inset 0px -20px 50px 0px rgba(255, 255, 255, 1);
	align: center;

}

.collapseBtn {
	border-radius : 28px;
	position: absolute;
/* 	width: 10%; */
	bottom: 0.7em;
	left: 45%;
	background-color: rgb(81, 81, 81);
	border: none;
	color: white;
}

.btnBox {
	position: absolute;
	width: auto;
	height: 1em;
	top: 1em;
	right: 1em;
	padding-left: 1em;
	padding-right: 1em;	
	padding-top: 0.5em;
	padding-bottom: 0.5em;		

}

#modal_delete {
	display: none;
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
}

#modal_delete .modal_content {
	position: fixed;
	top: 15%;
	left: 20%;

	width:auto;
	padding:10px;
	background:#fff;
	border:2px solid #666;
}

#modal_delete .modal_layer {
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.5);
	z-index:-1;
}

</style>

<div class="wrapper">

<div id="write"><img src="resources/diary/img/write.png" onClick="location.href='/diary/write'"></div>

<c:forEach items="${diaryList }" var="list">
<div class="diary">
<div class="datebox"><fmt:formatDate value="${list.writtendate }" pattern="yyyy.MM.dd hh:mm"/></div>
<div align="center" class="btnBox">
	<button type="button" id="modifyBtn" onClick="location.href='/diary/modify?diary_idx=${list.diary_idx}'"></button>
<%-- 	<button type="button" id="deleteBtn" onClick="location.href='/diary/delete?diary_idx=${list.diary_idx}'"></button>  --%>
	<button type="button" id="deleteBtn" onClick="deleteModalOpen(${list.diary_idx})"></button> 
</div>

<div class="title"><h1>${list.title }</h1></div>
<div class="content">${list.content }</div>

<div class="openDiv">
<button type="button" class="openBtn" onClick="clickOpenBtn(this.parentNode.value)">show all</button>
</div>
<div class="collapseDiv">
<button type="button" class="collapseBtn" onClick="clickCollapseBtn(this.parentNode.value)">collapse</button>
</div>

</div>

</c:forEach>

<div id="pagingbox" align="center">
	<c:import url="/WEB-INF/views/layout/diaryPaging.jsp" />
</div>

<!-- Delete Modal -->
<div id="modal_delete">

	<div class="modal_content">

	<div>
	<p>정말 삭제하시겠습니까?</p>
	<button type="button" onClick="deleteDiary()">확인</button>
	<button type="button" onClick="deleteModalClose()">취소</button>
	</div>
	</div>

	<div class="modal_layer"></div>
        
</div>
<!--  -->


<script type="text/javascript">

	function deleteDiary(diary_idx) {
		location.href='/diary/delete?diary_idx='+diary_idx;
		deleteModalClose();
	}

	function deleteModalOpen() {
		$("#modal_delete").attr("style", "display:block");
	}

	function deleteModalClose() {
		$("#modal_delete").attr("style", "display:none");
	}
</script>

</div>


<!-- footer -->
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>