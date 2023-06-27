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
								<li class="menu-item has-sub"><a href="#business" class="nav-link" data-effect="Pages">트래커</a></li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">캘린더</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">보증금</a></li>
								<li class="menu-item"><a href="#contact" class="nav-link" data-effect="Contact">내정보</a>
									<ul>
								        <li class="active"><a href="index.move">회원정보</a></li>
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
<section class="padding-large">
	<div class="container">
		<div class="row">
		
			<div class="section-header align-center">
				<h2 class="section-title">Tracker</h2>
			</div>
				<div class="search-bar" style="width: 300px; display: inline;">
					<form action="trackerSearch.do" role="search" method="get" class="search-box">
						<select name="searchType">
							<option value="Title" >제목</option>
							<option value="Author">저자</option>
							<option value="Title">ISBN</option>
						</select>
						<input class="search-field text search-input" placeholder="Search" type="search" name="searchValue" style="width: 300px;">
						<input type="submit" value="검색"/>
					</form>
				</div>			
				<br>
				<br>
				<div class="products-grid grid">
					<c:if test="${search eq false}">
						<h3>검색 결과가 존재하지 않습니다. </h3>
					</c:if>
					
					<c:forEach var="item" items="${list}" varStatus="status">
						<c:if test="${status.index==2}"> 
							<c:forEach var="book" items="${item.value}" varStatus="status">
								<figure class="product-style">
									<a href="trackerBookDetail.go"><img src="${book.cover}" class="product-item"></a>
									<button onclick="window.open('trackerAddReadBook.go?','완독','width=500px,height=400px')" class="add-to-cart" style="width:70px; font-size: 13px; background-color: lightgrey; color:black;">완독!</button>
									<button onclick="window.open('trackerAddReadingBook.go?','읽는 중','width=800px,height=400px')" class="add-to-cart" style="width:70px; font-size: 13px; margin-left: 80px;  background-color: lightgrey; color:black;">읽는 중!</button>
									<figcaption>
										<h3 style="font-size: 17; font-weight: 600;">${book.title}</h3>
										<p>${book.author}</p>
										<p>ISBN : ${book.isbn13}</p>
									</figcaption>
								</figure>					
							</c:forEach>
						</c:if>	
					</c:forEach>
		    	</div>

		</div>
	</div>
</section>

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

</body>
</html>	