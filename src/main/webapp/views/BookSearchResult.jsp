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
	div{
	display:block;
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
	<c:forEach var="entry" items="${result}" varStatus="status">
		<c:if test="${status.index==2}"> 
			<c:forEach var="result" items="${entry.value}" varStatus="id">
				<div class="col-md-3">
						<figure class="product-style">
							<img src="${result.cover}" alt="Books" class="product-item">
								<button type="button" class="add-to-cart" data-product-tile="add-to-cart">Add to Cart</button>
							<figcaption>
								<h3>${result.title}</h3>
								<p>${result.author}</p>
							</figcaption>
						</figure>
						<div class="item-price">${result.description}</div>
						<button type="button" onclick = "SearchUser(${id.index});">test</button>
							<input type="hidden" value="${result.isbn13}" name="Isbn" id="id${id.index}" />
					</div>
					
			</c:forEach>
		</c:if>
  		
	</c:forEach>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script></script>
</html>