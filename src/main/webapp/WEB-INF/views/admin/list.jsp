<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
    
<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<!-- jQuery 2.2.4 -->
<!-- <script type="text/javascript" -->
<!--  src="http://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
   z-index: 1;
   position: absolute;
   right: 200px;
   height: 100px;
   margin: auto;
   text-align: center;
}

#over {
overflow: hidden;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 1; 
-webkit-box-orient: vertical;
word-wrap:break-word; 
height: 30px; 
white-space: nowrap;
}

</style>



	<h1 style="text-align: center; "><a href="/admin/list">게시판 관리</a></h1>
	<br>
	<br>
	
	<table class="table table-striped" border="1" style="text-align: center;
 	width: 80%; table-layout:fixed; margin: auto;">
	<tr>	
	<th style="text-align: center; width: 5%;"><input type="checkbox" id="checkAll" onclick="checkAll();"/></th>
	<th style="text-align: center; width: 10%;">글번호</th>
	<th style="text-align: center; width: 40%;">제목</th>
	<th style="text-align: center; width: 10%;">작성자</th>
	<th style="text-align: center; width: 10%;">조회수</th>
	<th style="text-align: center; width: 25%;">작성일</th>
	</tr>
	
	<c:forEach items="${list }" var="i">
		<tr>
			<td><input type="checkbox" name="checkRow" value="${i.BOARD_IDX }"/></td>
			<td>${i.BOARD_IDX }</td>
			<td><div id="over"><a href="/admin/boardview?board_idx=${i.BOARD_IDX }">${i.TITLE }</a></div></td>
			<td>${i.NICKNAME }</td>
			<td>${i.HIT }</td>
			<td><fmt:formatDate value="${i.WRITTENDATE }" pattern="yy-MM-dd HH:mm:ss" /></td>
		</tr>
	</c:forEach>
	</table>
<h4><span style="text-align: center; margin-left:1410px;">total : ${ABP.totalCount }</span></h4>


<div id="btnBox" style="margin-left: 500px;">


<button id="btnDelete" style = "color: red;">삭제</button>
</div>



<div class="form-row" style="margin: auto;">
	<div class="col-5">
	</div>
	<div class="col-2">
	<input class="form-control" type="text" id="search" />
	</div>
	<div class="col">
	<button id="btnSearch" class="btn">검색</button>
	</div>
</div> 

<br>

<c:import url="/WEB-INF/views/layout/adminboardpaging.jsp"></c:import>

<c:import url="/WEB-INF/views/layout/footer.jsp"/> 
