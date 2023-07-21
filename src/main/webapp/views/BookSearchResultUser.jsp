<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Infinity Book</title>
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
	     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		
		<style>
			@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
			h2, h3, h4, h5{
				font-family: 'IBM Plex Sans KR';	
				font-weight: 600;
				margin: 10 0 0 0;
			}
		</style>
</head>
<body style="margin:50px;">
   <section class="hero-section jarallax">
   
   <div class="container">
      <div class="row">
         <div class="section-header align-center">
            <h2>대여/교환 신청</h2>
         </div>
      </div>
   </div>
   		<br>
</section>
		<h4 class="menu-item">대여 가능 사용자</h4><br/>

   		<c:if test="${RentList.size() == 0}">
   			
			<p>대여가능 사용자가 없습니다. <br/> 위시 도서로 등록 하고 알림을 기다려 주세요 😊</p>
		</c:if>
		<c:if test="${RentList.size() != 0}">
			
		</c:if>
		<div class="top-content">
		<table width="90%">
		<c:forEach var="user" items="${RentList}" varStatus="status">
		
			
				<tr>
					<td width="60%"><h5 style="font-size:15px;">📖 ${user.member_nickname} (${user.code_codename})</h5></td>
					<td width="30%"><button type="button" onclick="(function() {
					  var url = '/searchDetail.do?library_idx=' + '${user.library_idx}';
					  window.opener.location.href = url;
					  self.close();
					})()" input type="button" style="display:inline; margin:0; padding:0; width:50px; height:30px;" class="btn btn-outline-accent btn-accent-arrow" >신청</button></td>
				</tr>
			
		
		</c:forEach>
		</table>
		</div>	
		
				
		<h4 class="menu-item">교환 가능 사용자</h4><br/>
		<c:if test="${ChangeList.size() == 0}">
			<p>교환가능 사용자가 없습니다. <br/> 위시 도서로 등록 하고 알림을 기다려 주세요 😊</p>
		</c:if>
		<c:if test="${ChangeList.size() != 0}">
			
		</c:if>
		
		<div class="top-content">
			<table width="90%">
				<c:forEach var="user" items="${ChangeList}" varStatus="status">
			
					<tr>
						<td width="60%"><h5 style="font-size:15px;">📖 ${user.member_nickname} (${user.code_codename})</h5></td>
						<td width="30%"><button type="button" onclick="(function() {
							  var url = '/searchDetail.do?library_idx=' + '${user.library_idx}';
							  window.opener.location.href = url;
							  self.close();
							})()" input type="button" style="display:inline; margin:0; padding:0; width:50px; height:30px;" class="btn btn-outline-accent btn-accent-arrow" >신청</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
   
</body>

<script></script>
</html> 