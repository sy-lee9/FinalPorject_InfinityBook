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
		<script>
		function SearchUser(index) {
			var isbn = document.getElementById("id"+index).value;
			var url = "/searchUser.do?Isbn="+isbn;
			var win = window.open(url, "PopupWin", "width=500,height=600");
			}
		
		</script>
	<style>
	div.test{
	float:none;
	width:25%;
	}
	div.item-price{
	float:left;
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
	<section id="billboard" style="margin-bottom: 100px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="action-menu">
					<form role="search" method="get" class="search-box" action="/search.do" id ="search" style="text-align:center;"> 
						<select name="QueryType">
							<option value="Keyword">제목+저자</option>
							<option value="Title">제목</option>
							<option value="Author">저자</option>
							<option value="Publisher">출판사</option>
						</select>
						<input class="search-field text search-input" autocomplete='off' placeholder="제목 또는 저자명 "  style="width:50%; height:50px; margin:0px;" type="search" name="Query">
						<input type="submit" value="검색">	
					</form>
				</div>				
			</div>
		</div>
	</div>	
</section>
 
	<c:forEach var="entry" items="${result}" varStatus="status">
		<c:if test="${status.index==2}"> 
			<table style="width:100%">
			<c:forEach var="result" items="${entry.value}" varStatus="id">
					<tr>
						<th>
							<figure class="product-style" style="width:70%; border:5px">
							<img src="${result.cover}" alt="Books" class="product-item">
							<figcaption>
								<h3>${result.title}</h3>
								<p>${result.author}</p>
							</figcaption>
						</figure>
						</th>
						<th>
							<div class="item-price" style="width:70%; background-color: #EFEEE8;">${result.description}</div>
						</th>
						<th>
							<button type="button" onclick = "SearchUser(${id.index});">대여/교환</button>
						<input type="hidden" value="${result.isbn13}" name="Isbn" id="id${id.index}" />
						</th>
					</tr>
			</c:forEach>
						</table>
		</c:if>
  		
	</c:forEach>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script></script>
</html>