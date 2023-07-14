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
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	    
		<!-- script -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script src="/js/twbsPagination.js"></script>    
		<script src="/js/modernizr.js"></script>		
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	body,h3{
		font-family: 'IBM Plex Sans KR', serif;	
	}
	body{
		margin:30px;	
	}
	table{
		width: 90%;
		padding:none;
		margin:5%;
	}
	input[type="button"]{
		margin-left: 40%;
	}
		.pagination .page-link {
	 		color: gray; /* 기본 글자색을 검정색으로 지정 */
		}
	
		.pagination .page-item.active .page-link {
	 		background-color: #C5A992;
	 		border:none;
		}
	</style>
	</head>

<body>
	
	<section id="popular-books" class="bookshelf">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
	
				<div class="section-header align-center">
					<h2 class="section-title" style="margin: 1%;">Profile</h2>
				</div>
				
				<div style="float: right; width: 15%;">
					<p style="margin: 3%; display: inline;">${info.member_nickname}님</p>
					<input type="button" style="display:inline; padding:5 10 5 10; color:CornflowerBlue; margin: 1%; cursor: default;" class="btn btn-outline-accent btn-accent-arrow" value="${info.region}">
				</div>
				
				<div style="margin-top: 10%">
					<h3 style="margin: 5%; font-weight: 600;">리뷰</h3>
					<hr/>
						<div id="all-genre" data-tab-content class="active">
							<div class="row" id="reviewList">
								
						    </div>
						    
						     <div  id="reviewPaging" >
						      <div class="container" style="text-align:center; width: 600px;">
						        <nav aria-label="Page navigation"  style="text-align:center; width: 500px; margin-top: 5%;">
						          <ul class="pagination justify-content-center" id="reviewPagination"></ul>
						        </nav>
						      </div>
						    </div>
				    	</div>
				</div>
				
				<div style="margin-top: 10%">
					<h3 style="margin: 5%; font-weight: 600;">작성한 감상문</h3>
					<hr/>
					<div class="tab-content">
					<div id="all-genre" data-tab-content class="active">
						<div class="row" id="list">
							
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
				
			</div>
		</div>
		</div>
	</section>

</body>
<script>

	function profilePop(member_idx) {
		var width = 1100;
	    var height = 800;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};

	var showPage = 1;
	var searchText = '';
	var member_idx = "${member_idx}";
	
	reviewListCall(showPage);
	
	function reviewListCall(page){
		   $.ajax({
		      type:'post',
		      url:'getReview.ajax',
		      data:{
		    	  'page':page,
		    	  'member_idx':member_idx
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         reviewListPrint(data.list);		         
		  	         
		         $('#reviewPagination').twbsPagination({
						startPage:1, // 시작 페이지
						totalPages:data.pages,// 총 페이지 수 
						visiblePages:5,// 보여줄 페이지
						onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
							console.log(page,showPage);
							if(page != showPage){
								showPage=page;
								reviewListCall(page);
								
							}
						}
			         });

		      }
		   });
		}



	function reviewListPrint(list) {
	    var content = '';
	    content += '<table>';
    	content += '<tr>';
	    
	    if (list.length === 0) {
			content +='<th style="text-align: center; border:none;">받은 리뷰가 없습니다.</th>';
	    } else{
	    
	    list.forEach(function(item) {	    	
	    	
		    	content += '<td style="width=20%; padding-left:5%;"><a onclick="profilePop('+item.member_idx+')" style="cursor: pointer;">'+item.member_nickname+'</a></td>';
		    	content += '<td width="60%">'+item.review_content+'</td>';
		    	content += '<td style="width=15%; padding-right:5%;">'+item.review_date+'</td>';		    	
	    	
	  	    });
	    }
	    
        content += '</tr>';
	    content += '</table>'; 

	    $('#reviewList').empty();
		$('#reviewList').append(content);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	reportListCall(showPage);

	function reportListCall(page){
	   $.ajax({
	      type:'post',
	      url:'/profileBookreportList.ajax',
	      data:{
	    	  'page':page,
	    	  'searchText':searchText,
	    	  'memberIdx':member_idx
	      },
	      dataType:'json',           
	      success:function(data){
	         console.log(data);
	         reportListPrint(data.list);
	         
	        
	         
	         $('#pagination').twbsPagination({
					startPage:1, // 시작 페이지
					totalPages:data.pages,// 총 페이지 수 
					visiblePages:5,// 보여줄 페이지
					onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
						console.log(page,showPage);
						if(page != showPage){
							showPage=page;
							reportListCall(page);
							
						}
					}
		         });
	         
	         
	         
	      }
	   });
	}

	function reportListPrint(list) {
	    var content = '';
    	content += '<div id="products-grid" class="products-grid grid">';
	
	   list.forEach(function(item) {


		        if (item.book_report_open == "1") {
		        content += '<figure class="product-style" style="text-align:center; width: 30%; height: 60%;">';
		        	
		        content += '  <a href="/BookReportDetail?book_report_idx='+item.book_report_idx+'">';
		        content += '    <img src="' + item.cover + '" alt="Books" style="width:230px; height:300px;" class="product-item">';
		        content += '  </a>';
		        content += '  <figcaption>';
		        content += '    <a href="/BookReportDetail?book_report_idx='+item.book_report_idx+'">';
		        content += '      	<input type="checkbox" style="margin-right:10px;" value="'+item.book_report_idx+'"><h>' + item.book_report_title + '</h>';
		        content += '		<br/><h> ❤️' + item.likes + '</h>';
		        content += '		<br/><h>' + item.book_report_date + '</h>';
		        
		        content += '    </a>';
		        content += '  </figcaption>';
		        content += '</figure>';
		   	}
	    });
	
	    content += '</div>';
	
	    $('#list').empty();
		$('#list').append(content);
	}

</script>
</html>