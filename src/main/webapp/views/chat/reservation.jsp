<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style></style>
</head>
<body>

	<c:if test="${reservation.rent_idx == null}">
	<form action="changereservation.do">
		<input type="hidden" name="library_book" value="${reservation.library_idx}"/>
		<input type="hidden" name="change_idx" value="${reservation.change_idx}"/>			
		<div>교환할 책</div>
		<input type="text" name="library_book2" value="${reservation.library_book2}">
		<div>교환 일</div>
		<input type="text" name="change_date" value="${reservation.change_date}">
		<button type="submit">확인</button>	
	</form>	
	</c:if>
	
	<c:if test="${reservation.change_idx == null}">	
	<form action="rentreservation.do">
		<input type="hidden" name="library_idx" value="${reservation.library_idx}"/>
		<input type="hidden" name="rent_idx" value="${reservation.rent_idx}"/>			
		<div>보증금</div>
		<input type="text" name ="rent_deposit" value="${reservation.rent_deposit}">
		<div>대여 일</div>
		<input type="text" name ="rent_startdate" value="${reservation.rent_startdate}">
		<div>반납 일</div>
		<input type="text" name ="rent_enddate" value="${reservation.rent_enddate}">
		<button type="submit">확인</button>							
	</form>
	</c:if>
	
</body>
<script></script>
</html>