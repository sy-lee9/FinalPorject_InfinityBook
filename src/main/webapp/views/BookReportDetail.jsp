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

		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>
		<script src="/js/twbsPagination.js"></script>    

	<style>
	div{
	display:block;
	}
	#btn{
	background-color: #C5A992;
	  border: none; /* 테두리 제거 */
	  background-color: transparent;
	}
	#like{
	display:block;
	}
	#btn{
	float:right;
	}
	#aLike{
	float:right;
	margin-top:27px;
	}
	.section-title{
	font-size:30px;
	}
	i{
	color:ff0000;
	}
	.author-name{
	line-height:2.5;
	}
	table{
	    width: 100%;
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
								<li class="menu-item active"><a href="#home">대여/교환</a></li>
								<li class="menu-item"><a href="/ReportList.go" class="nav-link">감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link">독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link">공지사항</a></li>
								<li class="menu-item"><a href="/eventList.go" class="nav-link">이벤트</a></li>
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link">마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
	
				<div class="section-header align-center">
					<div class="title">
						<span>감상문</span>
					</div>
					<h2 class="section-title" >${report.book_report_title}</h2>
					<div class="toggle">
				  
				</div>
			<table>
				<tr>
					<th>
						 <div class="author-name" style="padding:0px 0px; float:left; margin-right:30px;">${report.book_report_date}</div>
						 <div class="author-name" style="padding:0px 0px; float:left;">${name}</div>
					</th>
					<td style="padding:0px 0px;">
					<div class="author-name" id="aLike">${like}</div>
					 <button id='btn'>
					      <i id="like" class="fa fa-heart"></i>
					    </button>
					    <div class="author-name" style="	float:right;
					margin-top:27px;">${report.book_report_hit}</div>
					</td>
				</tr>
				<tr>
					<th><h3><img src="${book.cover}"></h3></th>
					<th>
			<div class="author-name">${book.title}</div>
			<div class="author-name">저자 ${book.author}</div>
			<div class="author-name">출판사 ${book.publisher}</div>
			<div class="author-name">발행일 ${book.pubdate}</div>
		</th>
	</tr>	
		<tr >
			<td colspan="2"><div class="author-name">${report.book_report_content}</div></td>
		</tr>	
			</table>
	<input type="hidden" id ="myLike" value="${myLike}"/>
	<input type="hidden" id ="isbn" value="${report.isbn}"/>
  </div>
  	
	<div class="subscribe-content" style="align-items: center;">
			<div style="display: flex; width: 100%;align-items: center;">
				<div style="width: 10%;"></div>
				<c:choose>
				  <c:when test="${loginIdx != null}">
				    <textarea id="reply_content" placeholder="댓글을 입력하세요." style="width: 80%; resize: none ;margin-bottom:0;"></textarea>
				  </c:when>
				  <c:otherwise>
				    <textarea id="replycontent" placeholder="댓글은 로그인 이후 이용가능합니다." style="width: 80%; resize: none ;margin-bottom:0;"></textarea>
				  </c:otherwise>
				</c:choose>

				<button onclick="bookReplyWrite()" class="btn-subscribe" style="width: 10%;" value="작성">
					<span>작성</span> 
					<i class="icon icon-send"></i>
				</button>
			</div> 
			<hr>
			<div id="list" style="position: relative; text-align:center;">
				
			</div>
			<div  id="paging" >
				<div class="container" style="text-align:center; width: 600px;">
			        <nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
			          <ul class="pagination justify-content-center" id="pagination"></ul>
			        </nav>
				</div>
			</div>							
		</div>



</body>
<script src="/js/twbsPagination.js"></script>    
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
var showPage = 1;

window.onload = () => {
	
		listCall(showPage);
	  var like = document.querySelector('.fa');
	  if(document.getElementById("myLike").value == "0"){
		  like.addEventListener("click", (e) => {
			  	var val = 0;
			  	if(e.target.className == 'fa fa-heart'){
			  		val = 1;
			  	}else{
			  		val = -1;
			  	}
			    e.target.classList.toggle('fa-heart-o');
			    e.target.classList.toggle('fa-heart');
			    likeCheck(val);
			  });
	  }else{
		  document.getElementById('like').className = 'fa fa-heart-o'
		  like.addEventListener("click", (e) => {
			  	var val = 0;
			  	if(e.target.className == "fa fa-heart"){
			  		val = 1;
			  	}else{
			  		val = -1;
			  	}
			    e.target.classList.toggle("fa-heart");
			    e.target.classList.toggle('fa-heart-o');
			    likeCheck(val);
		  });
	  };
	  
	  
	};
	

function likeCheck(val){
	$.ajax({
        url: '/like.ajax',
        type: 'post',
        data: {
        	'book_report_idx':${report.book_report_idx}
			,'like_state':val
        },
		dataType:'json',
		async: false,
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				document.getElementById("aLike").innerText = data.like;
			}
        },
		error:function(e){
			console.log(e);
		}
    }); 	
}

