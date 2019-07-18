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


<style type="text/css">

#btnBox {


	margin-left: 1200px;
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
	<div class="allCheck">
		<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">All</label>
	
		<script>
		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});
		</script>
	</div>
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
			<div class="checkBox">
				<input type="checkbox" name="chBox" class="chBox" data-BOARD_IDX="${i.BOARD_IDX }"/>
				
				<script>
					$(".chBox").click(function(){
						$("#allCheck").prop("checked", false);
					});
				</script>
			</div>
			<td>${i.BOARD_IDX }</td>
			<td><a href="/board/view?BOARD_IDX=${i.BOARD_IDX }">${i.TITLE }</a></td>
			<td>${i.CONTENT }</td>
			<td>${i.NICKNAME }</td>
			<td>${i.HIT }</td>
			<td>${i.RECOMMEND }</td>
			<td>${i.WRITTENDATE }</td>
		</tr>
	</c:forEach>
	</table>

<c:import url="/WEB-INF/views/layout/adminboardpaging.jsp"></c:import>
<div id="btnBox">
<button type="button" onclick="location.href='/main'">메인</button>
<br>
<br>
<div class="delete">
	<button type="button" class="delete_btn" data-board_idx="${i.BOARD_IDX }">삭제</button>
</div>
<div class="delBtn">
	<button type="button" class="selectDelete_btn">선택 삭제</button>
	
	<script>
		$(".selectDelete_btn").click(function(){
			var confirm_val = confirm("삭제하시겠습니까?");
			
			if(confirm_val) {
				var checkArr = new Array();
				
				$("input[class='chBox']:checked").each(function(){
					checkArr.push($(this).attr("data-BOARD_IDX"));
				});
				
				$.ajax({
					url : "/admin/delete",
					type : "post",
					data : { chbox : checkArr },
					success : function(){
						location.href = "/admin/list";
					}
				});
			}
		});
	</script>
</div>
</div>




</body>
</html>