<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
header {
  position: relative;
}

nav {
  position: absolute;
  top: 10;
  right: 150;
  padding: 20px;
}

h1 {
  display: inline-block;
  vertical-align: middle;
  color: white;
  margin: 0.5rem;
  padding: 0;
}

nav {
  display: inline-block;
  vertical-align: middle;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex; 
}

li.icon {
  flex-basis: 25%;
}

header {
  background: cadetblue;
  padding: 20px;
}

a {
  display: block;
  text-align: center;
  margin: .25rem;
  padding: .5rem 1rem;
  text-decoration: none;
  font-weight: bold;
  color: white;
  background: teal;
}

a:hover {
  background: yellowgreen;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	 position: absolute;
	 top:50%;
  right: 0;
   margin: 0;
  padding: 0;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

    </style> 

<header>

  <h1>쇼핑몰 이름</h1>
  <nav>
    <ul>
      <li><a href="/project1/home/product/">제품 목록</a></li>
      <li><a href="/project1/shoppingBasket/">장바구니</a></li>
      <li><a href="#">회원 정보 수정</a></li>
      <li><a href="#">회원 목록</a></li>
      <li><a href="/project1/home/register/">제품 등록</a></li>
     
    </ul>
  </nav>
  	 <a href="#" class="button">login</a>
</header>