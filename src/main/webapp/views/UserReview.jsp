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
	<form action="BookReview.do" method="post">
		<h3>도서 리뷰 작성</h3>
		<table>
			<tr>
				<th rowspan="3" style="width: 40%;">
					<img src="${book.library_cover}" alt="book" class="single-image">
				</th>
				<th rowspan="3" style="width: 5%;">
					
				</th>
				<td style="width: 55%;">
					<input type="button" class="btn btn-outline-accent btn-accent-arrow" value="${book.library_use}">
					
					<table>
						<tr>
							<th colspan="3"><h3 class="item-title">${book.library_title}</h3></th>
						</tr>
						<tr>
							<td><div class="author-name">By. ${book.library_author}</div></td>
							<td><div class="author-name">${book.library_publisher}</div></td>
							<td><div class="author-name">${book.library_pubdate}</div></td>
						</tr>
						<tr>
							<td colspan="3"><h4 class="item-title">Book Info </h4><div class="author-name">${book.library_info}</div></td>
						</tr>
						<tr>
							<td colspan="3">
								<h4 class="item-title">책 소개</h4>
							${book.library_description}<br/>
							</td>
						</tr>
						<tr>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="text" value="리뷰 내용을 입력해주세요."/>
		<input type="submit" value="등록"/>
		<input type="button" value="취소"/>
		</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script></script>
</html>