<%@page import="java.util.Calendar"%>
<%-- <%@page import="dto.MemberDto"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp"/> 

<!-- summernote -->
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
				if($('#title').val()==''){
					alert('!일정의 제목을 입력해 주세요!');
					$('#title').focus();
					return;
				}
			$("form").submit();
		});
		
		$("#cancel").click(function(){
			history.back(-1);
		});
		
		
		
		
});
	

</script>


<style>


#background {
background-image : url('/resources/img/back4.jpg');
position: relative;
width:100%;
height:130%;
background-size: cover;
background-position: center center;

}


.table-bordered td{
 border:1px solid black;
}

.table-bordered th{
 border:1px solid black;
}

.table td, .table th {
    padding: 0.2rem;
}
</style>


<div id="background">

<div align="center">
<br>
<h3 style="text-align:center">▷ 일정 쓰기 ◁</h3>
<br>
<form action="/schedule/calwrite" method="post">

<table class="table table-bordered" style="width: 80%; table-layout:fixed;">
<col width="100"><col width="500">


<tr  >
	<th style="text-align : center;" class="table-active">
	<label for="title">제목</label></th>
	
	<td style="text-align : center;">
	<input type="text" size="100%" style="width: 100%; height: 100%; padding: 7px; "  id="title" name="title" placeholder="일정의 제목을 입력하세요!" />
	</td>
</tr>

<tr>
	<th style="text-align : center;"  class="table-active" height="50"><label for="rdate">일정날짜</label></th>
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
	<td colspan="2">
	<textarea rows="20" cols="100%" name="content" id="summernote" style="text-align:left" 
	 ></textarea>
	</td>
</tr>

</table>
<br><br>
<button type="button" class="btn btn-primary" id="btnWrite">작성</button>
<input type="reset" id="cancel"
		class="btn btn-danger" value="취소"/>
		
</form>
<br><br>
</div>
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

<c:import url="/WEB-INF/views/layout/footer.jsp"/>