<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script type="text/javascript">
$(document).ready(function() {
		
		$("#btnSearch").click(function() {
				location.href="/admin/list?search="+$("#search").val();
		});
	
		//선택체크 삭제
		$("#btnDelete").click(function(){
				//석택된 체크박스
				var $checkboxes
				= $("input:checkbox[name='checkRow']:checked");
				
				//체크된 대상들을 map으로 만들고 map을 문자열로 만들기
				var map = $checkboxes.map(function() {
						return $(this).val();
				});
				var names = map.get().join(",");
				console.log("names : " + names);
				
				// 전송 폼
				var $form = $("<form>")
						.attr("action", "/admin/deletelist")
						.attr("method", "post")
						.append(
								 $("<input>")
										.attr("type", "hidden")
										.attr("name", "names")
										.attr("value", names)
						);
				$(document.body).append($form);
				$form.submit();
		});
	
});

// 전체 체크/해제
function checkAll() {
		// checkbox들
		var $checkboxes=$("input:checkbox[name='checkRow']");
		
		// checkAll 체크상태 (true:전체선택, false:전체해제)
		var check_status = $("#checkAll").is(":checked");
		
		if( check_status ) {
				//전체 체크박스를 checked로 바꾸기
				$checkboxes.each(function() {
						this.checked = true;
				});
		} else {
				//전체 체크박스를 checked 해제하기
				$checkboxes.each(function() {
						this.checked = false;
				});
		}
}

</script>

<style type="text/css">

#btnBox {
	position: absolute;
	right: 400px;
	height: 100px;
	margin: auto;
	text-align: center;
}

</style>

</head>
<body>
	<h1 style="text-align: center; "><a href="/admin/list">게시판 관리</a></h1>
	<br>
	<br>
	<table class="table table-striped" border="1" style="text-align: center;
 	width: 80%; margin-left: auto; margin-right: auto;">
	<tr>	
	<th style="text-align: center;"><input type="checkbox" id="checkAll" onclick="checkAll();"/></th>
	<th style="text-align: center;">글번호</th>
	<th style="text-align: center;">제목</th>
	<th style="text-align: center;">내용</th>
	<th style="text-align: center;">작성자</th>
	<th style="text-align: center;">조회수</th>
	<th style="text-align: center;">추천수</th>
	<th style="text-align: center;">작성일</th>
	</tr>
	
	<c:forEach items="${list }" var="i">
		<tr>
			<td><input type="checkbox" name="checkRow" value="${i.BOARD_IDX }"/></td>
			<td>${i.BOARD_IDX }</td>
			<td><a href="/admin/boardview?board_idx=${i.BOARD_IDX }">${i.TITLE }</a></td>
			<td>${i.CONTENT }</td>
			<td>${i.NICKNAME }</td>
			<td>${i.HIT }</td>
			<td>${i.RECOMMEND }</td>
			<td><fmt:formatDate value="${i.WRITTENDATE }" pattern="yy-MM-dd HH:mm:ss" /></td>
		</tr>
	</c:forEach>
	</table>
<h4><span style="text-align: center; margin-left:1430px;">total : ${ABP.totalCount }</span></h4>


<div id="btnBox">

<a href="/main"><button>메인</button></a>

&nbsp;&nbsp;&nbsp;&nbsp;

<button id="btnDelete" style = "color: red;">삭제</button>
</div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" />
	<button id="btnSearch" class="btn">검색</button>
</div> 

<c:import url="/WEB-INF/views/layout/adminboardpaging.jsp"></c:import>



</body>
</html>