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
<form action="changeapply.do"  method="post">
	<input type="text" name="LIBRARY_IDX" placeholder="교환신청할 책 idx"></input>
	<input type="text" name="LIBRARY_IDX2" placeholder="교환할 책 idx"></input>
	<input type="text" name="CHANGE_DATE" placeholder="희망 교환일자"></input>
	<button type="submit">신청</button>
</form>

<form action="rentapply.do"  method="post">
	<input type="text" name="LIBRARY_IDX" placeholder="대여신청할 책 idx">
	<input type="text" name="RENT_DEPOSIT" placeholder="희망 보증금액">
	<input type="text" name="RENT_STARTDATE" placeholder="희망 대여일자">
	<input type="text" name="RENT_ENDDATE" placeholder="희망 반납일자">
	<button type="submit">신청</button>
</form>

</body>
<script></script>
</html>