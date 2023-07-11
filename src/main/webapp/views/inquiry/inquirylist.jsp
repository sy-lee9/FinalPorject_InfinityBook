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
	<h3 id="title" style="text-align: center;">내 문의 내역</h3>
	<!-- 문의 종류 필터링  -->
	<select id="categoryCode">
		<option value="default">문의 종류</option>
		<option value="61">이벤트 문의</option>
		<option value="62">계정 문의</option>						
		<option value="63">결제 문의</option>
		<option value="64">기타 문의</option>
	</select>
	
	<!-- 처리 여부 필터링  -->
	<select id="inqProcess">
		<option value="default">처리 여부 필터링</option>
		<option value="false">미처리</option>
		<option value="true">처리완료</option>
	</select>
	
	<div style="text-align: right;">			
		<button onclick="location.href='inquirywrite.go'">문의 하기</button>				
	</div>
	
	<hr/>
	
		<table style="width:100%; text-align:center;">
			<thead>
				<tr id="thead">
					<th width="20%" style="text-align:center"> 문의 종류 </th>
					<th width="20%" style="text-align:center"> 문의 제목 </th>				
					<th width="20%" style="text-align:center"> 작성자 </th>
					<th width="20%" style="text-align:center"> 문의 일자 </th>
					<th width="20%" style="text-align:center"> 문의 상태 </th>
				</tr>
			</thead>  
			<tbody id="inquiry_list">
			<!-- 출력 장소 -->
			</tbody>					
			<tr>
				<td  colspan="5" id="club_paging" >
				<div class="container" style="text-align:center; width: 600px;">
					<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
				          <ul class="pagination justify-content-center" id="inquiry_pagination"></ul>
				    </nav>
				</div>
			</td>
			</tr>
		</table>
	
</body>
<script>
var showPage = 1;
var selectedcategoryCode = 'default';
var selectedprocess = 'default';
var content = '';

listCall(showPage);



// 문의 종류 필터링
$('#categoryCode').change(function(){
    $('#inquiry_list').empty();
	selectedcategoryCode = $(this).val();
  	listCall(showPage);
   $('#inquiry_pagination').twbsPagination('destroy');
});

// 처리 여부 필터링
$('#inqProcess').change(function(){
    $('#inquiry_list').empty();
	selectedprocess = $(this).val();
	listCall(showPage);
   $('#inquiry_pagination').twbsPagination('destroy');
});


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'inquirylist.ajax',
	      data:{
	    	  'page':page,
	    	  'categoryCode' : selectedcategoryCode,
	    	  'inqProcess' : selectedprocess
	      },
	      dataType:'json',           
	      success:function(data){
	         console.log(data);
	         listPrint(data.list);
	         
	         $('#inquiry_pagination').twbsPagination({
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
			
    if (list.length > 0 ){
    	list.forEach(function(item) {
            content = '<tr>';
            content += '	<td width="20%" style="text-align:center;">'+'<a href="/inquirydetail.go?inquiry_idx='+item.inquiry_idx+'">'+item.inquiry_title+'</a></td>';
            if(item.code_idx == 61){
            	content += '	<td width="20%" style="text-align:center;">이벤트 문의</td>';            	      	
            }else if(item.code_idx == 62){
            	content += '	<td width="20%" style="text-align:center;">계정 문의</td>';	  
            }else if(item.code_idx == 63){
            	content += '	<td width="20%" style="text-align:center;">결제 문의</td>';
            }else if(item.code_idx == 64){
            	content += '	<td width="20%" style="text-align:center;">기타 문의</td>';
            }      
            content += '	<td width="20%" style="text-align:center;">'+item.member_nickname+'</td>';
            content += '	<td width="20%" style="text-align:center;">'+item.inquiry_regdate+'</td>';
            if (item.inquiry_state == 1) {
            	content += '	<td width="20%" style="text-align:center;">처리</td>';	
    		}else if(item.inquiry_state == 0){
    			content += '	<td width="20%" style="text-align:center;">미처리</td>';
    		}            
    		content += '</tr>'
    	});	
    }else {
    	content = '<tr><td colspan="5" style="text-align:center;">문의 내역이 없습니다.</td></tr>';    	
    }
    
    $('#inquiry_list').empty();
	$('#inquiry_list').append(content);
}




</script>
</html>