var book_report_idx = ${report.book_report_idx};

function bookReplyWrite() {
	
		$.ajax({
	        url: '/bookReplyWrite.ajax',
	        type: 'post',
	        data: {
	        	'reply_content':document.getElementById("reply_content").value,
	        	'book_report_idx':book_report_idx
	        },
			dataType:'json',
			success: function(data) {
				console.log(data.success);
				if(data.success == 1){
					document.getElementById("reply_content").value = "";
					listCall(showPage);	
				}
	        },
			error:function(e){
				console.log(e);
			}
	    });
	
    
    
}

function bookReplyDelete(reply_idx) {
	
	if(confirm('정말 삭제하시겠습니까?')){
		$.ajax({
	        url: '/bookReplyDelete.ajax',
	        type: 'post',
	        data: {
	        	'reply_idx':reply_idx
	        },
			dataType:'json',
			success: function(data) {
				console.log(data.success);
				if(data.success == 1){
					listCall(showPage);	
				}
	        }
	    });
	}
    
    
}



function listCall(page){
	$.ajax({
		type:'post',
		url:'bookReplyList.ajax',
		data:{
			'page':page,
			'book_report_idx':book_report_idx
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			listPrint(data.list);
			
			$('#pagination').twbsPagination({
				startPage:1, // 시작 페이지
				totalPages:data.pages,// 총 페이지 수 
				visiblePages:5,// 보여줄 페이지
				onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
					console.log(page,showPage);
					if(page != showPage){
						showPage=page;
						listCall(page);
						
					}
				}
	         });
		}
	});

} 

function listPrint(list) {
	  var content = '';
	  
	  content += '<table style="width:100%;">';
	  
	  list.forEach(function(item) {
	    content += '<tr>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th style="width:10%;"><a onclick="profilePop('+item.member_idx+')" style="cursor: pointer;">'+item.member_nickname+'</a></th>';
	    content += '<th style="width:50%;">'+item.reply_content+'</th>';
	    content += '<th style="width:15%; text-align:right;">'+item.reg_date.split(" ")[0]+'</th>';
	    content += '<th style="width:15%;">';
	    if (${sessionScope.loginIdx} == item.member_idx) {
	      content += '<a onclick="showRe_ReplyForm(' + item.reply_idx + ')">답글 </a>/<a onclick="showEditForm(' + item.reply_idx + ')">수정 </a>/<a onclick="bookReplyDelete(' + item.reply_idx + ')"> 삭제</a>';
	    } else {
	      content += '<a onclick="showRe_ReplyForm(' + item.reply_idx + ')">답글 </a>';
	    }
	    content += '</th>';
	    content += '</tr>';

	    content += '<tr id="editForm'+item.reply_idx+'" style="display: none;">'; // 입력 필드를 감싸는 행
	    content += '<th style="width:10%;"></th>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th colspan="2">';
	    content += '<input style="width:100%;" type="text" value="' + item.reply_content + '">';
	    content += '</th>';
	    content += '<th style="width:15%;">'
	    content += '<button onclick="bookReplyUpdate('+item.reply_idx+')" class="btn-subscribe" style="width: 10%;" value="수정">';
	    content += '<span>수정</span> ';
	    content += '<i class="icon icon-send"></i>';
	    content += '</button>';
	    content += '</th>';
	    content += '</tr>';

	    content += '<tr id="re_ReplyForm'+item.reply_idx+'" style="display: none;">'; // 입력 필드를 감싸는 행
	    content += '<th style="width:10%;"></th>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th colspan="2">';
	    content += '<input style="width:100%;" type="text" >';
	    content += '</th>';
	    content += '<th style="width:15%;">'
	    content += '<button onclick="bookReReply('+item.reply_idx+')" class="btn-subscribe" style="width: 10%;" value="수정">';
	    content += '<span>작성</span> ';
	    content += '<i class="icon icon-send"></i>';
	    content += '</button>';
	    content += '</th>';
	    content += '</tr>';

	    content += '<tr id="reReplyContent' + item.reply_idx + '">';
	    content += '<td colspan="5">'; // 전체 칼럼을 합침
	    content += '<div id="reReplyContentInner' + item.reply_idx + '"></div>'; // 리댓 내용을 출력할 내부 요소
	    content += '</td>';
	    content += '</tr>';

	    reReplyCall(item.reply_idx, function(replyContent) {
	      $('#reReplyContentInner' + item.reply_idx).html(replyContent); // 수정된 부분: 리댓 내용을 출력할 내부 요소에 추가
	    });

	  });

	  content += '</table>';
	  $('#list').empty();
	  $('#list').append(content);
	}

