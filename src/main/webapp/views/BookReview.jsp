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

	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>

	<style>
	div{
	display:block;
	}
	input.review_content{
	width: 80%;
    resize: none;
    margin-bottom: 0;
	}
	figure.product-style{
	width:25%;
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
								<li class="menu-item active"><a href="#home">대여/교환</a></li>
								<li class="menu-item"><a href="/ReportList.go" class="nav-link">감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link">독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link">공지사항</a></li>
								<li class="menu-item"><a href="/eventList.go" class="nav-link">이벤트</a></li>
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link">마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
    
	<form action="BookReview.do" method="post">
		<input type="hidden" id="review_type" value="${param.review_type}"/>
		<input type="hidden" id="review_transaction_type" value="${param.review_transaction_type}"/>
		<input type="hidden" id="review_tracnsaction_idx" value="${param.review_tracnsaction_idx}"/>
		<input type="hidden" id="review_reciever" value="${param.book_reciever}"/>
		<div class="section-header align-center">
					<div class="title">
						<span>도서 리뷰 작성</span>
					</div>
					<h2 class="section-title" >${library.library_title}</h2>
				</div>
				<table style="width:100%">
					<tr>
						<th>
							<figure class="product-style">
								<img src="${library.library_cover}" alt="Books" class="product-item">
								<figcaption>
									<p>저자 : ${library.library_author}<p>
									<p>출판사 : ${library.library_publisher}</p>
								</figcaption>
							</figure>
						</th>
					</tr>
					<tr>
					<th>
						<p>${library.library_info}<p>
					</th>
					</tr>
				</table>
				
		
		<input type="text" class= "review_content" id="review_content" value="리뷰 내용을 입력해주세요."/>
		<input type="submit" value="등록"/>
		<input type="button" value="취소"/>
	</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script></script>
</html>