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

		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>

	<style>
	div{
	display:block;
	}
	
	</style>
</head>
<body>
	<c:forEach var="rep" items="${report}" varStatus="status">
		<figure class="product-style">
			<img src="${rep.cover}" alt="Books" class="product-item">
			<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
			<figcaption>
				<h3>${rep.title}</h3>
				<p>${rep.author}</p>
			</figcaption>
		</figure>
		<h3>${rep.member_nickname}</h3>
		<h3>${rep.book_report_date}</h3>
		<h3><a href="/BookReportDetail?book_report_idx=${rep.book_report_idx}">${rep.book_report_title}</a></h3>
		<h3>${rep.book_report_content}</h3>
	</c:forEach>
	
	
	<a href="/bookReportWrite.go"></a>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
</script>
</html>