<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f1f1f1;
  font-family: Arial, sans-serif;
}

.container {
  width: 400px;
  padding: 40px;
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

h4 {
  font-size: 18px;
  margin-bottom: 10px;
  text-align: center;
}

h5 {
  font-size: 14px;
  margin-bottom: 20px;
  text-align: center;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

input[type="email"] {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #dddddd;
  border-radius: 4px;
  margin-bottom: 20px;
}

a {
  display: inline-block;
  margin-top: 10px;
  text-decoration: none;
  color: #ffffff;
  background-color: #007bff;
  border: none;
  border-radius: 4px;
  padding: 12px 24px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

a:hover {
  background-color: #0056b3;
}
</style>
</head>
<body>
<div class="container">
  <h4>비밀번호를 찾고자하는 이메일과 닉네임을 입력해주세요.</h4>
  <h5>임시 비밀번호를 보내드립니다.</h5>
  <form action="pw_Search.do">
  	이메일
    <input type="email" id="member_email" placeholder="이메일을 입력해주세요.">
    닉네임
    <input type="text" id="member_nickname" placeholder="닉네임을 입력해주세요.">
    <span><a onclick="findmemberpw()">확인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="./">취소</a></span>
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
