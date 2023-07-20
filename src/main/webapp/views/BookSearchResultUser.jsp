<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	h3.code{
	float:left;
	margin-right:100px;
	}
</style>

<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>

</head>
<body>
<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="loginBeforeBox.jsp" />            
        </c:otherwise>
    </c:choose>
		<c:if test="${RentList.size() == 0}">
			<h3>대여 가능 사용자가 없습니다.</h3>
		</c:if>
		<c:if test="${RentList.size() != 0}">
			<h3>대여 가능 사용자</h3>
		</c:if>
		<c:forEach var="user" items="${RentList}" varStatus="status">
		<div class="top-content">
			<h3>${user.member_nickname}</h3>
			<h3 class="code">${user.code_codename}</h3>
			<button type="button" onclick="(function() {
				  var url = '/searchDetail.do?library_idx=' + '${user.library_idx}';
				  window.opener.location.href = url;
				  self.close();
				})()">이동</button>
		</div>
			
		</c:forEach>

		<c:if test="${ChangeList.size() == 0}">
			<h3>교환 가능 사용자가 없습니다.</h3>
		</c:if>
		<c:if test="${ChangeList.size() != 0}">
			<h3>교환 가능 사용자</h3>
		</c:if>
		<c:forEach var="user" items="${ChangeList}" varStatus="status">
		<div class="top-content">
			<h3>${user.member_nickname}</h3>
			<h3 class="code">${user.code_codename}</h3>
			<button type="button" onclick="(function() {
				  var url = '/searchDetail.do?library_idx=' + '${user.library_idx}';
				  window.opener.location.href = url;
				  self.close();
				})()">이동</button>
		</div>
		</c:forEach>
</body>
<script></script>
</html> 