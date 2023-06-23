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
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

	</head>

<body>

<div id="header-wrap">
	
	<div class="top-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="right-element">
						<a href="#" class="user-account for-buy"><i class="icon icon-user"></i><span>Account</span></a>
						<a href="alarm.go" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Alarm</span></a>

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
								<li class="menu-item active"><a href="#home" data-effect="Home">대여/교환</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item has-sub">
									<a href="#business" class="nav-link" data-effect="Pages">독서모임</a>


									<ul>
								        <li class="active"><a href="index.move">Home</a></li>
								        <li><a href="about.move">About</a></li>
								        <li><a href="styles.move">Styles</a></li>
								        <li><a href="blog.move">Blog</a></li>
								        <li><a href="single-post.move">Post Single</a></li>
								        <li><a href="shop.move">Our Store</a></li>
								        <li><a href="single-product.move">Product Single</a></li>
								        <li><a href="contact.move">Contact</a></li>
								        <li><a href="thank-you.move">Thank You</a></li>
								     </ul>

								</li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">공지사항</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">이벤트</a></li>
								<li class="menu-item"><a href="#contact" class="nav-link" data-effect="Contact">마이페이지</a></li>
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

<!-- 본문 -->
<div id="socketAlertDiv">
	<div id="socketAlert" class="alert alert-warning" role="alert"></div>
</div>

<!-- 본문 -->


<div id="footer-bottom">
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
<script src="/js/alarm.js"></script>

</body>
</html>	