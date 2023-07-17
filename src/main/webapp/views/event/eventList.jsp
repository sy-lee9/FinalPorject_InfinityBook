<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="/css/vendor.css">
<link rel="stylesheet" type="text/css" href="/style.css">

<!-- script -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/twbsPagination.js"></script>
<script src="/js/modernizr.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
<script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

</head>

<body style="width: 100%">

	<div id="header-wrap">
		<div class="top-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="right-element">
							<a href="#" class="user-account for-buy"><i
								class="icon icon-user"></i><span>Account</span></a> <a href="#"
								class="cart for-buy"><i class="icon icon-clipboard"></i><span>Alarm:(0
									$)</span></a>

							<div class="action-menu">
								<div class="search-bar">
									<a href="#" class="search-button search-toggle"
										data-selector="#header-wrap"> <i class="icon icon-search"></i>
									</a>
									<form role="search" method="get" class="search-box">
										<input class="search-field text search-input"
											placeholder="Search" type="search">
									</form>
								</div>
							</div>
						</div>
						<!--top-right-->
					</div>
				</div>
			</div>
		</div>
		<!--top-content-->

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
								<br />
								<br />
								<ul class="menu-list">
									<li class="menu-item active"><a href="/libraryList.get">서재</a></li>
									<li class="menu-item"><a href="/myBookreportList.get"
										class="nav-link">감상문</a></li>
									<li class="menu-item"><a href="/trackerList.go">트래커</a></li>
									<li class="menu-item"><a href="#latest-blog"
										class="nav-link">일정</a></li>
									<li class="menu-item"><a href="/deposit" class="nav-link">보증금</a></li>
									<li class="menu-item has-sub"><a href="#pages"
										class="nav-link">내 정보</a>
										<ul>
											<li class="active"><a href="index.go">회원 정보</a></li>
											<li><a href="about.move">활동 내역</a></li>
											<li><a href="styles.move">문의 내역</a></li>
										</ul></li>
								</ul>								
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
					<h2 class="section-title" style="margin-botton: 25px;">EVENT</h2>
				</div>
			</div>
		</div>
	</section>
<!-- 이벤트 배너 -->
<!-- 	<section id="latest-blog" class="scrollspy-section padding-large"
		style="padding-top: 10px; padding-bottom: 10px; margin-bottom: 10px; width: 800; display: flex; left: 175px; position: relative;">

		<button class="prev slick-arrow">
			<i class="icon icon-arrow-left"></i>
		</button>
		<div class="container">
			<div class="event-slider"
				style="display: flex; justify-content: center; align-items: center;">

				<div class="slide-item">
					<img src="/images/이벤트 배너.png" alt="Event 1"
						style="width: 550px; margin: 0 auto;" onclick="location.href='eventDetail.go'">
				</div>
				<div class="slide-item">
					<img src="/images/이벤트 배너.png" alt="Event 2"
						style="width: 550px; margin: 0 auto;" onclick="location.href='eventDetail.go'">
				</div>
				<div class="slide-item">
					<img src="/images/이벤트 배너.png" alt="Event 3"
						style="width: 550px; margin: 0 auto;" onclick="location.href='eventDetail.go'">
				</div>
			</div>
		</div>
		<button class="next slick-arrow">
			<i class="icon icon-arrow-right"></i>
		</button>
		
	</section> -->
	
		
		<ul class="tab">
			<li class="search-box"
				style="text-align: center; list-style-type: none;"> <i class="icon icon-search"></i> <input
				id="serchText" name="serchText"
				class="search-field text search-input" style="width: 40%;"
				placeholder="제목을 입력해주세요" type="search"> <input
				type="button" id="searchButton" value="검색"></li>
				
		 </ul>            
        <section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
		<div class="container">				
		<div class="tab-content">
			<div id="all-genre" data-tab-content class="active">
				<div class="row" id="list">
					
			    </div>
			    
			     <div  id="paging" >
			      <div class="container" style="text-align:center; width: 600px;">
			        <nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
			          <ul class="pagination justify-content-center" id="pagination"></ul>
			        </nav>
			      </div>
			    </div>
		    </div>
		    
		<button onclick="location.href='eventWrite.go'"></button>

	    </div>	    
	</div>
</section>
	<div id="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="copyright">
						<div class="row">

							<div class="col-md-12" style="text-align: center;">
								<hr />
								<p>
									Â© 2022 All rights reserved. Free HTML Template by <a
										href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a>
								</p>
							</div>
						</div>
					</div>
					<!--grid-->

				</div>
				<!--footer-bottom-content-->
			</div>
		</div>
	</div>



</body>

<script>
	//console.log(width : window.innerWidth || document.body.clientWidth);

	/* $(document).ready(function() {
		$('.event-slider').slick({
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 3000,
			dots : false,
			arrows : true,
			prevArrow : $('.prev'),
			nextArrow : $('.next')
		});
	}); */

	var showPage = 1;
	var searchText = '';
	listCall(showPage);

	$('#searchButton').click(function() {
		searchText = $('#serchText').val();
		listCall(showPage);
		searchText = 'default';
		$('#pagination').twbsPagination('destroy');
	});

	function listCall(page){
	 $.ajax({
	 type:'post',
	 url:'eventList.ajax',
	 data:{
	 'page':page,
	 'searchText':searchText
	 },
	 dataType:'json',           
	 success:function(data){
	 console.log(data);
	 listPrint(data.list);
	
	
	
	 $('#pagination').twbsPagination({
	 startPage:1, // 시작 페이지
	 totalPages:data.pages,// 총 페이지 수 
	 visiblePages:5,// 보여줄 페이지
	 onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
	 console.log(page,showPage);
	 if(page != showPage){
	 showPage=page;
	 listCall(page);
	
		 }
	 }
	});
	
	

	 function listPrint(list) {
		    var content = '';

		    var rowSize = 3; // 한 줄에 표시할 개수
		    var rowCount = Math.ceil(list.length / rowSize); // 줄 수 계산

		    for (var i = 0; i < rowCount; i++) {
		        content += '<div class="row">'; // 각 줄의 시작 태그

		        for (var j = i * rowSize; j < (i + 1) * rowSize && j < list.length; j++) {
		            var item = list[j];

		            content += '<div class="col-md-4">';
		            content += '<table class="table">';
		            content += '<tr>';
		            content += '<td></td>';
		            if (item.club_state == "0") {
		                content += '<td style="text-align:center;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="모집"></td>';
		            } else {
		                content += '<td style="text-align:center;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10; color:Crimson;" class="btn btn-outline-accent btn-accent-arrow" value="종료"></td>';
		            }
		            content += '<td style="text-align:center;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10;" class="btn btn-outline-accent btn-accent-arrow" value="' + item.meet_num + '/' + item.club_num + '"></td>';
		            content += '<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"></td>';
		            content += '<td><a href="/clubDetail.go?club_idx=' + item.club_idx + '"><h4><b>' + item.club_name + '</b></h4></a>';
		            content += item.member_nickname + '<br/>	';
		            content += item.title.split("-")[0] + '</td>';
		            content += '<td>';
		            content += item.code_codename + '<br/>';
		            content += item.club_meetdate.split(" ")[0] + '<br/>' + item.club_meetdate.split(" ")[1] + '</td>';
		            content += '<td></td>';
		            content += '</tr>';
		            content += '</table>';
		            content += '</div>';
		        }

		        content += '</div>'; // 각 줄의 종료 태그
		    }

		    $('#list').empty();
		    $('#list').append(content);
		}

</script>

</html>
