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
		<c:if test="${RentList.size() == 0}">
			<h3>대여 가능 사용자가 없습니다.</h3>
		</c:if>
		<c:if test="${RentList.size() != 0}">
			<h3>대여 가능 사용자</h3>
		</c:if>
		<c:forEach var="user" items="${RentList}" varStatus="status">
			<h3>${user.member_nickname}</h3>
			<h3>${user.code_codename}</h3>
			<button type="button" onclick="(function() {
				  var url = '/searchDetail.do?library_idx=' + '${user.library_idx}';
				  window.opener.location.href = url;
				  self.close();
				})()">이동</button>
		</c:forEach>

		<c:if test="${ChangeList.size() == 0}">
			<h3>교환 가능 사용자가 없습니다.</h3>
		</c:if>
		<c:if test="${ChangeList.size() != 0}">
			<h3>교환 가능 사용자</h3>
		</c:if>
		<c:forEach var="user" items="${ChangeList}" varStatus="status">
			<h3>${user.member_nickname}</h3>
			<h3>${user.code_codename}</h3>
			<button type="button" onclick="(function() {
				  var url = '/searchDetail.do?library_idx=' + '${user.library_idx}';
				  window.opener.location.href = url;
				  self.close();
				})()">이동</button>
		</c:forEach>
</body>
<script></script>
</html> 