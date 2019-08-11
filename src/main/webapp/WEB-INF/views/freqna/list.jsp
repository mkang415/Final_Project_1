<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSearch").click(function() {
		location.href="/qna/newlist?search="+$("#search").val();
	});
});
</script>

<div style="width: 1000px; margin: auto;">
<h3>자주 묻는 질문</h3>
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
        <c:if test="${admin }">
			<button type="button" class="btn btn-outline-success btn-sm" onclick="location.href='/freqna/update?index=${f.FREQNA_IDX}'">수정</button>
			<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/freqna/delete?index=${f.FREQNA_IDX}'">삭제</button>
	  	</c:if>
      </h2>
      
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
<br>
<div>
<c:if test="${admin }">
<button type="button" class="btn btn-outline-primary" onclick="location.href='/freqna/write'">작성</button>
</c:if>
<button type="button" class="btn btn-outline-primary" onclick="location.href='/qna/newlist'">Q&A</button>

</div>
</div>
<br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>