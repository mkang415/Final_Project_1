<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
   
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">   

<!-- bootstrap 4.3.1 -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!--    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!--    crossorigin="anonymous"></script> -->
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

<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#search").click(function() {

		
		$form = $("<form>").attr({
			action: "/ledger/search",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"datepicker",
				value: $('#datepicker').val()
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"datepicker2",
				value: $('#datepicker2').val()
			})
		);

		$(document.body).append($form);
		$form.submit();
	});
});
	</script>

</head>
<body>
   From: <input type="text" id="datepicker">
    To: <input type="text" id="datepicker2">
 
    <script>
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+100Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
            
               ,showButtonPanel: true
               ,currentText: '오늘 날짜'
               ,closeText: '닫기'
               
            });
 
            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
            
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 설정
            $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
    </script>

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
                      placeholder="항목 필수 입력" />
               </div>
               <div class="modal-body">
               <h4 style="text-align: center">수입/지출</h4>
                  <input type="number" style="width: 49%;"
                     id="plusM" name="plusM" value=0 min=0>
                  <input type="number" style="width: 49%;" 
                     id="minusM" name="minusM" value=0 min=0>
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
   <h4>
      <span style="text-align: center; margin-left: 1430px;">${totalminus.getWrittendate()}
         결산 : ${totalplus.getPlusM()+totalminus.getMinusM() }</span>
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