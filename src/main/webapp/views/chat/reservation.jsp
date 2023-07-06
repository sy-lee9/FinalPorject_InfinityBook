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

	<c:if test="${reservation.RENT_IDX == null}">
	<form action="changereservation.do">
		<input type="hidden" name="CODE_IDX" value="${reservation.CODE_IDX}"/>
		<input type="hidden" name="CHANGE_IDX" value="${reservation.CHANGE_IDX}"/>
		<input type="hidden" name="other_nick" value="${reservation.other_nick}"/>					
		<div>교환할 책</div>
		<input type="text" name="LIBRARY_BOOK2" value="${reservation.LIBRARY_BOOK2}">
		<div>교환 일</div>
		<input type="text" name="CHANGE_DATE" value="${reservation.CHANGE_DATE}">
		<button type="submit">확인</button>	
	</form>	
	</c:if>
	
	<c:if test="${reservation.CHANGE_IDX == null}">	
	<form action="rentreservation.do">
		<input type="hidden" name="CODE_IDX" value="${reservation.CODE_IDX}"/>
		<input type="hidden" name="RENT_IDX" value="${reservation.RENT_IDX}"/>
		<input type="hidden" name="other_nick" value="${reservation.other_nick}"/>						
		<div>보증금</div>
		<input type="text" name ="RENT_DEPOSIT" value="${reservation.RENT_DEPOSIT}">
		<div>대여 일</div>
		<input type="text" name ="RENT_STARTDATE" value="${reservation.RENT_STARTDATE}">
		<div>반납 일</div>
		<input type="text" name ="RENT_ENDDATE" value="${reservation.RENT_ENDDATE}">
		<button type="submit">확인</button>							
	</form>
	</c:if>
	
</body>
<script></script>
</html>