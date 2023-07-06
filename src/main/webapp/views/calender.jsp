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
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
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
								<li class="menu-item active"><a href="/libraryList.get" data-effect="Home">책장</a></li>
								<li class="menu-item"><a href="/myBookreportList.get" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item"><a href="/trackerList.go" class="nav-link" data-effect="Shop">트래커</a></li>
								<li class="menu-item"><a href="/calender.go" class="nav-link" data-effect="Shop">캘린더</a></li>
								<li class="menu-item"><a href="/deposit" class="nav-link" data-effect="Articles">보증금</a></li>
								<li class="menu-item"><a href="#contact" class="nav-link" data-effect="Contact">내정보</a>
									<ul>
								        <li><a href="index.move">회원정보</a></li>
								        <li><a href="about.move">교환/대여 내역</a></li>
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
					<h2 class="section-title">Calendar</h2>
				</div>					
				<div id='calendar' style="height: 95%;"></div>
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

						<div class="col-md-12" style="margin-top: 5%;">
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

	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth'
	    });
	    calendar.render();
	  });

</script>
</html>	