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
  	 <input type="checkbox" id="rememberMe">&nbsp;&nbsp;&nbsp;<label for="rememberMe" style="display: inline-block; vertical-align: middle;">로그인 유지</label>

  <br>	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="join.go" onclick="closePopup1()">회원가입</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pw_Search.go" onclick="closePopup2()">비밀번호 찾기</a>
</div>
<script>

setRememberMeCookie()

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

function setRememberMeCookie() {
	  var rememberMe = document.getElementById("rememberMe").checked;
	  if (rememberMe) {
	    var email = document.getElementById("member_email").value;
	    var password = document.getElementById("member_pw").value;

	    // 쿠키 만료일을 7일로 설정
	    var expires = new Date();
	    expires.setDate(expires.getDate() + 7);

	    // 쿠키에 이메일과 비밀번호를 저장
	    document.cookie = "email=" + encodeURIComponent(email) + "; expires=" + expires.toUTCString() + "; path=/";
	    document.cookie = "password=" + encodeURIComponent(password) + "; expires=" + expires.toUTCString() + "; path=/";
	  } else {
	    // 로그인 유지 체크가 해제되면 쿠키를 삭제
	    document.cookie = "email=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	    document.cookie = "password=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	  }
	}

	function checkRememberMe() {
	  var email = getCookie("email");
	  var password = getCookie("password");

	  if (email && password) {
	    // 이메일과 비밀번호 필드에 쿠키 값 채우기
	    document.getElementById("member_email").value = decodeURIComponent(email);
	    document.getElementById("member_pw").value = decodeURIComponent(password);
	    document.getElementById("rememberMe").checked = true;
	  }
	}

	function getCookie(name) {
	  var cookieArr = document.cookie.split(";");

	  for (var i = 0; i < cookieArr.length; i++) {
	    var cookiePair = cookieArr[i].split("=");

	    if (name === cookiePair[0].trim()) {
	      return decodeURIComponent(cookiePair[1]);
	    }
	  }

	  return null;
	}

	// 페이지 로드 시 자동으로 로그인 유지 체크 여부 확인
	checkRememberMe();
	
	


</script>
</body>
</html>
