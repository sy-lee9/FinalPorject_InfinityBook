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
		
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
			<div class="col-md-12">			
				<h2 class="page-title" style="margin-top: 25px;"> Library </h2>
				<div class="breadcrumbs">
					<h3 style="display:inline"><span class="item"><a href="index.move"> My Book</a> / </span></h3>
					<h3 style="display:inline"><span class="item"> WishList</span></h3>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 0px;">
	<div class="container">
		<ul class="tabs">
			  <li data-tab-target="#all-genre" class="active tab">전체</li>
			  <li data-tab-target="#business" class="tab">대여 가능</li>
			  <li data-tab-target="#technology" class="tab">교환 가능</li>
			  <li data-tab-target="#adventure" class="tab">소장</li>		
		</ul>
		
		<div class="row" id="list">
			<%-- <div class="products-grid grid">
				<figure class="product-style">
					<input type="button" class="btn btn-outline-accent btn-accent-arrow" style="border:none;">
					<a href="#" onclick="window.open('/bookSelectPop.go?start=1&text=','Infinity_Book','width=800px,height=600px')">
						<img src="/images/client-image5.png" style="width:230px; height:290px;"" alt="Books" class="product-item">
						<figcaption> <h4>책 등록하기</h4> </figcaption>
					</a> 
				</figure>
				<c:if test="${books.size() == 0 }">
				</c:if>
				<c:if test="${books.size() > 0 }">
					<c:forEach items="${books}" var="books">
						
							<figure class="product-style" style="text-align:center;">
								<input type="button" class="btn btn-outline-accent btn-accent-arrow" value="${books.LIBRARY_USE}">
								<a href="libraryDetail.go?LIBRARY_IDX=${books.LIBRARY_IDX}"><img src="${books.LIBRARY_COVER}" alt="Books" class="product-item"></a>
								<figcaption>
									<a href="libraryDetail.go?LIBRARY_IDX=${books.LIBRARY_IDX}"><h4 class="item-price">${books.LIBRARY_TITLE}</h4></a>
									<p class="item-price">${books.LIBRARY_AUTHOR}</p>
								</figcaption>
							</figure>
						</a>
					</c:forEach>
				</c:if>
			</div> --%>
	    </div>
	    
	    <div id="paging" style="text-align:center;">  
			<div class="container">         
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center" id="pagination"></ul>
				</nav>
			</div>
		</div>
	    
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

<script>
	var showPage = 1;
	listCall(showPage);
	
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'LibaryList.ajax',
		      data:{
		    	  'page':page,
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         listPrint(data.list);
		         
		         $('#pagination').twbsPagination({
					startPage:1, // 시작 페이지
					totalPages:data.pages,// 총 페이지 수 
					visiblePages:5,// 보여줄 페이지
					onPageClick:function(event,page){ 
						console.log(page,showPage);
						if(page != showPage){
							showPage=page;
							listCall(page);
							
						}
					}
		         });
		      }
		   });
		}

		function listPrint(list){
			var content ='';
			
			list.forEach(function(item,idx){
				
				
				content += '<tr>';
				content += '<td id="gamePlay">' + item.gamePlay + ':' + item.gamePlay + '</td>';
				content += '<td>' + item.gu + '</td>';
				content += '<td id="gamePlayer">' + item.matchingNumforSure + '/' + item.matchingNum + '</td>';
				content += '<td id="subject" style="text-align:left; padding-left:30px;"><a href="detail.go?matchingIdx=' + item.matchingIdx + '">' + item.subject + '</a></td>';
				content += '<td>' + item.gameDate + '</td>';
				content += '<td id="writerId"><a href="#" onclick="window.open(\'../userprofilepop.go?userId=' + item.writerId + '\',\'회원프로필\',\'width=400px,height=600px\')">' + item.writerId + '</a></td>';
				content += '<td>' + item.bHit + '</td>';
				content += '</tr>';
				content += '<div class="products-grid grid">';
				content += '<figure class="product-style">';
				content += '<input type="button" class="btn btn-outline-accent btn-accent-arrow" style="border:none;">';
				content += '<a href="#" onclick="window.open(\'/bookSelectPop.go?start=1&text=\',\'Infinity_Book\',\'width=800px,height=600px\')">';
				content += '<img src="/images/client-image5.png" style="width:230px; height:290px;" alt="Books" class="product-item">';
				content += '<figcaption> <h4>책 등록하기</h4> </figcaption>';
				content += '</a>';
				content += '</figure>';
				content += '<c:if test="${books.size() == 0 }">';
				content += '</c:if>';
				content += '<c:if test="${books.size() > 0 }">';
				content += '<c:forEach items="${books}" var="books">';
				content += '<figure class="product-style" style="text-align:center;">';
				content += '<input type="button" class="btn btn-outline-accent btn-accent-arrow" value="${books.LIBRARY_USE}">';
				content += '<a href="libraryDetail.go?LIBRARY_IDX=${books.LIBRARY_IDX}"><img src="${books.LIBRARY_COVER}" alt="Books" class="product-item"></a>';
				content += '<figcaption>';
				content += '<a href="libraryDetail.go?LIBRARY_IDX=${books.LIBRARY_IDX}"><h4 class="item-price">${books.LIBRARY_TITLE}</h4></a>';
				content += '<p class="item-price">${books.LIBRARY_AUTHOR}</p>';
				content += '</figcaption>';
				content += '</figure>';
				content += '</a>';
				content += '</c:forEach>';
				content += '</c:if>';
				content += '</div>';

				
			});
			$('#list').empty();
			$('#list').append(content);
		}

</script>

</html>	