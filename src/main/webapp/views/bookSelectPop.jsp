<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script -->
		<script src="/js/modernizr.js"></script>
		<script src="/js/jquery-1.11.0.min.js"></script>
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	</head>

<body style="margin:30px;">
	<div class="breadcrumbs" >
		<br/>
		<h3 style="display:inline"><span class="item"> Select Book </span></h3>
		<br/><br/>
	</div>
	<form action="bookSelectPop.go" method="get" class="search-box" style="text-align:center;" id="form">
		<select id="gamePlay">
		  <option value="default">검색 방식</option>
		  <option value="title">제목</option>
		  <option value="author">저자</option>
		  <option value="isbn">ISBN</option>
		</select>
		<input name="text" class="search-field text search-input" placeholder="검색어 입력" type="search">
		<a href="#" onclick="sub()"><i class="icon icon-search"></i></a>
	</form>
	<table>
		<c:if test="${books.size() == 0 }">
			<h3>검색 결과가 존재하지 않습니다. </h3>
			<tr colspan="2"></tr>
		</c:if>
		
		<c:if test="${books.size() > 0 }">
			<c:forEach items="${books}" var="books">
				<tr>
					<td>
						<img src="${books.image}" style="width:250px; height:200px;" alt="Books" class="product-item">	
					</td>
					<td>
						<div class="item-price">${books.title}</div>
						<div class="item-price">${books.author}</div>
						<div class="item-price">${books.publisher}</div>
						<div class="item-price">${books.discount} 원</div>
						<div class="item-price">${books.isbn}</div>
						<div class="item-price">${books.pubdate}</div>
						<a href="#" class="btn-accent-arrow" style="margin-left: 350px;">Select <i class="icon icon-ns-arrow-right"></i></a>
					</td>
				</tr>		
			</c:forEach>
		</c:if>
	</table>


	
</body>

<script>
function sub(){
	$('#form').submit();
}

console.log("${books}");
</script>
</html>