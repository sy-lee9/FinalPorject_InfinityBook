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
    
	<form id="write" action="BookReportWrite.do" method="post"  onsubmit='return formSubmit();'>
	<div class="section-header align-center">
		<div class="title">
					</div>
					<h2 class="section-title" >감상문 등록</h2>
				</div>
	<select name="reportOpen" id="reportOpen">
	    <option value="select">공개여부</option>
	    <option value="1">공개</option>
	    <option value="0">비공개</option>
  	</select>
	<input type="text"  id ="reportTitle" name="reportTitle" value="제목을 입력해주세요." style="width:80%"/>
	<div class="form-group" style="text-align:center;">
			<a href="#" id="reportBookPop">
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
	<div id="div_editor"></div>
	<input type="submit" value="등록"/>
	<input type="hidden" id= "content" name="content"/>
	</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
var config = {};

var win;

var link = document.getElementById('reportBookPop');

link.addEventListener('click',function(){
    win = window.open('/reportBookPop.go','Infinity_Book','width=800px,height=600px');
})

// editor 크기 조절 불가
config.editorResizeMode = "none"; 
config.toolbar = "mytoolbar";
config.toolbar_mytoolbar = "{bold,italic}|{fontname,fontsize}|{forecolor,backcolor}|removeformat|undo,redo,fullscreenenter,fullscreenexit,togglemore}";

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

var editor = new RichTextEditor("#div_editor", config);



function formSubmit() {
	var content = editor.getHTMLCode();
	$('input[name="content"]').val(content);
	if(document.getElementById("reportOpen").value !== "1" && document.getElementById("reportOpen").value !== "0"){
		alert('공개여부를 선택해주세요.');
		  return false;
	}else if(document.getElementById("reportTitle").value == "" ) {
	  alert('제목을 입력해주세요.');
	  return false;
	 }else if(document.getElementById("content").value == "" ){
		 alert('내용을 입력해주세요.');
		  return false;
	 }else if(document.getElementById("isbn").value == "" ){
		 alert('책을 선택해주세요.');
		  return false;
	 }else{
		 return true;
	 }
	
	}

</script>
</html>