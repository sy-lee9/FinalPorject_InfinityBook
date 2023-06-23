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
	<c:forEach var="entry" items="${result}" varStatus="status">
		<c:if test="${status.index==2}"> 
			<table>
			<c:forEach var="result" items="${entry.value}" varStatus="status">
				<tr>
					<td>${result}</td>
					<td>${result.author}</td>
					<td>${result.description}</td>
					<td><img width="300" src="${result.cover}"/></td>
					<td>${result.publisher}</td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
  		
	</c:forEach>
</body>
<script></script>
</html>