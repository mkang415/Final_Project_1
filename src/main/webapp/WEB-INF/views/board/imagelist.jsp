<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div id = "image${image.image_idx}">
	<input type="hidden" name="image" value="${image.image_idx}">
	<div><img src = "/resources/boardimg/${image.storename}" width='240px' height='auto'/></div>
	<div><h6>${image.originname}</h6></div>
</div>