<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
	
		<!-- Datetimepicker 라이브러리 불러오기 -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
	<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	body,h3{
		font-family: 'IBM Plex Sans KR', serif;	
	}
	body{
		margin:30px;	
	}
	table{
		width: 100%;
	}
	input[type="button"]{
		margin-left: 40%;
	}
	</style>
	</head>

<body>
	
	<section id="popular-books" class="bookshelf">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
	
				<div class="section-header align-center">
					<h2 class="section-title" style="margin: 1%;">Profile</h2>
				</div>
				
				<div style="float: right; width: 15%;">
					<p style="margin: 3%; display: inline;">${info.member_nickname}님</p>
					<input type="button" style="display:inline; padding:5 10 5 10; color:CornflowerBlue; margin: 1%; cursor: default;" class="btn btn-outline-accent btn-accent-arrow" value="${info.region}">
				</div>
	   
				<ul class="tabs" style="margin-top: 10%;">
				  <li data-tab-target="#all-genre" class="active tab">All Genre</li>
				  <li data-tab-target="#business" class="tab">Business</li>
				  <li data-tab-target="#technology" class="tab">Technology</li>
				  <li data-tab-target="#romantic" class="tab">Romantic</li>
				  <li data-tab-target="#adventure" class="tab">Adventure</li>
				  <li data-tab-target="#fictional" class="tab">Fictional</li>
				</ul>
	
				<div class="tab-content">
				  <div id="all-genre" data-tab-content class="active">
				  	<div class="row">
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item1.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Portrait photography</h3>
									<p>Adam Silber</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item2.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Once upon a time</h3>
									<p>Klien Marry</p>
									<div class="item-price">$ 35.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item3.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Tips of simple lifestyle</h3>
									<p>Bratt Smith</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item4.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Just felt from outside</h3>
									<p>Nicole Wilson</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					</div>
					<div class="row">
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item5.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Peaceful Enlightment</h3>
									<p>Marmik Lama</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item6.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Great travel at desert</h3>
									<p>Sanchit Howdy</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item7.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Life among the pirates</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item8.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Simple way of piece life</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
			    	</div>
	
				  </div>
				  <div id="business" data-tab-content>
				  	<div class="row">
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item2.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Peaceful Enlightment</h3>
									<p>Marmik Lama</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item4.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Great travel at desert</h3>
									<p>Sanchit Howdy</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item6.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Life among the pirates</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item8.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Simple way of piece life</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
			    	 </div>
				  </div>
	
				  <div id="technology" data-tab-content>
				  	<div class="row">
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item1.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Peaceful Enlightment</h3>
									<p>Marmik Lama</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item3.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Great travel at desert</h3>
									<p>Sanchit Howdy</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item5.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Life among the pirates</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item7.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Simple way of piece life</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
			    	 </div>
				  </div>
	
				  <div id="romantic" data-tab-content>
				  	<div class="row">
			    	  <div class="col-md-3">
				    	  <figure class="product-style">
								<img src="/images/tab-item1.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Peaceful Enlightment</h3>
									<p>Marmik Lama</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item3.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Great travel at desert</h3>
									<p>Sanchit Howdy</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item5.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Life among the pirates</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item7.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Simple way of piece life</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
			    	 </div>
				  </div>
	
				  <div id="adventure" data-tab-content>
				  	<div class="row">
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item5.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Life among the pirates</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item7.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Simple way of piece life</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
			    	 </div>
				  </div>
	
				  <div id="fictional" data-tab-content>
				  	<div class="row">
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item5.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Life among the pirates</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
	
					  	<div class="col-md-3">
						  	<figure class="product-style">
								<img src="/images/tab-item7.jpg" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
								<figcaption>
									<h3>Simple way of piece life</h3>
									<p>Armor Ramsey</p>
									<div class="item-price">$ 40.00</div>
								</figcaption>
							</figure>
						</div>
			    	 </div>
				  </div>
	
				</div>
	
			</div><!--inner-tabs-->
				
			</div>
		</div>
	</section>

</body>
<script>



	function trackerAddReadBook(isbn,cover) {
		console.log(isbn);
		console.log(cover);
		
		if($('#startDate').val() != ''){
			
			if($('#endDate').val() != ''){
		
			    $.ajax({
			        url: '/tracker/add/read/book.ajax',
			        type: 'get',
			        data: {
			            'isbn': isbn,
			            'cover': cover,
			            'startDate':document.getElementById("startDate").value,
			            'endDate':document.getElementById("endDate").value,
			            'jsp':"trackerAddReadBook.jsp"
			        },
					dataType:'json',
					success: function(data) {
						console.log(data);
						if(data.success){
							console.log("추가 완료");
							if (data != null) {
								  window.alert("트래커에 추가 되었습니다.");
								  window.close(); 
								  if (window.opener) {
								      window.opener.location.href = '/trackerList.go';
								   }
							}
						}else{
							console.log("추가 실패");
						}
		
			        },
					error:function(e){
						console.log(e);
					}
			    });
			}else{
				alert("종료일을 입력해주세요!");
			}
		}else{
			alert("시작일을 입력해주세요!");
		}
	}	
	
	function trackerChk(){
		
		$.ajax({
	        url: '/trackerChk.ajax',
	        type: 'get',
	        data: {
	            'isbn': isbn
	        },
			dataType:'json',
			success: function(data) {
				console.log(data);
					if(data.check == 0){
						
					}else{
						alert("트래커에 존재하는 책입니다.");
					}
					
	        },
			error:function(e){
				console.log(e);
			}
	    });
		
	}

	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});

	$(function() {
	    $('#startDate').datepicker({
	    	format: 'Y-m-d',  // 입력값의 형식을 지정
		    lang: 'ko',  // 언어 설정
		    maxDate: new Date(),
		    onSelect: function(selectedDate) {
		        $('#endDate').datepicker('option', 'minDate', selectedDate); // 선택한 시작일로 endDate의 최소값 업데이트
		      }
	    });
	  });
	
	$(function() {
	    $('#endDate').datepicker({
	      format: 'Y-m-d',  // 입력값의 형식을 지정
	      lang: 'ko',  // 언어 설정
	      maxDate: new Date()
	    });
	  });
	
	var msg = "${msg}";
	if(msg != ''){
		alert(msg);
		 window.close(); // 창 닫기
	}

</script>
</html>