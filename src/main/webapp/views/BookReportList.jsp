<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>
		
		

	<style>
	
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
         h4,h3{
            font-family: 'IBM Plex Sans KR';   
            font-weight: 600;
            margin: 10 0 0 0;
           
         }
         td {
    padding: 13px 33px;
    }
	
	div.test{
	display:block;
	width:50%;
	padding:20px;
	background-color: #EFEEE8;
	}
		.product-style {
		    width: 50%;
    }
    .author-name{
    	color:black;
    }
	
	</style>
</head>
<body>
<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="loginBeforeBox.jsp" />            
        </c:otherwise>
    </c:choose>
    	<header id="header">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<div class="main-logo">
					
						<a href="/"><img src="/images/mainLogo.png" alt="logo"></a>
					</div>

				</div>

				<div class="col-md-10">
					
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item"><a href="/BookSearch.go" class="nav-link">대여/교환</a></li>
								<li class="menu-item active"><a href="/BookReportList.go" class="nav-link">감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link">독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link">공지사항</a></li>
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link">마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>
				<section id="billboard" style="margin-bottom:50px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<br/><br/>
				<div class="action-menu">
					<form role="search" method="get" class="search-box" action="/search.do" id ="search" style="text-align:center;"> 
						<select name="QueryType">
							<option value="Keyword">제목+저자</option>
							<option value="Title">제목</option>
							<option value="Author">저자</option>
							<option value="Publisher">출판사</option>
						</select>
						<input class="search-field text search-input" autocomplete='off' placeholder="대여/교환 하고싶은 도서 제목을 입력해 주세요😊 "  style="width:50%; height:50px; margin:0px;" type="search" name="Query">
						<input type="submit" value="검색">	
					</form>
				</div>				
			</div>
		</div>
	</div>	
</section>

			</div>
		</div>
	</header>


		
</div><!--header-wrap-->

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-botton:0px;">Book Report</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
<div class="tab-content">
			<div id="all-genre" data-tab-content class="active">
				<div class="row" id="list">
					<table style="width:100%; text-align:center;">
						<tbody>
						<tr>	
						<th width="20%" style="text-align:center;">도서</th>	
						<th width="30%" style="text-align:center;">도서 정보</th>	
						<th width="30%" style="text-align:center;"> 감상문 정보 </th>	
						<th width="2%" style="text-align:center;"></th>
						</tr>
						<tr></tr>
						<c:forEach var="rep" items="${report}" varStatus="status">
						<tr>
						<td style="text-align:center;"><img src="${rep.cover}" alt="Books" style="width:100px; height:150px;" class="product-item"></td>
						<td>
							<h3>${rep.title}</h3></br>
							<p>${rep.author}</p></br>
							</td>
							<td><a href="/BookReportDetail?book_report_idx=${rep.book_report_idx}">
						<h3  style="line-height:0.2">${rep.book_report_title}</h3></br>
							<div class="author-name" style="color:#C5A992;">${rep.member_nickname}</div></br>
							<div class="author-name" style="color:#C5A992;">${rep.book_report_date}</div></br>
							<div class="author-name">조회수 ${rep.book_report_hit}</div>
							</a></td>
						<td></td>
						</tr>
						</c:forEach>
						</tbody>
						</table>
											
											
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


</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

<script>

	
	
</script>
</html>