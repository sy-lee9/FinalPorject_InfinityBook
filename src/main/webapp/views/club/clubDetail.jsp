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
						<a href="/"><img src="/images/malogo.png" alt="logo"></a>
					</div>
				</div>
				<div class="col-md-10">
					<nav id="navbar">
						<div class="main-menu stellarnav">
						<br/><br/>
							<ul class="menu-list">
								<li class="menu-item"><a href="#" >대여/교환</a></li>
								<li class="menu-item"><a href="#" >감상문</a></li>
								<li class="menu-item active"><a href="#" >독서모임</a></li>
								<li class="menu-item"><a href="#" >공지사항</a></li>
								<li class="menu-item"><a href="#" >이벤트</a></li>
								<li class="menu-item"><a href="/libraryList.get" >마이페이지</a></li>							
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
				<h2 class="section-title" style="margin-botton:0px;">Book Club</h2>
			</div>
		</div>
	</div>
</section>

<section id="best-selling" class="leaf-pattern-overlay" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">
	<div class="corner-pattern-overlay"></div>
	<div class="container">
		<table>
			<tr>
				<th style="width: 40%; text-align:center;">
					<img src="${club.cover}" style="text-align:center; width: 70%;" alt="book" class="single-image">
				</th>
				<th style="width: 5%;">
					
				</th>
				<td style="width: 45%;">
					<c:if test="${club.club_state eq 0}"> 
	    				<input type="button" style="padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="모집 중 ">
					</c:if>
					<c:if test="${club.club_state eq 1}"> 
	    				<input type="button" style="padding:5 10 5 10; color:Crimson;" class="btn btn-outline-accent btn-accent-arrow" value="모집 중 ">
					</c:if>
					<input type="button" style="padding:5 10 5 10;" class="btn btn-outline-accent btn-accent-arrow" value="${club.meet_num}/${club.club_num}">
					
					<table>
						<tr>
							<th style="width: 100%;" colspan="3"><h4 class="item-title">${club.club_name}</h4></th>
						</tr>
						<tr>
							<td><div class="author-name">모임 주최</div></td>
							<td colspan="2"><div class="author-name">${club.member_nickname}</div></td>
						</tr>
						<tr>
							<td><div class="author-name">선정 도서</div></td>
							<td colspan="2"><div class="author-name">${club.title}</div></td>
						</tr>
						<tr>
							<td><div class="author-name">모임 일시</div></td>
							<td colspan="2"><div class="author-name">${club.club_meetdate}</div></td>
						</tr>
						<tr>
							<td><div class="author-name">모임 인원</div></td>
							<td colspan="2"><div class="author-name">${club.club_num} 명</div></td>
						</tr>
						<tr>
							<td><div class="author-name">모임 장소</div></td>
							<td colspan="2"><div class="author-name">${club.code_codename}</div></td>
						</tr>
						<tr>
							<td colspan="3">
								<h4 class="item-title">Book ClubInfo</h4>
								${club.club_content}
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
	</div>
</section>

<div id="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">
						<div class="col-md-12" style="text-align:center;">
							<hr/>
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