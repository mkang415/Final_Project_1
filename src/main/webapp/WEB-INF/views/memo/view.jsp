<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>중요 메모</h3>
<div style="width: 1000px;">
<c:import url="/WEB-INF/views/layout/impMemoPaging.jsp"></c:import>
<c:forEach items="${impMemoList }" var = "i">
	<div style="width: 300px; height: 400px; border: 1px solid #eee; float: left; overflow: hidden">
		<div style="height: 60px; border: 1px solid #eee;">
			${i.TITLE }
			<button type="button" onclick="unmark('${i.MEMO_IDX}')">unmarking</button>
		</div>
		<div style="height: 338px; border: 1px solid #eee;" data-toggle="modal" data-target="#impModal${i.MEMO_IDX}">
			${i.MEMO }
		</div>
	</div>
	
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
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
<br><br><br>

<h3>새 메모</h3>
<div style="width: 1000px">
<c:import url="/WEB-INF/views/layout/memoPaging.jsp"></c:import>
<c:forEach items="${memoList }" var = "m">
	<div style="width: 300px; height: 400px; border: 1px solid #eee; float: left; overflow: hidden">
		<div style="height: 60px; border: 1px solid #eee;">
			${m.TITLE }
			<button type="button" onclick="mark('${m.MEMO_IDX}')">marking</button>
		</div>
			<div style="height: 338px; border: 1px solid #eee;" data-toggle="modal" data-target="#modal${m.MEMO_IDX}">
			${m.MEMO }
		</div>
	</div>
		
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
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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