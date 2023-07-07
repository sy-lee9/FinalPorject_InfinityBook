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
			
		<c:forEach var="user" items="${list}" varStatus="status">
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