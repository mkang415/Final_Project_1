<%@page import="java.util.Calendar"%>
<%-- <%@page import="dto.MemberDto"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>




 
<% 
 String year = request.getParameter("year"); 
String month = request.getParameter("month"); 
 String day = request.getParameter("day"); 

// MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance(); 

int tyear = cal.get(Calendar.YEAR); 
int tmonth = cal.get(Calendar.MONTH) + 1; 
int tday = cal.get(Calendar.DATE); 
 %>


<script type="text/javascript">
$(document).ready(function() {
		$("#btnWrite").click(function(){
			$("form").submit();
		});
		
		$("#cancel").click(function(){
			history.back(-1);
		});
});
	

</script>

<style>



</style>

<div align="center">
<br>
<h3 style="text-align:center">▷ 일정 쓰기 ◁</h3>
<br>
<form action="/schedule/calwrite" method="post">

<table border="1" class="writetb" >
<col width="200px"><col width="100px">


<tr >
	<td style="text-align : center;"  class="table-success"  height="50">
	<label for="title">제목</label></td>
	
	<td style="text-align : center;">
	<input type="text" size="100%" style="padding:11px" name="title" placeholder="일정의 제목을 입력하세요!" />
	</td>
</tr>

<tr>
	<td style="text-align : center;"  class="table-warning" height="50"><label for="rdate">일정날짜</label></td>
	<td style="text-align : center;">
<!-- 10년 전부터 5년 후 까지 보여주기 -->
		<select name="year"> 
		
		<%	
			for(int i = tyear - 10; i < tyear + 6; i++){
				%>	
				<option <%=year.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>				
				<%
			}		
		%>
		
		</select>년
			
		<select name="month">
		<%	
			for(int i = 1; i <= 12; i++){
				%>	
				<option <%=month.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>				
				<%
			}		
		%>
		</select>월
				
		<select name="day" id="day">
		<%	
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>	
				<option <%=day.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>				
				<%
			}		
		%>
		</select>일	
		
		
	</td>
</tr>



<tr>
	<td style="text-align : center;" class="table-danger"><label for="content">내용</label></td>
	<td><textarea rows="20" cols="100%" name="content" id="summernote" style="text-align:left"
	 ></textarea>
	</td>
</tr>

</table>
<br><br>
<button type="button" class="btn btn-primary" id="btnWrite">작성</button>
<input type="reset" id="cancel"
		class="btn btn-danger" value="취소"/>
		
</form>

</div>



<script type="text/javascript">


$(document).ready(function() {

    $('#summernote').summernote({

height : 300, // 에디터의 높이 

minHeight : null,
maxHeight : null,
placeholder: "일정의 상세 내용을 입력하세요!",
focus : true,

toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ],
	
lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경

    });

});
var postForm = function() {

var contents =  $('textarea[name="content"]').html($('#summernote').code());
}





</script>