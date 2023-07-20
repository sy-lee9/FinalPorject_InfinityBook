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
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

#header-wrap {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 9999;
}

input[type="submit"] {
  width: 150px;
  height: 70px;
}

.container form {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column; /* 요소들을 세로 방향으로 쌓습니다. */
}


input[type]{
	width : 300px;
}
  h4{
            font-family: 'IBM Plex Sans KR';   
            font-weight: 600;
            margin: 10 0 0 0;
         }

</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">



</head>
<body>
<div id="header-wrap" class="show">
	
	
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
</div>
<div class="container">
  <h4 align="center">비밀번호를 찾고자하는 이메일과 닉네임을 입력해주세요.</h4>
  <h4 align="center">임시 비밀번호를 보내드립니다.</h4>
  <br>
  <form action="pw_Search.do">
  	이메일
  	<br>
    <input type="email" id="member_email" placeholder="이메일을 입력해주세요.">
    <br>
    닉네임
    <br>
    <input type="text" id="member_nickname" placeholder="닉네임을 입력해주세요.">
    <br>
    <span><a onclick="findmemberpw()">확인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="./login.go">취소</a></span>
  </form>
</div>
</body>
<script>

function findmemberpw(){
	   $.ajax({
	      type:'post'
	         ,url:'findmemberpw.ajax'
	         ,data:{
	        	 member_email:$('#member_email').val()
	            ,member_nickname:$('#member_nickname').val()
	         }
	         ,dataType:'json'
	         ,success:function(data){
	            console.log(data);
	            if(data.findpw != null){               
	               alert('이메일로 임시비밀번호를 전송했습니다.\r\n로그인 후 비밀번호를 변경해 사용해주세요.');
	               location.href='login.go';
	            }else{
	               alert('일치하는 회원정보가 없습니다.');
	            }
	         }
	         ,error:function(e){
	            console.log(e);
	            alert('오류가 발생했습니다 다시 시도해 주세요');
	         }      
	   });   
	}

</script>
</html>
