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

<!-- bootstrap 4.3.1 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
 integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/qna/newlist?search="+$("#search").val();
	});
});
</script>
</head>
<body>
<h1>자주 묻는 질문</h1>
<hr>
<div class="accordion" id="accordionExample">
<c:forEach items="${frelist}" var = "f" varStatus="st">
  <div class="card">
    <div class="card-header" id="heading${st.index }">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${f.FREQNA_IDX}" 
         aria-expanded="true" aria-controls="collapse${st.index}">
          ${f.QUESTION }
        </button>
      </h2>
      <c:if test="${admin }">
			<button type="button" onclick="location.href='/freqna/update?index=${f.FREQNA_IDX}'">수정</button>
			<button type="button" onclick="location.href='/freqna/delete?index=${f.FREQNA_IDX}'">삭제</button>
	  </c:if>
    </div>

    <div id="collapse${f.FREQNA_IDX}" class="collapse" aria-labelledby="heading${st.index}" 
     data-parent="#accordionExample">
      <div class="card-body">
        ${f.ANSWER }
      </div>
    </div>
  </div>
</c:forEach>
</div>
<br><br>
<div>
<c:if test="${admin }">
<button type="button" onclick="location.href='/freqna/write'">작성</button>
</c:if>
<button type="button" onclick="location.href='/qna/newlist'">Q&A</button>
<button type="button" onclick="location.href='/main'">메인</button>
</div>

</body>
</html>