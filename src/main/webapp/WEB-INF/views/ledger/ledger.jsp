<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- bootstrap 4.3.1 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
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

	<div class="modal fade" id="ModalWrite" tabindex="-1" role="dialog"
		aria-labelledby="ModalWrite" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<form action="/ledger/write" method="post">
				
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<br>
					<h2 style="text-align: center">가계부 작성</h2>
					<div class="modal-header">
						<input type="text" style="width: 98%;" id="item" name="item"
							 placeholder="사유 입력" />
					</div>
					<div class="modal-body">
						<textarea style="width: 49%;"
							id="plusM" name="plusM" placeholder="수입 입력"></textarea>
						<textarea style="width: 49%;" 
							id="minusM" name="minusM" placeholder="지출 입력"></textarea>
					</div>

					<div class="modal-footer">
						<button type="submit">작성</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<h1 style="text-align: center;">
		<a href="/ledger/ledger">가계부</a>
	</h1>
	<div style="width: center;">
		<br> <br>
		<table class="table table-striped" border="1"
			style="text-align: center; width: 60%; margin-left: auto; margin-right: auto;">
			<tr>

				<th style="text-align: center;">날짜</th>
				<th style="text-align: center;">사유</th>
				<th style="text-align: center;">수입</th>
				<th style="text-align: center;">지출</th>

			</tr>

			<c:forEach items="${list }" var="i">
				<tr>
					<td><fmt:formatDate value="${i.WRITTENDATE }"
							pattern="yyyy-MM-dd" /></td>
					<td>${i.ITEM }</td>
					<td>${i.PLUSM }</td>
					<td>${i.MINUSM }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<h4>
		<span style="text-align: center; margin-left: 1430px;">${totalplus.getWrittendate()}
			수입 : ${totalplus.getPlusM() }</span>
	</h4>
	<h4>
		<span style="text-align: center; margin-left: 1430px;">${totalminus.getWrittendate()}
			지출 : ${totalminus.getMinusM() }</span>
	</h4>

	<br>


	<div id="btnBox" style="margin-left: 500px">

		<!-- Button trigger modal -->
		<span><button type="button" data-toggle="modal" data-target="#ModalWrite">작성</button></span> 
		<span><a href="/main"><button>메인</button></a></span>

		&nbsp;&nbsp;&nbsp;&nbsp;

	</div>




	<c:import url="/WEB-INF/views/layout/ledgerpaging.jsp"></c:import>

</body>
</html>