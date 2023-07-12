<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h3 id="title" style="text-align: center;">공지사항</h3>

	<hr/>
	
		<table style="width:100%; text-align:center;">
			<thead>
				<tr id="thead">
					<th width="10%" style="text-align:center"></th>
					<th width="30%" style="text-align:center"> 제목 </th>				
					<th width="20%" style="text-align:center"> 작성자 </th>
					<th width="20%" style="text-align:center"> 작성 일자</th>
					<th width="10%" style="text-align:center">조회수</th>
					<th width="10%" style="text-align:center"></th>
				</tr>
			</thead>  
			<tbody id="notice_list">
			<!-- 출력 장소 -->
			</tbody>					
			<tr>
				<td  colspan="6" id="notice_paging" >
				<div class="container" style="text-align:center; width: 600px;">
					<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
				          <ul class="pagination justify-content-center" id="notice_pagination"></ul>
				    </nav>
				</div>
			</td>
			</tr>
		</table>
	
</body>
<script>
var showPage = 1;
listCall(showPage);


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'noticelist.ajax',
	      data:{
	    	  'page':page,
	      },
	      dataType:'json',           
	      success:function(data){
	         console.log(data);
	         listPrint(data.list);
	         
	         $('#notice_pagination').twbsPagination({
					startPage:1, // 시작 페이지
					totalPages:data.pages,// 총 페이지 수 
					visiblePages:10,// 보여줄 페이지
					onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
						console.log(page,showPage);
						if(page != showPage){
							showPage=page;
							listCall(page);
							
						}
					}
		         });
	      },error:function(e){
			
	      }
	   });
}	

function listPrint(list) {
	var content = '';
    if (list.length > 0 ){
    	list.forEach(function(item) {
            content += '<tr>';
            content += '	<td width="10%" style="text-align:center;"></td>';
            content += '	<td width="30%" style="text-align:center;">'+'<a href="/noticedetail.go?notice_idx='+item.notice_idx+'">'+item.notice_title+'</a></td>';      
            content += '	<td width="20%" style="text-align:center;">'+item.member_nickname+'</td>';
            content += '	<td width="20%" style="text-align:center;">'+item.notice_date+'</td>';
            content += '	<td width="10%" style="text-align:center;">'+item.notice_hit+'</td>';
            content += '	<td width="10%" style="text-align:center;"></td>';
   			content += '</tr>'    		
    	});	
    }else {
    	content = '<tr><td colspan="6" style="text-align:center;">공지사항이 없습니다.</td></tr>';    	
    }
    
    $('#notice_list').empty();
	$('#notice_list').append(content);
}


</script>
</html>