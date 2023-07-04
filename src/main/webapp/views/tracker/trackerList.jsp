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
		h3{
			font-family: 'IBM Plex Sans KR', serif;	
			font-weight: 600;
			margin: 10 0 0 0;
		}
		.post-item{
			font-family: 'IBM Plex Sans KR', serif;	
		}
		progress {	   
			width: 100%;
		    height: 3%;
		    color: #c5a992;
		    border-radius: 50px;
		}
		progress::-webkit-progress-bar {
		   background-color: azure;
		}
		progress::-webkit-progress-value {
		   background-color: #c5a992e3;
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

<section id="padding-large">
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="margin-top:5%;">

				<div class="section-header align-center">
					<h2 class="section-title">Tracker</h2>
				</div>					
				<input type="button" value="추가" onclick="location.href='trackerSearch.go'" style="float: right; bottom: 80px;">
				<div class="row" style="margin-top: 15%;">
					<c:if test="${trackerList.size() eq 0}">
						<h3 style="text-align: center;">읽고 있는 책을 추가 해보세요!</h3>
					</c:if>
						<c:forEach items="${trackerList}" var="book">
						<div class="col-md-4" style="margin-bottom: 10%; height: 541px;">
	
							<article class="column" data-aos="fade-up">
								
								<figure style="text-align: center; height: 48%;">
									<a href="/trackerDetail.go?isbn=${book.isbn}">
										<img src="${book.cover}" alt="post" class="post-image"  style="width: 170px; height: auto;">		
									</a>										
								</figure>
								<div class="post-item">	
									<h3 style="height: 20%;"><a href="/trackerDetail.go?isbn=${book.isbn}">${book.title}</a></h3>
									<div class="meta-date" style="margin-bottom: 10; height:12%;">${book.author}</div>	
	
								    <div class="links-element">
									    <div class="categories" style="float: left; font-size: 14; font-weight: 600;">${book.startDate}</div>
									    <div class="categories" style="float: right; font-size: 14; font-weight: 600;">${book.endDate}</div>
									    <div class="social-links" ><progress value="${book.progress}" min="0" max="100" style=" border-radius: 50px;"></progress></div>
									    <div class="categories" style="float: left; font-size: 14; font-weight: 600;">${book.progress}%</div>
									    <div class="categories" style="float: right; font-size: 14;">${book.readPage} / ${book.totalPage} page</div>
									</div>
	
								</div>
								
							</article>
							
						</div>
					</c:forEach>
				</div>

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
	var trackerList = "${trackerList}";
	console.log(trackerList);
</script>
</html>	