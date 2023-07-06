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

<div id="header-wrap">
	<div class="top-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="right-element">
						<a href="#" class="user-account for-buy"><i class="icon icon-user"></i><span>Account</span></a>
						<a href="#" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Alarm:(0 $)</span></a>

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
								<li class="menu-item active"><a href="#home" data-effect="Home">서재</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">트래커</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">일정</a></li>
								<li class="menu-item"><a href="#contact" class="nav-link" data-effect="Contact">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#pages" class="nav-link" data-effect="Pages">내 정보</a>
									<ul>
								        <li class="active"><a href="index.move">회원 정보</a></li>
								        <li><a href="about.move">활동 내역</a></li>
								        <li><a href="styles.move">문의 내역</a></li>
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
</div>

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title">Library</h2>
			</div>
		</div>
	</div>
</section>

<section id="best-selling" class="leaf-pattern-overlay">
	<div class="corner-pattern-overlay"></div>
	<div class="container">
		<img src="${book.library_cover}" alt="book" class="single-image">
		<h3 class="item-title">${book.library_title}</h3>
		
		<c:if test="${mybook.size() == 0}">
			<h3>교환할 책이 없습니다.</h3>
		</c:if>
		<c:forEach var="mybook" items="${mybook}" varStatus="status">
			<img src="${mybook.library_cover}" alt="book" class="single-image">
			<h3 class="item-title">${mybook.library_title}</h3>
		</c:forEach>
	</div>
</section>


<footer id="footer">
	<div class="container">
		<div class="row">

			<div class="col-md-4">
				
				<div class="footer-item">
					<div class="company-brand">
						<img src="/images/main-logo.png" alt="logo" class="footer-logo">
						<p>Infinity Book은 한권의 책으로 무한의 책을 읽을 수 있도록 해주는 중고 책 대여/교환 서비스 입니다. </p>
					</div>
				</div>
				
			</div>

			<div class="col-md-2">

				<div class="footer-menu">
					<h5>About Us</h5>
					<ul class="menu-list">
						<li class="menu-item">
							이명아
						</li>
						<li class="menu-item">
							이수연
						</li>
						<li class="menu-item">
							최은영
						</li>
						<li class="menu-item">
							엄상원
						</li>
						<li class="menu-item">
							이창훈
						</li>
						<li class="menu-item">
							박희준
						</li>
					</ul>
				</div>

			</div>
			<div class="col-md-2">

				<div class="footer-menu">
					<h5>Discover</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">Home</a>
						</li>
						<li class="menu-item">
							<a href="#">Books</a>
						</li>
						<li class="menu-item">
							<a href="#">Authors</a>
						</li>
						<li class="menu-item">
							<a href="#">Subjects</a>
						</li>
						<li class="menu-item">
							<a href="#">Advanced Search</a>
						</li>
					</ul>
				</div>

			</div>
			<div class="col-md-2">

				<div class="footer-menu">
					<h5>My account</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">Sign In</a>
						</li>
						<li class="menu-item">
							<a href="#">View Cart</a>
						</li>
						<li class="menu-item">
							<a href="#">My Wishtlist</a>
						</li>
						<li class="menu-item">
							<a href="#">Track My Order</a>
						</li>
					</ul>
				</div>

			</div>
			<div class="col-md-2">

				<div class="footer-menu">
					<h5>Help</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">Help center</a>
						</li>
						<li class="menu-item">
							<a href="#">Report a problem</a>
						</li>
						<li class="menu-item">
							<a href="#">Suggesting edits</a>
						</li>
						<li class="menu-item">
							<a href="#">Contact us</a>
						</li>
					</ul>
				</div>

			</div>

		</div>
		<!-- / row -->

	</div>
</footer>

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



</body>

</html>	