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
	<form action="UserReview.do" method="post">
		<h3>유저 리뷰 작성</h3>
		<input type="hidden" id="review_type" value="${param.review_type}"/>
		<input type="hidden" id="review_transaction_type" value="${param.review_transaction_type}"/>
		<input type="hidden" id="review_tracnsaction_idx" value="${param.review_tracnsaction_idx}"/>
			<input type="hidden" id="review_reciever" value="${param.member_reciever}"/>
		<h3>${library.library_title}</h3>
		<h3><img src="${library.library_cover}"></h3>
		<h3>${library.library_author}</h3>
		<h3>${library.library_publisher}</h3>
		<h3>${library.library_info}</h3>
		<h3>${user}</h3>
		<input type="text"  id="review_content" value="리뷰 내용을 입력해주세요."/>
		<input type="submit" value="등록"/>
		<input type="button" value="취소"/>
		</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script></script>
</html>