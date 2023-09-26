<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
</head>
<body>
    <h1>회원가입 페이지</h1>
    <form action="register.jsp" method="post">
        <label for="username">아이디 (Username):</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">비밀번호 (Password):</label>
        <input type="password" id="password" name="password" required><br>

        <label for="name">이름 (Name):</label>
        <input type="text" id="name" name="name" required><br>

        <label for="phone">전화번호 (Phone):</label>
        <input type="tel" id="phone" name="phone" required><br>

        <label for="email">이메일 (Email):</label>
        <input type="email" id="email" name="email"><br>

        <label for="address">주소 (Address):</label>
        <input type="text" id="address" name="address" required><br>

        <label for="usertype">가입 종류 (User Type):</label>
        <select id="usertype" name="usertype">
            <option value="일반회원">일반 회원</option>
            <option value="관리자">관리자</option>
        </select><br>

        <input type="submit" value="가입하기">
    </form>
</body>
</html>
