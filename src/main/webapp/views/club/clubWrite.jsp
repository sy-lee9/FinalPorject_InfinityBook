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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />
		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	    
	    
		<!-- script -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
		<script src="/js/twbsPagination.js"></script>    
		<script src="/js/modernizr.js"></script>		
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>

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
								<li class="menu-item"><a href="#" >대여/교환</a></li>
								<li class="menu-item"><a href="#" >감상문</a></li>
								<li class="menu-item active"><a href="#" >독서모임</a></li>
								<li class="menu-item"><a href="#" >공지사항</a></li>
								<li class="menu-item"><a href="#" >이벤트</a></li>
								<li class="menu-item"><a href="/libraryList.get" >마이페이지</a></li>							
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
				<h2 class="section-title" style="margin-bottom:10px;">Book Club</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container" style="text-align:center;">
		<form action="clubWrite.do" method="post" style="text-align:center;">			
			<table style="width:100%;">
				<tr>
					<td width="5%"></td>
					<td width="45%"></td>
					<td width="15%"></td>
					<td width="15%"></td>
					<td width="15%"></td>
					<td width="5%"></td>
				</tr>
				<tr>
					<td></td>
					<td rowspan="5">
						<div class="form-group" style="text-align:center;">
							<a href="#" id="clubBookPop">
							 	<img src="/images/book.png" id="cover2" style="width:120px; height:150px;" alt="Books" ><br/>책 선택
							</a>
							<br/><br/>
							<br/><br/>
					      	<input type="text" readonly id="title" name="title" style=" width:90%; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder=" 도서 제목"><br/>
							<input type="text" readonly id="author" name="author" style="width:90%; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="저자">					
							<input type="hidden" id="isbn" name="isbn"/>
							<input type="hidden" id="publisher" name="publisher"/>
							<input type="hidden" id="description" name="description"/>
							<input type="hidden" id="pubdate" name="pubdate"/>
							<input type="hidden" id="cover" name="cover"/>
					    </div>
					</td>
					<td>모임명</td>
					<td colspan="2">
						<input type="text" name="club_name" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="모임명">
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td>모임일시</td>
					<td colspan="2">
						<input type="text" name="club_meetdate" id="date" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="모임일시">
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td>모임인원</td>
					<td colspan="2">
						<input type="number" name="club_num" id="club_num" min="0" max="10" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="0"> 명
					</td>
					<td></td>
				</tr>
				<!-- onchange="checkClubOnOff()"  -->
				<tr>
					<td></td>
					<td>모임방식</td>
					<td colspan="2">
						<select name="club_onoff" id="club_onoff" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;">
							<option value="1">비대면</option>
							<option value="0">대면</option>
						</select>
						<select name="code_idx" id="code_idx" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;">
							<option value="26">-</option>
							<c:forEach items="${location}" var="location">
								<option value="${location.code_idx}">${location.code_codename}</option>
							</c:forEach>
							
						</select>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="4">
						<div id="div_editor"></div>
						<input type="hidden" name="club_content"> 
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="4" style="text-align:center;">
						<input type="button" onclick="save()" value="등록"/>
					
					</td>
					<td></td>
				</tr>
				
			</table>
		</form>
		
		
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
var config = {};

	var win;

    var link = document.getElementById('clubBookPop');

    link.addEventListener('click',function(){
        win = window.open('/clubBookPop.go','Infinity_Book','width=800px,height=600px');
    })

// editor 크기 조절 불가
config.editorResizeMode = "none"; 

// 파일 업로드 관련 설정
config.file_upload_handler = function(file,callback){
	console.log(file);
	// file정보 : 크기, 이름, 종류 등을 알 수 있다.
	if(file.size>(1*1024*1024)){
		alert('1MB 이하 파일만 업로드 가능합니다.');
		callback('/images/noimage.png');
	}
	console.log(callback);
}
var editor = new RichTextEditor("#div_editor",{ skin: "gray", toolbar: "basic" });

function save(){
	console.log('저장');
	var content = editor.getHTMLCode();
	console.log(content.length);
	console.log(content);
	if(content.length>(4*1024*1024)){
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여주세요');
	}else{
		$('input[name="club_content"]').val(content);
		$('form').submit();
	}
}

$(function() {
    $('#date').datetimepicker({
      format: 'Y-m-d H:i',  // 입력값의 형식을 지정
      lang: 'ko',  // 언어 설정
      step: 30,  // 분 단위로 선택 가능한 간격을 지정
      dayOfWeekStart: 1,  // 주의 시작일을 월요일로 설정
      minDate: 0,  // 오늘 이후의 날짜만 선택 가능하도록 설정
      allowTimes: [
        '09:00', '10:00', '11:00', '12:00', '13:00',
        '14:00', '15:00', '16:00', '17:00', '18:00',
        '19:00', '20:00', '21:00', '22:00', '23:00'
      ]  // 선택 가능한 시간을 지정
    });
  });

/* function checkClubOnOff() {
    var clubOnOffSelect = document.getElementById("club_onoff");
    var codeIdxSelect = document.getElementById("code_idx");

    if (clubOnOffSelect.value == "1") {
        codeIdxSelect.disabled = true;  // 두 번째 셀렉터를 비활성화
    } else {
        codeIdxSelect.disabled = false; // 두 번째 셀렉터를 활성화
    }
} */
</script>

</html>	