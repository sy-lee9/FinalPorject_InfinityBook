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
	<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		.item-price{
			font-family: 'IBM Plex Sans KR', serif;	
		}
		#myProgress::-webkit-progress-value {
		  background-color: red; 
		}
	</style>
<body>

<div id="header-wrap">
	
	<div class="top-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="right-element">
						<a href="#" class="user-account for-buy"><i class="icon icon-user"></i><span>Account</span></a>
						<a href="#" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Alarm</span></a>

						<div class="action-menu">
							<div class="search-bar">
								<a href="#" class="search-button search-toggle" data-selector="#header-wrap">
									<i class="icon icon-search"></i>
								</a>
								<form role="search" method="get" class="search-box">
									<input class="search-field text search-input" placeholder="Search" type="search">
								</form>
							</div>
						</div>
					</div><!--top-right-->
				</div>				
			</div>
		</div>
	</div><!--top-content-->

	<header id="header">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<div class="main-logo">
						<a href="index.move"><img src="/images/main-logo.png" alt="logo"></a>
					</div>

				</div>

				<div class="col-md-10">
					
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item active"><a href="#home" data-effect="Home">책장</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item"><a href="#business" class="nav-link" data-effect="Shop">트래커</a></li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">캘린더</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">보증금</a></li>
								<li class="menu-item"><a href="#contact" class="nav-link" data-effect="Contact">내정보</a>
									<ul>
								        <li><a href="index.move">회원정보</a></li>
								        <li><a href="about.move">활동내역</a></li>
								     </ul>
								</li>
							</ul>

							<div class="hamburger">
				                <span class="bar"></span>
				                <span class="bar"></span>
				                <span class="bar"></span>
				            </div>

						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
		
</div><!--header-wrap-->
	<div class="section-header align-center" style="margin: 5%;">
		<h2 class="section-title">Tracker</h2>
	</div>					
	<input type="button" value="삭제" onclick="trackerDelete()" style="float: right; bottom: 80px; margin-right: 1%; margin-top: 2%;">
	<input type="button" value="수정" onclick="trackerUpdate()" style="float: right; bottom: 80px; margin-right: 1%; margin-top: 2%;">
<section id="best-selling" class="leaf-pattern-overlay" style="margin-top: 6%;">
	
	<div class="corner-pattern-overlay"></div>
	<div class="container">	
		<div class="row" style=" padding-left: 0px; padding-right: 13%;">			
			<div class="col-md-8 col-md-offset-2">				
				<div class="row">	
					<div class="col-md-6" style="height: 48%;">
						<figure class="products-thumb" style="height: 96%; padding: 13% 0% 9% 22%; width: 100%;">
							<img src="${book.cover}" alt="book" class="single-image" style="height: auto; width: 72%;">
						</figure>	
					</div>

					<div class="col-md-6">
						<div class="product-entry">
							<h2 class="section-title divider" style=" width: 161%; height: 12%; font-size: 30px; font-weight: 600; margin-bottom: 5%; top: -30;">${book.title}</h2>

							<div class="products-content">
								<div class="item-price" style=" font-size: 20px; font-weight: 600; height: 9%; width: 160%; margin-bottom: 5%;">${book.author}</div>
								<div class="links-element" style="width: 155%;">
								    <div class="categories" style="float: left; font-size: 16; font-weight: 600;">${book.startDate}</div>
								    <div class="categories" style="float: right; font-size: 16; font-weight: 600;">${book.endDate}</div>
								    <div class="social-links" ><progress value="${book.progress}" min="0" max="100" style="width: 100%; height: 5%; color: #c5a992;"></progress></div>
								    <div class="categories" style="float: left; font-size: 16; font-weight: 600;">${book.progress}%</div>
								    <div class="categories" style="float: right; font-size: 16;">${book.readPage} / ${book.totalPage} page</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- / row -->

			</div>

		</div>
	</div>
</section>

<div id="footer-bottom" style="margin-top:5%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

</body>
<script>

	var isbn = "${book.isbn}";
	var readPage = "${book.readPage}";
	var startDate = "${book.startDate}";
	var jsp = 'trackerDetail.jsp';

	function trackerUpdate() {
		console.log(isbn);
		window.open('/trackerUpdateBook.go?isbn='+isbn+'&readPage='+readPage+'&jsp='+jsp+'&startDate='+startDate,'읽는 중','width=473px,height=400px');
	};
	
	function trackerDelete() {
		var result = confirm("정말 삭제하시겠습니까?"); 

		if (result) {
			
			$.ajax({
		        url: '/trackerDeleteBook.ajax',
		        type: 'get',
		        data: {
		            'isbn': isbn
		        },
				dataType:'json',
				success: function(data) {
					console.log(data);
					if(data.success){
							console.log("삭제 완료");
							alert("삭제되었습니다.");
					      	window.location.href = '/trackerList.go';
					}else{
						console.log("삭제 실패");
					}
		
		        },
				error:function(e){
					console.log(e);
				}
		    });
			
		} 
	};
	
</script>
</html>	