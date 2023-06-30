<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
	  <style>
    /* 폼 컨테이너 스타일 */
    .form-container {
      max-width: 400px;
      margin: 0 auto;
    }

    /* 폼 요소 스타일 */
    .form-group {
      margin-bottom: 20px;
    }

    .form-label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    .form-input {
      width: 100%;
      padding: 8px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-textarea {
      width: 100%;
      height: 100px;
      padding: 8px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-submit {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .form-submit:hover {
      background-color: #45a049;
    }
  </style>
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
	    <!-- Datetimepicker 라이브러리 불러오기 -->
			
	    
	    
		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

	</head>

<body>

<div id="header-wrap">
	
	<div class="top-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="right-element">
						<a href="#" class="user-account for-buy"><i class="icon icon-user"></i><span>Account</span></a>
						<a href="alarm.go" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Alarm</span></a>

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
						<a href="index.move"><img src="/images/main-logo.png" alt="logo"></a>
					</div>

				</div>

				<div class="col-md-10">
					
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item active"><a href="#home" data-effect="Home">대여/교환</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item has-sub">
									<a href="#business" class="nav-link" data-effect="Pages">독서모임</a>


									<ul>
								        <li class="clubList"><a href="clubList.go">독서모임 리스트</a></li>
								        <li><a href="clubInsert.go">독서모임 등록</a></li>
								        <li><a href="styles.move">독서모임 </a></li>
								     </ul>

								</li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">공지사항</a></li>
								<li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">이벤트</a></li>
								<li class="menu-item"><a href="#contact" class="nav-link" data-effect="Contact">마이페이지</a></li>
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

<!-- 본문 -->
<input type="hidden" name="memberEmail" value="user01@naver.com"/>
  <div class="form-container">
    <form action="clubInsert.do" method="post" enctype="multipart/form-data" onsubmit="return apply()" >
      <div class="form-group">
        <label for="club_name" class="form-label">모임 이름:</label>
        <input type="text" name="clubName" id="clubName" class="form-input">
      </div>
      <div class="form-group">
        <label for="club_book" class="form-label">썸네일을 등록해주세요 &nbsp;&nbsp;</label>
        <input type="file" name="photo" class="form-input">
        <img src="/photo/${new_photo_name}" style="width: 130px;"/>
      </div>
     
      <div class="form-group">
        <label for="club_content" class="form-label">모임 소개:</label>
        <textarea id="clubContent" name="clubContent" class="form-textarea"></textarea>
      </div>
      <div class="form-group">
        <label for="club_meetdate" class="form-label">모임 일자:</label>
        <input type="date" name="clubMeetDate" id="clubMeetDate" class="form-input">
        <input type="time" name="clubMeetTime" id="clubMeetTime" class="form-input">
      </div>
      <div class="form-group">
        <label for="club_onoff" class="form-label">대면 여부:</label>
         <input type="radio" name="clubOnOff" value="0" checked>대면
         <input type="radio" name="clubOnOff" value="1">비대면
      </div>
      <div class="form-group">
        <label for="club_num" class="form-label">모집 인원:</label>
        <input type="number" name="clubNum" id="clubNum" class="form-input">
      </div>
      <button type="submit" class="form-submit" onclick="apply()">모임 등록</button>
    </form>
  </div>




<!-- 본문 -->


<div id="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script src="/js/alarm.js"></script>
<script>
function apply(){
	var $clubName = $('#clubName');
	var $clubContent = $('#clubContent');
	var $clubMeetDate = $('#clubMeetDate');
	var $clubNum = $('#clubNum');

    if($clubName.val().length == 0){
        alert('모임 이름을 등록해주세요!');
        console.log("$clubName 값 없음");   
        $clubName.focus();
        return false;
    }else if($clubContent.val() == ''){
        alert('모임 내용을 등록해주세요!');
				console.log("$clubContent 값 없음");
				$clubContent.focus();
        return false;
    }else if($clubMeetDate.val() == ''){
        alert('모임 날짜를 등록해 주세요!');
        $clubMeetDate.focus();
        console.log("$clubMeetDate 값 없음");
        return false;
    }else if($clubNum.val() == null){
        alert('모임 인원을 등록해주세요!');
        console.log("$clubNum 값 없음");
        return false;
    }}
    
</script>

</body>
</html>	