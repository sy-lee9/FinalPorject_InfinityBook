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

	<style>
	div{
	display:block;
	}
	
	</style>
</head>
<body>
	<h3>${book.title}</h3>
	<h3><img src="${book.cover}"></h3>
	<h3>${book.author}</h3>
	<h3>${book.publisher}</h3>
	<h3>${book.pubdate}</h3>
	
 <div class="toggle">
    <button id='btn'>
      <i class="fa fa-heart"></i>
    </button>
  </div>
	
	<h3>${report.book_report_title}</h3>
	<h3>${report.book_report_content}</h3>
	<h3>${report.book_report_date}</h3>
	<h3>${report.book_report_hit}</h3>
	<h3>${report.isbn}</h3>
	
	<div class="subscribe-content" style="align-items: center;">
			<div style="display: flex; width: 100%;align-items: center;">
				<div style="width: 10%;"></div>
				<textarea id="reply_content" placeholder="댓글을 입력하세요." style="width: 80%; resize: none ;margin-bottom:0;"></textarea>
				<button onclick="clubReplyWrite()" class="btn-subscribe" style="width: 10%;" value="작성">
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
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
	
window.onload = () => {
	  var like = document.querySelector('.fa');
	  if(like){
		  
		  like.addEventListener("click", (e) => {
			    e.target.classList.toggle("fa-heart-o");
			  });
	  }
	  
	};
	
function like(){
	$.ajax({
        url: '/like.ajax',
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


var showPage = 1;

$(document).ready(function() {	
	listCall(showPage);
});

var book_report_idx = ${report.book_report_idx};
function clubReplyWrite() {
    
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

function clubReplyDelete(reply_idx) {
	
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
	    content += '<th style="width:10%;">'+item.member_nickname+'</th>';
	    content += '<th style="width:50%;">'+item.reply_content+'</th>';
	    content += '<th style="width:15%;">'+item.reg_date+'</th>';
	    content += '<th style="width:15%;">';
	    if (${sessionScope.loginIdx} == item.member_idx) {
	      content += '<a onclick="showRe_ReplyForm(' + item.reply_idx + ')">답글 </a>/<a onclick="showEditForm(' + item.reply_idx + ')">수정 </a>/<a onclick="clubReplyDelete(' + item.reply_idx + ')"> 삭제</a>';
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
	    content += '<button onclick="clubReplyUpdate('+item.reply_idx+')" class="btn-subscribe" style="width: 10%;" value="수정">';
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
	    content += '<button onclick="clubReReply('+item.reply_idx+')" class="btn-subscribe" style="width: 10%;" value="수정">';
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
	    url: 'bookreReplyList.ajax',
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
	    content += '<th style="width:10%;">' + reply.member_nickname + '</th>';
	    content += '<th style="width:50%;">' + reply.reply_content + '</th>';
	    content += '<th style="width:15%;">' + reply.reg_date + '</th>';
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
    editForm.style.display = 'table-row';
}

function showRe_ReplyForm(replyIdx) {
    var re_ReplyForm = document.getElementById('re_ReplyForm' + replyIdx);
    re_ReplyForm.style.display = 'table-row';
}

function clubReReply(reply_idx){
	var re_ReplyForm = document.getElementById('re_ReplyForm' + reply_idx);
	var inputField = re_ReplyForm.querySelector('input');
	var newContent = inputField.value;
	
	$.ajax({
        url: '/bookReReply.ajax',
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

function clubReplyUpdate(reply_idx){
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