<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="form-inline text-center" style="margin-bottom: 30px;">
	<input type="hidden" name="step" id="step" value="${step }"/>
	<span>${writer }&nbsp 님에 대한 답글입니다.</span>
	
<%-- 	<input type="text" size="7" class="form-control"
		id="commentWriter"
		value="${sessionScope.nick }" readonly="readonly"/> --%>
	<textarea rows="2" cols="60"
		class="form-control" id="commentContent">RE</textarea>
	<button class="btn" onclick="insertReply()">입력</button>
</div>	<!-- 댓글 입력 end -->

</body>
</html>