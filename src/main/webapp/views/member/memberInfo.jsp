<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  		<link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	table{
	    margin: 0 0 1% 28%;
    	width: 45%;
	}
	th,td{
		padding: 4%;
	}
</style>
</head>
<body>	

<div id="header-wrap">

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
						<a href="/"><img src="/images/mainLogo.png" alt="logo"></a>
					</div>

				</div>

				<div class="col-md-10">
					
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item active"><a href="/libraryList.get" data-effect="Home">책장</a></li>
								<li class="menu-item"><a href="/myBookreportList.get" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item"><a href="/trackerList.go" class="nav-link" data-effect="Shop">트래커</a></li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">캘린더</a></li>
								<li class="menu-item"><a href="/deposit" class="nav-link" data-effect="Articles">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#pages" class="nav-link" data-effect="Pages">내정보</a>
									<ul>
								        <li class="active"><a href="index.move">회원정보</a></li>
								        <li><a href="/activitiesChange.go">활동내역</a></li>
								     </ul>
								     <a class="dd-toggle" href="#">
								     	<span class="icon-plus"></span>
								     </a>
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
		
</div><!--header-wrap-->

<section id="padding-large">
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="margin-top:5%;">
	
				<div class="section-header align-center">
					<h2 class="section-title">Profile</h2>
				</div>					
				<div>
					<table>
						<colgroup>
							<col width="5%"/>
							<col width="30%"/>
							<col width="60%"/>
							<col width="5%"/>
						</colgroup>
						<tr>
							<th></th>
							<th>
								<label for="email">이메일</label>
							</th>
							<td>
			                    ${info.member_email}
			                </td>
							<th></th>
				        </tr>
						<tr>				
							<th></th>
							<th>닉네임</th>
							<td>						
								${info.member_nickname}
							</td>		
							<th></th>						
						</tr>
					    <tr>
							<th></th>
					        <th>주소(시/군/구)</th>	              
							<td>
								${info.region}
							</td>
							<th></th>
					    </tr>
						<tr>
							<th colspan="4" style="text-align: center; padding: 2%; border-bottom: none;">
								<input type="button" onclick="location.href='memberInfoUpdate.go'" value="회원정보 수정">
							</th>
						</tr>
					</table>
					<a href='trackerSearch.go' style="margin-left: 12%">회원탈퇴</a>
				</div>
	
			</div>	
		</div>
	</div>
</section>

<div id="footer-bottom" style="margin-top:5%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12" style="margin-top: 5%;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

</script>
</html>