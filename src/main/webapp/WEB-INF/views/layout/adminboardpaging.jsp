<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="text-center">
   <ul class="pagination pagination-sm">
      <!-- 처음으로 가기 -->
      <c:if test="${ABP.curPage ne 1 }">
      <li>
         <a href="/admin/list?search=${ABP.search }"><span>&larr;처음</span></a>
      </li>
      </c:if>




      <!-- 이전 페이지 -->
      <!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
      <c:if test="${ABP.curPage eq 1 }">
      <li class="disabled">
         <span>&laquo;</span>
      </li>
      </c:if>

      <c:if test="${ABP.curPage ne 1 }">
      <li>
         <a href="/admin/list?curPage=${ABP.curPage-1 }&search=${ABP.search}"><span>&laquo;</span></a>
       </li>
       </c:if>





      <!-- 페이징 리스트 -->
      <c:forEach
        begin="${ABP.startPage }" end="${ABP.endPage }"
        var="i">
   
         <!-- 현재 보고 있는 페이지번호만 강조해주기 -->
         <c:if test="${ABP.curPage eq i}">
         <li class="active">
            <a href="/admin/list?curPage=${i }&search=${ABP.search}">${i }</a>
         </li>
         </c:if>
      
         <c:if test="${ABP.curPage ne i}">
         <li>
            <a href="/admin/list?curPage=${i }&search=${ABP.search}">${i }</a>
         </li>
         </c:if>
         
       </c:forEach>



      
      <!-- 다음 페이지 -->
      <c:if test="${ABP.curPage eq ABP.totalPage }">
      <li class="disabled">
         <span>&raquo;</span>
      </li>
      </c:if>

      <c:if test="${ABP.curPage ne ABP.totalPage }">
      <li>
         <a href="/admin/list?curPage=${ABP.curPage+1 }&search=${ABP.search}">
         <span>&raquo;</span>
      </a>
      </li>
      </c:if>
   </ul>
</div>