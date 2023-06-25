<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
		<title>Infinite B∞k</title>
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

		<!-- script -->
		<script src="/js/modernizr.js"></script>
		<script src="/js/jquery-1.11.0.min.js"></script>
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
	</head>

<body>

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">			
				<h2 class="page-title" style="margin-top: 25px;"> Library </h2>
				<div class="breadcrumbs">
					<h3 style="display:inline"><span class="item">책 등록</span></h3>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 0px;">
	<div class="container" >
		<form action="libraryWrite.do" method="post">
			<table>
				<tr>
					<td>
						<select name="LIBRARY_USE">
						  <option value="default">책의 용도</option>
						  <option value="소장">소장</option>
						  <option value="대여">대여 가능</option>
						  <option value="교환">교환 가능</option>
						  <option value="대여교환">대여/교환 가능</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<img src="${book.LIBRARY_COVER}" style="width:200px; height:200px;" alt="Books" class="product-item">	
					</td>
					<td>
						<div class="item-price"><h3>${book.LIBRARY_TITLE}</h3></div>
						<div class="item-price"><h4>${book.LIBRARY_AUTHOR}</h4></div>
						<div class="item-price"><h4>${book.LIBRARY_PUBLISHER}</h4></div>
						<div class="item-price">${book.LIBRARY_DESCRIPTION}</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="text" name="LIBRARY_INFO" id="LIBRARY_INFO" style="width:800px;" placeholder="책 상태를 설명해 주세요 ex) 표지 찢김 있지만 읽는 데 문제는 없습니다. ">
						<input type="submit"value="등록"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="MEMBER_IDX" value="1">	
			<input type="hidden" name="LIBRARY_COVER"value="${book.LIBRARY_COVER}">		
			<input type="hidden" name="LIBRARY_TITLE"value="${book.LIBRARY_TITLE}">				
			<input type="hidden" name="LIBRARY_AUTHOR" value="${book.LIBRARY_AUTHOR}">				
			<input type="hidden" name="LIBRARY_PUBLISHER" value="${book.LIBRARY_PUBLISHER}">				
			<input type="hidden" name="LIBRARY_PRICE" value="${book.LIBRARY_PRICE}">						
			<input type="hidden" name="LIBRARY_ISBN" value="${book.LIBRARY_ISBN}">							
			<input type="hidden" name="LIBRARY_PUBDATE" value="${book.LIBRARY_PUBDATE}">
			<input type="hidden" name="LIBRARY_DESCRIPTION" value="${book.LIBRARY_DESCRIPTION}">
		</form>
	</div>
	<div style="text-align:center;">
		<input type="button" onclick="location.href='./bookSelectPop.go?text='" value="검색 목록"/>
		<input type="button" onclick="window.close()" id="closeBtn" value="닫기"/>
	</div>
	
</section>

</body>

</html>