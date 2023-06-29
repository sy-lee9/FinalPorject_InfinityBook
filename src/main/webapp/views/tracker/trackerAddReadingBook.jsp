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

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>

	</head>

<body>
	<h3>읽고 있는 책 추가</h3>
	<hr>
	<table>
		<tr>
			<th>독서 시작일</th>
			<td><input type="text" name="startDate" id="startDate"  placeholder="독서 시작일" style="width:120px; margin-top: 20px;"></td>
		</tr>
		<tr>
			<th>읽은 페이지 수</th>
			<td>
				<input type="text" name="readPage" id="readPage"  placeholder="읽은 페이지 수" value="0" style="width:120px; margin-top: 20px;">
				<input type="text" name="totalPage" id="totalPage"  placeholder="총 페이지 수" style="width:120px; margin-top: 20px;" readonly>
			</td>
		</tr>
		<tr>
			<th colspan="2"><input type=button value="저장" onclick="trackerAddReadBook(${isbn})"/></th>
		</tr>
	</table>
</body>
<script>

	$(document).ready(function() {
	    $.ajax({
	        url: 'getTotalPage.ajax',
	        type: 'get',
	        data: {
	            'isbn': isbn,
	            'jsp': "trackerAddReadingBook.jsp"
	        },
	        dataType: 'json',
	        success: function(data) {
	        	console.log(data);
	        	if(data != null){
	        		$('#totalPage').val(data);
	        	}	        	
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	});








</script>
</html>