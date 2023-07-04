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
						<a href="/"><img src="/images/malogo.png" alt="logo"></a>
					</div>
				</div>
				<div class="col-md-10">
					<nav id="navbar">
						<div class="main-menu stellarnav">
						<br/><br/>
							<ul class="menu-list">
								<li class="menu-item active"><a href="/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="/myBookreportList.get" class="nav-link" >감상문</a></li>
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
				<h2 class="section-title" style="margin-botton:25px;">Library</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">
		<ul class="tabs" style="margin:10">
			  <li data-tab-target="#all-genre" class="active tab"><a href="/libraryList.get">전체</a></li>
			  <li data-tab-target="#business" class="tab"><a href="/libraryRentList.get">대여</a></li>
			  <li data-tab-target="#technology" class="tab"><a href="/libraryChangeList.get">교환</a></li>
			  <li data-tab-target="#adventure" class="tab"><a href="/libraryOwnList.get">소장</a></li>
			  <li data-tab-target="#business" class="tab"><a href="/libraryWishList.get">위시</a></li>	
			  <li data-tab-target="#business" class="tab"><a href="/libraryLendingList.get">대여 중</a></li>	
			  <h><input type="checkbox" id="all" />&nbsp; <a href="#" onclick="del()"><img src="/images/trashcan.png" style="width:30px;height:30px;"alt="삭제"></a></h>
		</ul>
		<ul class="tab">
			<li class="search-box" style="text-align:center;list-style-type: none;">
				<i class="icon icon-search"></i> 
				<input id="serchText" name="serchText" class="search-field text search-input" style="width:40%;"placeholder="제목 을 입력해주세요" type="search">
				<input type="button" id="searchButton" value="검색">	
			</li>
		</ul>
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
		    

	    </div>	    
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

<script>
	var showPage = 1;
	var searchText = '';
	listCall(showPage);
		
	$('#searchButton').click(function(){
		searchText = $('#serchText').val();
		listCall(showPage);
		searchText = 'default';
		$('#pagination').twbsPagination('destroy');
	});
	
	
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'libraryList.ajax',
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
		         
		         
		         
		      }
		   });
		}

	function listPrint(list) {
	    var content = '';

	    content += '<div id="products-grid" class="products-grid grid">';
	    content += '  <figure class="product-style">';
	    content += '    <input type="button" class="btn btn-outline-accent btn-accent-arrow" style="border:none;">';
	    content += '    <a href="#" onclick="window.open(\'/bookSelectPop.go?start=1&text=\',\'Infinity_Book\',\'width=800px,height=600px\')">';
	    content += '      <img src="/images/client-image5.png" style="width:230px; height:290px;" alt="Books" class="product-item">';
	    content += '      <figcaption> <h>책 등록하기</h> </figcaption>';
	    content += '    </a>';
	    content += '  </figure>';

	    if (list.length === 0) {
	        content += '</div>';
	        $('#list').empty();
			$('#list').append(content);
	        return;
	    }

	    list.forEach(function(item) {
	        content += '<figure class="product-style" style="text-align:center;">';
	        content += '  <input type="button" style="margin-bottom:10px; padding:5 10 5 10;" class="btn btn-outline-accent btn-accent-arrow" value="' + item.library_use + '">';
	        content += '  <a href="libraryDetail.go?library_idx=' + item.library_idx + '">';
	        content += '    <img src="' + item.library_cover + '" alt="Books" style="width:230px; height:300px;" class="product-item">';
	        content += '  </a>';
	        content += '  <figcaption>';
	        content += '    <a href="libraryDetail.go?library_idx=' + item.library_idx + '">';
	        content += '      <input type="checkbox" style="margin-right:10px;" value="'+item.library_idx+'"><h>' + item.library_title + '</h>';
	        content += '    </br><h>' + item.library_author + '</h>';
	        content += '    </a>';
	        content += '  </figcaption>';
	        content += '</figure>';
	    });

	    content += '</div>';

	    $('#list').empty();
		$('#list').append(content);
	}

	$('#all').click(function(e){
		   var $chk = $('input[type="checkbox"]');
		   console.log($chk);
		   if($(this).is(':checked')){
		      $chk.prop('checked',true);
		   }else{
		      $chk.prop('checked',false);
		   }
		});
	
	function del(){
	    
	    var checkArr = [];
	    
	    // checkbox에 value를 지정하지 않으먄 스스로를 on으로 지정한다. 
	    $('input[type="checkbox"]:checked').each(function(idx,item){
	      if($(this).val() != 'on'){
	         checkArr.push($(this).val());
	      }
	       
	    });
	    
	    console.log(checkArr);
	    
	   $.ajax({
	      type:'get',
	      url:'deleteLibrary.ajax',
	      data:{'delList':checkArr},
	      dataType:'json',
	      success:function(data){
	         console.log(data);
	         if(data.success){
	            alert(data.msg);
	            
	            listCall(showPage);
	         }
	      },
	      error:function(e){
	         console.log(e);
	      }
	   });
	   
	}
</script>

</html>	