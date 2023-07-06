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

<div id="header-wrap" class="show">
	
	<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="../loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="../loginBeforeBox.jsp" />            
        </c:otherwise>
    </c:choose>
	
	<header id="header">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<div class="main-logo">
					
						<a href="index.move"><img src="/images/KakaoTalk_20230630_091136316.png" alt="logo"></a>
					</div>

				</div>

				<div class="col-md-10">
					
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item active"><a href="#home" data-effect="Home">대여/교환</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link" data-effect="Pages">독서모임</a></li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">공지사항</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">이벤트</a></li>
								<li class="menu-item"><a href="/libraryList.get" class="nav-link" data-effect="Contact">마이페이지</a></li>
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

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-botton:0px;">Book Club</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">
		<ul class="tabs" style="margin:10">
			  <li class="tab"><a href="/clubList.go">전체</a></li>
			  <li class="active  tab"><a href="/myClubList.go">참여 모임</a></li>
		</ul>
		
		<h4 class="menu-item">신청 내역</h4>
			<div style="text-align:center;">
				<hr/>	
				<div class="row" id="apply_list">
				</div>
					    
				<div  id="paging" >
					<div class="container" style="text-align:center; width: 600px;">
						<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
					          <ul class="pagination justify-content-center" id="pagination"></ul>
					    </nav>
					</div>
				</div>
			</div>
			
		<h4 class="menu-item">참여 모임</h4>
			<div style="text-align:center;">
				<hr/>	
				<div class="row" id="club_list">
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
	//listCall(showPage);
		
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'clubList.ajax',
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
	    
	   
	
	    list.forEach(function(item) {
	        
	    	
	    });
    

	    $('#list').empty();
		$('#list').append(content);
	}

	
</script>

</html>	