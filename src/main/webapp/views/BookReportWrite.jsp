<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>

	<style>
	div{
	display:block;
	}
	
	</style>
</head>
<body>
	<form action="BookReportWrite.do" method="post">
	<h3>감상문 등록</h3>
	<select name="reportOpen" id="reportOpen">
	    <option value="select">공개여부</option>
	    <option value="open">공개</option>
	    <option value="hide">비공개</option>
  	</select>
	<input type="text" value="제목을 입력해주세요."/>
	<h3>텍스트 에디터 들어갈 자리</h3>
	<input type="submit" value="등록"/>
	</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script></script>
</html>