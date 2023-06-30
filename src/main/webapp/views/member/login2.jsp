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

input[type="submit"]{
	width: 150px;
	height: 70px;
}
</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">
</head>
<body>	
	  <div class="input-container">
	  <input type="email" placeholder="이메일을 입력하세요." style="display: block;">	  
	  <input type="password" placeholder="비밀번호를 입력하세요.">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="submit" value="로그인" style="display: inline-block; margin-top: -45px;">
	  <br>
	  <label for="remember">
      <input type="checkbox" id="remember" onchange="toggleRemember()">
      자동 로그인
    </label>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="join.go">회원가입</a>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <a href="id_Search.go">아이디</a>&nbsp;/&nbsp;<a href="pw_Search.go">비밀번호 찾기</a> 
	</div>
</body>
<script>
//페이지 로드 시 자동 로그인 상태 확인
window.onload = function() {
  var rememberCheckbox = document.getElementById("remember");
  var storedEmail = localStorage.getItem("email");
  var storedPassword = localStorage.getItem("password");

  if (rememberCheckbox.checked && storedEmail && storedPassword) {
    // 자동 로그인을 체크한 경우 저장된 이메일과 비밀번호를 사용하여 로그인 처리
    document.getElementById("email").value = storedEmail;
    document.getElementById("password").value = storedPassword;
    // 로그인 처리 로직 호출
    login();
  }
}

// 체크박스 상태 변경 시 동작
function toggleRemember() {
  var rememberCheckbox = document.getElementById("remember");
  var emailInput = document.getElementById("email");
  var passwordInput = document.getElementById("password");

  if (rememberCheckbox.checked) {
    // 체크박스를 체크한 경우 이메일과 비밀번호를 로컬 스토리지에 저장
    localStorage.setItem("email", emailInput.value);
    localStorage.setItem("password", passwordInput.value);
  } else {
    // 체크박스를 해제한 경우 로컬 스토리지에서 이메일과 비밀번호 제거
    localStorage.removeItem("email");
    localStorage.removeItem("password");
  }
}

// 로그인 처리
function login() {
  // 로그인 처리 로직 구현
  // 이 함수에서 이메일과 비밀번호를 사용하여 실제 로그인 동작을 수행합니다.
  // 필요한 경우 AJAX를 사용하여 서버로 요청을 보내고 응답을 처리할 수 있습니다.
  alert("로그인 처리를 수행합니다.");
}
</script>
</html>