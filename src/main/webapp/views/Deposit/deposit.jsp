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
		<script src="/js/twbsPagination.js"></script>    
		<script src="/js/modernizr.js"></script>		
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
						<a href="/"><img src="/images/bklogo.png" style="width:200px;height:60px;"alt="logo"></a>
					</div>
				</div>
				<div class="col-md-10">
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item active"><a href="/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" >감상문</a></li>
								<li class="menu-item"><a href="/tracker/trac kerSerach.go" >트래커</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link">일정</a></li>
								<li class="menu-item"><a href="/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#pages" class="nav-link">내 정보</a>
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
				<h2 class="section-title">Deposit</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 0px;"> 
	<div class="container">
		<h2 class="menu-item">충전 / 결제</h2>
		<hr/>
		<div style="text-align:center;">
			<form onsubmit="submitForm(event)">

				<h3 style="display:inline; margin-right:100px;">현재 잔액 : 5000 원</h3>
				<select name="deposit_type">
					<option value="충전">충전</option>
					<option value="출금">출금</option>
				</select>
				<select name="deposit_price_sel" id="deposit_price_sel">
					<option value="0">직접 입력하기</option>
					<option value="1000">1,000 원</option>
					<option value="5000">5,000 원</option>
					<option value="10000">10,000 원</option>
				</select>
				<input type="number" name="deposit_price" style="text-align:right;" placeholder="0"> 원
				<input type="submit" value="요청" style="margin-left:100px; ">
			</form>
		</div>
		
		
		
			
		<h3 class="menu-item">사용 내역</h3>
			<div style="text-align:center;">
				<hr/>	
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

function submitForm(event) {
	  // 폼 제출 이벤트를 중지하여 페이지 이동을 막습니다.
	  event.preventDefault();

	  // 선택된 값 가져오기
	  var depositType = document.getElementsByName('deposit_type')[0].value;

	  // 출금이면 urlA로, 충전이면 urlB로 데이터를 보냅니다.
	  var url;
	  if (depositType === '출금') {
	    url = '/depositMinus.go';
	  } else if (depositType === '충전') {
	    url = '/depositPlus.go';
	  }

	  // 데이터 전송
	  var formElement = event.target;
	  var formData = new FormData(formElement);
	  var xhr = new XMLHttpRequest();
	  xhr.open('POST', url, true);
	  xhr.send(formData);

	  // 팝업창 열기
	  window.open(url,'Infinity_Book','width=800px,height=600px');
	}


function handleOptionChange() {
    var selectedOption = document.getElementById("deposit_price_sel").value; // 선택된 옵션의 값 가져오기
    var depositPrice = document.getElementsByName("deposit_price")[0]; // deposit_price 필드 가져오기

    depositPrice.value = selectedOption; // deposit_price 필드에 선택된 값 설정
  }

  // 선택 옵션 변경 이벤트 처리
  var selectElement = document.getElementById("deposit_price_sel");
  selectElement.addEventListener("change", handleOptionChange);




var showPage = 1;
	listCall(showPage);
	
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'depositUseList.ajax',
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
						onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
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

	function listPrint(list) {
	    var content = '';
	    
	    content += '<table style=" text-align:center; width:90%;">';
	    content += '<tr>';
	    content += '	<th style="width:30%;"> 사용일자 </th>';
	    content += '	<th style="width:30%;"> 사용금액 </th>';
	    content += '	<th style="width:40%;"> 사용내역 </th>';
	    content += '</tr>';
	    
	   
	    list.forEach(function(item) {
	    	content += '<tr>';
		    content += '	<td>'+item.deposit_use_date+'</td>';
		    content += '	<td>'+item.deposit_use_price+'</td>';
		    content += '	<td>'+item.deposit_use_state+' 했습니다.</td>';
		    content += '</tr>';
	    });

	    content += '</table>';

	    $('#list').empty();
		$('#list').append(content);
	}
 
</script>

</html>	