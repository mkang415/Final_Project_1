<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${mainImage eq 'none' || mainImage eq image.storename}">
		<label class="btn btn-outline-primary active" style="width: 200px; height: 240px;">
			<img src="/resources/boardimg/${image.storename}" style="width: auto; max-width: 180px; height: auto; max-height: 180px;">
			<br>
    		<input type="radio" name="mainimage" id="${image.storename}" value="${image.storename}" autocomplete="off" checked>${image.originname}
  		</label>
	</c:when>
	<c:when test="${mainImage ne 'none' && mainImage ne image.storename}">
		
		<label class="btn btn-outline-primary" style="width: 200px; height: 240px;">
			<img src="/resources/boardimg/${image.storename}" style="width: auto; max-width: 180px; height: auto; max-height: 180px;">
			<br>
    		<input type="radio" name="mainimage" id="${image.storename}" value="${image.storename}" autocomplete="off">${image.originname}
  		</label>
	</c:when>

</c:choose>
