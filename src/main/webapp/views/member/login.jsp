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
					&nbsp;&nbsp;&nbsp;<input type="email" placeholder="이메일을 입력해주세요.">
					
				</td>
				<td rowspan="2">
					<input type="button" value="로그인"> 
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;<input type="password" placeholder="비밀번호를 입력해주세요.">
				</td>
			</tr>			
			<tr >
				<td colspan="2">
				<input type="checkbox" id="remember.do">
				<a href="#">로그인 유지 여부</a>
				</td>
								
			</tr>			
			
			<tr>
				<td><a href="join.go">회원가입</a></td>
				<td><a href="id_Search.go">아이디 |</a></td>
				<td><a href="pw_Search.go"> 비밀번호 찾기</a></td>
			</tr>
			<tr>
				<td></td>

			</tr>

		</table>
	</form>
</body>
<script>

</script>
</html>