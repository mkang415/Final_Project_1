<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<script type="text/javascript"
src="http://code.jquery.com/jquery-2.2.4.min.js"></script>



<style>
#modal {
  display: none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}  

#modal_table {
	display:table;
	position:relative;
	width:100%;
	height:200px;
	border:2px solid #666;
} 
</style>

<div id="modal">
   
    <div class="modal_content">
        <h2 style="text-align: center">정말로 탈퇴하시겠어요? <br>모든 데이터가 날아갑니다!</h2>
        
       
       <br><br>
       <div>
       	<a href="/member/delete"><button>확인</button></a>
	</div>
    </div>
   
 	   <div class="modal_layer"></div>
    
    
</div>


	<span id="root">
	<img id="modal_open_btn" src="/resources/img/drop.png" width="90px" height="90px">
	</span>


<script>
$("#modal_open_btn").click(function(){
    $("#modal").attr("style", "display:block");
});

 $("#modal_close_btn").click(function(){
    $("#modal").attr("style", "display:none");
});     
</script>











































