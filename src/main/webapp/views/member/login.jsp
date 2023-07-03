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

input[type="submit"] {
  width: 150px;
  height: 70px;
}
</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">
</head>
<body>
<div class="input-container">
  <input type="email" id="member_email" name="member_email" placeholder="이메일을 입력하세요." style="display: block;">
  <input type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요.">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" onclick="login()" value="로그인" style="display: inline-block; margin-top: -45px;">
  <br>
  <label for="remember">
    <input type="checkbox" id="remember" onchange="toggleRemember()">
    자동 로그인
  </label>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="join.go">회원가입</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="id_Search.go">아이디</a>&nbsp;/&nbsp;<a href="pw_Search.go">비밀번호 찾기</a>
</div>
<script>
function toggleRemember() {
	  var rememberCheckbox = document.getElementById("remember");
	  
	  if (rememberCheckbox) {
	    var emailInput = document.getElementById("member_email");
	    var passwordInput = document.getElementById("member_pw");

	    if (rememberCheckbox.checked) {
	      // 체크박스를 체크한 경우 이메일과 비밀번호를 로컬 스토리지에 저장
	      localStorage.setItem("member_email", emailInput.value);
	      localStorage.setItem("member_pw", passwordInput.value);
	    } else {
	      // 체크박스를 해제한 경우 로컬 스토리지에서 이메일과 비밀번호 제거
	      localStorage.removeItem("member_email");
	      localStorage.removeItem("member_pw");
	    }
	  }
	}

	// 페이지 로드 시 자동 로그인 상태 확인
	window.onload = function() {
	  var rememberCheckbox = document.getElementById("remember");
	  
	  if (rememberCheckbox) {
	    var storedEmail = localStorage.getItem("member_email");
	    var storedPassword = localStorage.getItem("member_pw");

	    if (rememberCheckbox.checked && storedEmail && storedPassword) {
	      // 자동 로그인을 체크한 경우 저장된 이메일과 비밀번호를 사용하여 로그인 처리
	      document.getElementById("member_email").value = storedEmail;
	      document.getElementById("member_pw").value = storedPassword;
	      // 로그인 처리 로직 호출
	      login();
	    }
	  }
	}

// 로그인 처리
function login() {


  if ($('#member_email').val() == "") {
    alert("아이디를 입력해 주세요.");
  } else if ($('#member_pw').val() == "") {
    alert("비밀번호를 입력해 주세요.");
  } else {
    $.ajax({
      type: 'post',
      url: 'login.ajax',
      data: {
    	  member_email: $('#member_email').val(),
    	  member_pw: $('#member_pw').val()
      },
      dataType: "json",
      success: function(data) {
        console.log(data);
        if (data.success == 1) {
          alert("로그인에 성공했습니다.");
          location.href = "./";
        } else {
          alert("아이디 또는 비밀번호를 잘못 입력했습니다.\r\n입력하신 내용을 다시 확인해주세요.");
        }
      },
      error: function(e) {
        console.log(e);
        alert("아이디 또는 비밀번호를 잘못 입력했습니다.\r\n입력하신 내용을 다시 확인해주세요.");
      }
    });
  }
}
</script>
</body>
</html>
