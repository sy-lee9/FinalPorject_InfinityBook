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


</style>
</head>
<body>

<div class="container">
  <h4>비밀번호를 찾고자하는 이메일과 닉네임을 입력해주세요.</h4>
  <h4>임시 비밀번호를 보내드립니다.</h4>
  <form action="pw_Search.do">
  	이메일
    <input type="email" id="member_email" placeholder="이메일을 입력해주세요.">
    닉네임
    <input type="text" id="member_nickname" placeholder="닉네임을 입력해주세요.">
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