function reReplyCall(reply_idx, callback) {
	  console.log(reply_idx);
	  $.ajax({
	    type: 'post',
	    url: 'bookReReplyList.ajax',
	    data: {
	      'reply_idx': reply_idx
	    },
	    dataType: 'json',
	    success: function(data) {
	      
	     
	    	console.log(data);
	     	var replyContent = reReplyPrint(data.list);
	    	callback(replyContent);
	    }
	  });
	}

function reReplyPrint(replyList) {
	  var content = '';
	  replyList.forEach(function(reply) {
		  
		  
	    content += '<tr>';
	    content += '<th style="width:15%; text-align:right;">ㄴ</th>';
	    content += '<th style="width:10%;"><a onclick="profilePop('+reply.member_idx+')" style="cursor: pointer;">'+reply.member_nickname+'</a></th>';
	    content += '<th style="width:661px;">' + reply.reply_content + '</th>';
	    content += '<th style="width:15%; text-align:right;">' + reply.reg_date.split(" ")[0] + '</th>';
	    content += '<th style="width:10%;">';
	    if (${sessionScope.loginIdx} == reply.member_idx) {
	    	content += '<a onclick="showEditForm(' + reply.reply_idx + ')">수정 </a>/<a onclick="bookReplyDelete(' + reply.reply_idx + ')"> 삭제</a>';
	    }
	    content += '</th>';
	    content += '</tr>';
	    content += '<tr id="editForm' + reply.reply_idx + '" style="display: none;">'; 
	    content += '<th style="width:15%;"></th>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th colspan="2">';
	    content += '<input style="width:100%;" type="text" value="' + reply.reply_content + '">';
	    content += '</th>';
	    content += '<th style="width:15%;">'
	    content += '<button onclick="bookReplyUpdate(' + reply.reply_idx + ')" class="btn-subscribe" style="width: 10%;" value="수정">';
	    content += '<span>수정</span> ';
	    content += '<i class="icon icon-send"></i>';
	    content += '</button>';
	    content += '</th>';
	    content += '</tr>';
	  });
	  return content;
	}



function showEditForm(replyIdx) {
    var editForm = document.getElementById('editForm' + replyIdx);
    var re_ReplyForm = document.getElementById('re_ReplyForm' + replyIdx);
    if (editForm.style.display === 'table-row') {
    	re_ReplyForm.style.display = 'none';
    	editForm.style.display = 'none';
	  } else {
		  re_ReplyForm.style.display = 'none';
		  editForm.style.display = 'table-row';
	  }
}



function showRe_ReplyForm(replyIdx) {
	var editForm = document.getElementById('editForm' + replyIdx);
   	var re_ReplyForm = document.getElementById('re_ReplyForm' + replyIdx);
	  if (re_ReplyForm.style.display === 'table-row') {
		  re_ReplyForm.style.display = 'none';
	    	editForm.style.display = 'none';
	  } else {
		  editForm.style.display = 'none';
	    re_ReplyForm.style.display = 'table-row';
	  }
	}



function bookReReply(reply_idx){
	var re_ReplyForm = document.getElementById('re_ReplyForm' + reply_idx);
	var inputField = re_ReplyForm.querySelector('input');
	var newContent = inputField.value;
	
	$.ajax({
        url: '/bookReReply.ajax',
        type: 'post',
        data: {
        	'reply_idx':reply_idx,
        	'reply_content':newContent,
        	'book_report_idx':book_report_idx
        },
		dataType:'json',
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				listCall(showPage);	
			}
        }
    });
	
}

function bookReplyUpdate(reply_idx){
	var editForm = document.getElementById('editForm' + reply_idx);
	var inputField = editForm.querySelector('input');
	var newContent = inputField.value;
	
	$.ajax({
        url: '/bookReplyUpdate.ajax',
        type: 'post',
        data: {
        	'reply_idx':reply_idx,
        	'reply_content':newContent
        },
		dataType:'json',
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				listCall(showPage);	
			}
        }
    });
	
}
	
	
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}



</script>
</html>