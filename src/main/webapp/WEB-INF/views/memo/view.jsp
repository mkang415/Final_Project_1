<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!-- owl carousel -->
<link rel="stylesheet" href="/resources/owlcarousel/owl.carousel.min.css">
<script src="/resources/owlcarousel/owl.carousel.min.js"></script>
<link rel="stylesheet" href="/resources/owlcarousel/owl.theme.default.min.css">

<h3 style="margin: 10px">중요 메모</h3>
<div style="width: 1100px;">

<div id="owl-one" class="owl-carousel owl-theme">
<c:if test="${fn:length(impMemoList) gt 0 and impMemoList ne null}">
<c:forEach items="${impMemoList }" begin="0" end="${fn:length(impMemoList)-1}" step="3" varStatus="st">
<div class="item">

<c:if test="${st.end >= st.index+2}">
	<c:forEach items="${impMemoList }" var="i" begin="${st.index}" end="${st.index+2}">
	<div class="card" style="width: 300px; height: 400px; float: left; overflow: hidden; margin: 10px">
  		<div class="card-header" style="height: 60px;">
			<button type="button" onclick="unmark('${i.MEMO_IDX}')">해제</button>
			${i.TITLE }
			<button type="button" onclick="deleteMemo('${i.MEMO_IDX}')">삭제</button>
  		</div>
  		<div class="card-body" style="height: 338px;" data-toggle="modal" data-target="#impModal${i.MEMO_IDX}">
    		<p class="card-text">${i.MEMO }</p>
  		</div>
	</div>
	</c:forEach>
</c:if>

<c:if test="${st.end < st.index+2}">
	<c:forEach items="${impMemoList }" var="i" begin="${st.index}" end="${st.end}">
	<div class="card" style="width: 300px; height: 400px; float: left; overflow: hidden; margin: 10px">
  		<div class="card-header">
  			<button type="button" onclick="unmark('${i.MEMO_IDX}')">해제</button>
    		${i.TITLE }
			<button type="button" onclick="deleteMemo('${i.MEMO_IDX}')">삭제</button>
  		</div>
  		<div class="card-body" data-toggle="modal" data-target="#impModal${i.MEMO_IDX}">
    		<p class="card-text">${i.MEMO }</p>
  		</div>
	</div>
	</c:forEach>
</c:if>

</div>
</c:forEach>
</c:if>
</div>

<c:forEach items="${impMemoList }" var = "i">
	<!-- Modal -->
	<div class="modal fade" id="impModal${i.MEMO_IDX}" tabindex="-1" role="dialog" aria-labelledby="impModal${i.MEMO_IDX}" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-scrollable" role="document">
    		<div class="modal-content">
    			<form action="/memo/update" method = "post">
    			<input type="hidden" name = "memo_idx" value="${i.MEMO_IDX}"/>
      			<div class="modal-header">
      				<input type="text" style="width: 94%" id="title" name = "title" value="${i.TITLE}"/>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
     	 		<div class="modal-body">
        			<textarea id="summernote${i.MEMO_IDX}" name="memo" style="width: 94%">${i.MEMO}</textarea>
      			</div>
      			<div class="modal-footer">
      				<button type="submit" class="btn btn-primary">수정</button>        			
      			</div>
      			</form>
    		</div>
  		</div>
	</div>
<script>
	$('#summernote${i.MEMO_IDX}').summernote({
		height: 300,
	  	minHeight: null,
	  	maxHeight: null,
	  	focus: true,
	  	lang: 'ko-KR', // default: 'en-US'
	  	toolbar: [
	  	    // [groupName, [list of button]]
	  	    ['style', ['bold', 'italic', 'underline', 'clear']],
	  	    ['font', ['strikethrough']],
	  	    ['color', ['color']],
	  	    ['para', ['ul', 'ol', 'paragraph']],
	  	    ['height', ['height']],
	  	  	['insert', ['link']]
	  	  ]
	});
</script>
</c:forEach>
</div>
<br>

<h3 style="margin: 10px">새 메모</h3>
<div style="width: 1000px">

<div id="owl-two" class="owl-carousel owl-theme">
<c:if test="${fn:length(memoList) gt 0 and memoList ne null}">
<c:forEach items="${memoList }" begin="0" end="${fn:length(memoList)-1}" step="6" varStatus="st">
<div class="item">

<c:if test="${st.end >= st.index+5}">
	<c:forEach items="${memoList }" var="m" begin="${st.index}" end="${st.index+5}">
	<div class="card" style="width: 300px; height: 400px; float: left; overflow: hidden; margin: 10px">
  		<div class="card-header">
			<button type="button" onclick="mark('${m.MEMO_IDX}')">마킹</button>
			${m.TITLE }
			<button type="button" onclick="deleteMemo('${m.MEMO_IDX}')">삭제</button>
  		</div>
  		<div class="card-body" data-toggle="modal" data-target="#impModal${m.MEMO_IDX}">
    		<p class="card-text">${m.MEMO }</p>
  		</div>
	</div>
 	</c:forEach>
</c:if>

<c:if test="${st.end < st.index+5}">
	<c:forEach items="${memoList }" var="m" begin="${st.index}" end="${st.end}">
	<div class="card" style="width: 300px; height: 400px; float: left; overflow: hidden; margin: 10px">
  		<div class="card-header">
			<button type="button" onclick="mark('${m.MEMO_IDX}')">마킹</button>
			${m.TITLE }
			<button type="button" onclick="deleteMemo('${m.MEMO_IDX}')">삭제</button>
  		</div>
  		<div class="card-body" data-toggle="modal" data-target="#impModal${m.MEMO_IDX}">
    		<p class="card-text">${m.MEMO }</p>
  		</div>
	</div>
 	</c:forEach>
</c:if>

</div>
</c:forEach>
</c:if>
</div>

<c:forEach items="${memoList }" var = "m">
	<!-- Modal -->
	<div class="modal fade" id="modal${m.MEMO_IDX}" tabindex="-1" role="dialog" aria-labelledby="modal${m.MEMO_IDX}" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-scrollable" role="document">
    		<div class="modal-content">
    			<form action="/memo/update" method = "post">
    			<input type="hidden" name = "memo_idx" value="${m.MEMO_IDX}"/>
      			<div class="modal-header">
      				<input type="text" style="width: 94%" id="title" name = "title" value="${m.TITLE}"/>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
     	 		<div class="modal-body">
        			<textarea id="summernote${m.MEMO_IDX}" name="memo" style="width: 94%">${m.MEMO}</textarea>
      			</div>
      			<div class="modal-footer">
      				<button type="submit" class="btn btn-primary">수정</button>
      			</div>
      			</form>
    		</div>
  		</div>
	</div>
<script>
	$('#summernote${m.MEMO_IDX}').summernote({
		height: 300,
	  	minHeight: null,
	  	maxHeight: null,
	  	focus: true,
	  	lang: 'ko-KR', // default: 'en-US'
	  	toolbar: [
	  	    // [groupName, [list of button]]
	  	    ['style', ['bold', 'italic', 'underline', 'clear']],
	  	    ['font', ['strikethrough']],
	  	    ['color', ['color']],
	  	    ['para', ['ul', 'ol', 'paragraph']],
	  	    ['height', ['height']],
	  	  	['insert', ['link']]
	  	  ]
	});
</script>
</c:forEach>
</div>

<script>

$('#owl-one').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    items:1
});

$('#owl-two').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    items:1
});

</script>