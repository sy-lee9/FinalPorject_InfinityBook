<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>Basic Editor</title>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">
	    
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	    
		<!-- script -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
		<script src="/js/modernizr.js"></script>		
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
<style>

</style>
</head>
<body>
		<table style="width:100%; text-align:center;">					
			<tr>
				<td colspan="3" style="text-align:center;">${notice.notice_title}</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;">${notice.member_nickname}</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;">${notice.notice_date}</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;">${notice.notice_hit}</td>
			</tr>			
			<tr>
				<td colspan="3" style="text-align:center;">				
					${notice.notice_content}													
				</td>
			</tr>	
			<tr>	
				<td style="text-align:center;">
					<button onclick="location.href='/noticelist.go'">리스트</button>
					<button onclick="location.href='/noticeupdate.go?notice_idx=${notice.notice_idx}'">수정</button>
					<button onclick="location.href='/noticedel.do?notice_idx=${notice.notice_idx}'">삭제</button>
				</td>
			</tr>	
		</table>
</body>
<script>


	

</script>
</html>