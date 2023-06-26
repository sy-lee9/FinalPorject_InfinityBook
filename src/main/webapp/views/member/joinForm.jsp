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

</style>
</head>
<body>
	<form action="login.do">
		<table>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;<input type="email" placeholder="이메일을 입력해 주세요.">					
				</td>
				<td>
					<button onclick="href/location">이메일 인증</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" placeholder="인증번호를 입력해주세요.">
				</td>
			</tr>			
			<tr >
				<td colspan="2">
					<input type="password" placeholder="비밀번호 8자리 이상 입력">				
				</td>								
			</tr>
			<tr >
				<td colspan="2">
					<input type="password" placeholder="비밀번호 재입력">				
				</td>								
			</tr>
			<tr >
				<td colspan="2">
					<input type="text" placeholder="닉네임 입력 2자리 이상 9자리 이하 특수문자 금지(@\#$%&...)">				
				</td>								
			</tr>
			<tr >
				<td colspan="2">
					<input type="text" placeholder="주소를 입력하세요.">				
				</td>								
				<td>				
					<button onclick="href/location">주소 찾기</button>
				</td>
			</tr>
			
			<tr>
				<td><a href="join.do">회원가입</a></td>
				<td><a href="login.go">취소</a></td>
			</tr>
		</table>
	</form>
</body>
<script>

</script>
</html>