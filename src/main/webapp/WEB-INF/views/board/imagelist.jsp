<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${mainImage eq 'none' || mainImage eq image.storename}">
		<input type="hidden" name="mainimage" value="${image.storename}"/>
		<div class="card border-success mb-3" style="width: 200px; height: 250px; float: left;">
		<img src="/resources/boardimg/${image.storename}" class="card-img-top">
  			<div class="card-body">
    			<h5 class="card-title">${image.originname}</h5>
  			</div>
		</div>
	</c:when>
	<c:when test="${mainImage ne 'none' && mainImage ne image.storename}">
		<div class="card border-light mb3" style="width: 200px; height: 250px; float: left;")">
  			<img src="/resources/boardimg/${image.storename}" class="card-img-top">
  			<div class="card-body">
    			<h5 class="card-title">${image.originname}</h5>
  			</div>
		</div>
	</c:when>

</c:choose>
