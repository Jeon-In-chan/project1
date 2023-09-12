<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="/login" method="post">
		<label for="username">아이디:</label>
		<input type="text" id="username" name="username"><br>
		
		<label for="password">비밀번호:</label>
		<input type="password" id="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>
	
	<!-- 회원 가입 페이지로 이동 -->
	<a href="/register">회원가입</a>
</body>
</html>