<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
		<title>Infinite B∞k</title>
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
		 <link rel="icon" href="/images/KakaoTalk_20230630_091136316.png" class="images">		
	</head>

<body>

<div id="header-wrap" class="show">
	
	<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="/views/loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="/views/loginBeforeBox.jsp" />            
        </c:otherwise>
    </c:choose>
	
	<header id="header">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<div class="main-logo">
					
						<a href="./"><img src="/images/KakaoTalk_20230630_091136316.png" alt="logo"></a>
					</div>

				</div>

				<div class="col-md-10">
					
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item active"><a href="#home" data-effect="Home">대여/교환</a></li>
								<li class="menu-item"><a href="#about" class="nav-link" data-effect="About">감상문</a></li>
								<li class="menu-item has-sub">
									<a href="clubList.go" class="nav-link" data-effect="Pages">독서모임</a>
									<ul>
								        <li class="active"><a href="index.move">독서모임 리스트</a></li>
								        <li><a href="#">참여 독서모임</a></li>
								     </ul>

								</li>
								<li class="menu-item"><a href="#popular-books" class="nav-link" data-effect="Shop">공지사항</a></li>
								<li class="menu-item"><a href="./event_List.go" class="nav-link" data-effect="Articles">이벤트</a></li>
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

<br>
		<br>
		<br>
		<br>
      <h2 align="center" style="color: red;">공지사항</h2>
                       
      <button onclick="location.href='noticeWrite.go'" id="write_btn">공지사항 작성</button>
      <br>
      <br>         
      <table>
         <thead>
            <tr>
               <th>번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th id="sortDate">작성일</th>
               <!-- <i class="fas fa-sort"></i> -->
               <th>조회수</th>                      
               <th id="sortChk">공개여부</th>                      
            </tr>            
         </thead>
         <tbody id="list">             
         </tbody>
            <tr>
			    <th colspan="6" id="paging" style="text-align: center;">
			        <!-- 플러그인 사용 (twbsPagination) -->
			        <div class="container" style="justify-content: center; display: flex;">
			            <nav aria-label="Page navigation">
			                <ul class="pagination" id="pagination"></ul>
			            </nav>
			        </div>
			    </th>
			</tr>                   
      </table>
      <br/>
		   <input type ="text" id="noticeboardSearchInput" placeholder="제목을 입력해 주세요.">
		   <button id ="noticeboardSearchButton">검색</button>
		
		 <br/>
		 
<footer id="footer">
	<div class="container">
		<div class="row">

			<div class="col-md-4">
				
				<div class="footer-item">
					<div class="company-brand">
						<img src="/images/main-logo.png" alt="logo" class="footer-logo">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis sed ptibus liberolectus nonet psryroin. Amet sed lorem posuere sit iaculis amet, ac urna. Adipiscing fames semper erat ac in suspendisse iaculis.</p>
					</div>
				</div>
				
			</div>

			<div class="col-md-2">

				<div class="footer-menu">
					<h5>About Us</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">vision</a>
						</li>
						<li class="menu-item">
							<a href="#">articles </a>
						</li>
						<li class="menu-item">
							<a href="#">careers</a>
						</li>
						<li class="menu-item">
							<a href="#">service terms</a>
						</li>
						<li class="menu-item">
							<a href="#">donate</a>
						</li>
					</ul>
				</div>

			</div>
			<div class="col-md-2">

				<div class="footer-menu">
					<h5>Discover</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">Home</a>
						</li>
						<li class="menu-item">
							<a href="#">Books</a>
						</li>
						<li class="menu-item">
							<a href="#">Authors</a>
						</li>
						<li class="menu-item">
							<a href="#">Subjects</a>
						</li>
						<li class="menu-item">
							<a href="#">Advanced Search</a>
						</li>
					</ul>
				</div>

			</div>
			<div class="col-md-2">

				<div class="footer-menu">
					<h5>My account</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">Sign In</a>
						</li>
						<li class="menu-item">
							<a href="#">View Cart</a>
						</li>
						<li class="menu-item">
							<a href="#">My Wishtlist</a>
						</li>
						<li class="menu-item">
							<a href="#">Track My Order</a>
						</li>
					</ul>
				</div>

			</div>
			<div class="col-md-2">

				<div class="footer-menu">
					<h5>Help</h5>
					<ul class="menu-list">
						<li class="menu-item">
							<a href="#">Help center</a>
						</li>
						<li class="menu-item">
							<a href="#">Report a problem</a>
						</li>
						<li class="menu-item">
							<a href="#">Suggesting edits</a>
						</li>
						<li class="menu-item">
							<a href="#">Contact us</a>
						</li>
					</ul>
				</div>

			</div>

		</div>
		<!-- / row -->

	</div>
</footer>

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
<script>

var searchText = 'default';
var showPage = 1;

listCall(showPage);

 $('#pagePerNum').change(function() {
   listCall(showPage);
   // 페이지 처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
   // 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
   $('#pagination').twbsPagination('destroy');
}); 
 
 $('#eventSearchButton').click(function(){
	   searchText = $('#eventSearchInput').val();
	   listCall(showPage);
	   $('#pagination').twbsPagination('destroy');
	});


function listCall(page){
   $.ajax({
      type:'post',
      url:'eventList.ajax',
      data:{
          'page':page,
            'search':searchText
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.nolist);

         
         // 총 페이지 수
         // 현재 페이지 
         
         //paging plugin
         $('#pagination').twbsPagination({
            startPage:data.currPage,    // 시작 페이지
            totalPages:data.pages,    // 총 페이지 수
            visiblePages:5,  // 보여줄 페이지[1][2][3][4][5]
            onPageClick:function(event, page){// 페이지 클릭시 동작되는 함수(콜백)
               console.log(event,page);      
            
               if (page != showPage) {
                  showPage = page;               
                  listCall(page);
               }
                  
            }
         });
      },
      error:function(e){
         console.log(e);
      }
   });
}


function listPrint(list) {
	   var content = '';
	   list.forEach(function(item, idx) {
		   content += '<tr style="color: red;">';
	      content += '<td>' + item.notice_idx + '</td>';
	      content += '<td>' + item.id + '</td>';
	      content += '<td><a href="noticeDetail.go?notice_idx=' + item.notice_idx + '">' + item.notice_title + '</a></td>';
	      var date = new Date(item.notice_date);
	      content += '<td>' + date.toLocaleDateString('ko-KR') + '</td>';
	      content += '<td>' + item.notice_bHit + '</td>';
	      
	      content += '<td id="secret">' + (item.notice_chk ? '공개' : '비공개') + '</td>';
	      content += '</tr>';
	   });
	   $('#list').empty();
	   $('#list').append(content);
	   
	   
	   var adminChk = '${sessionScope.adminChk}';
	   if (adminChk === 1 || adminChk === '1' || adminChk === "true") {
	      
	   }else{
		   var tds = document.getElementsByTagName("td");
		   for (var i = 0; i < tds.length; i++) {
		     var td = tds[i];
		     if (td.innerHTML === "비공개") {
		       var tr = td.parentElement;
		       tr.style.display = "none";
		     }
		   }
		   $('#list td#secret, #list th#secret').hide();
		   
	   }
	   
	}

</script>

</body>
</html>	