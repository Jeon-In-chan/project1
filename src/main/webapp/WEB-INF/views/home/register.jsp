<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:100px; padding:5px; }
label[for='p_content'] { display:block; }
input { width:150px; }
textarea#p_content { width:400px; height:180px; }
</style>
</head>
<body>
<form:form role="form" method="post" modelAttribute="NewProduct">

<div class="inputArea"> 
 <label>종류</label>
 <select class="p_type">
  <option value="">종류</option>
  <option value="1">상의</option>
  <option value="2">하의</option>
  <option value="3">신발</option>
  <option value="4">잡화</option>
  <option value="5">세트</option>
 </select>

 <label>사이즈</label>
 <select class="p_size" name="cateCode">
  <option value="75">75</option>
  <option value="80">80</option>
  <option value="85">85</option>
  <option value="90">90</option>
  <option value="95">95</option>
  <option value="100">100</option>
  <option value="105">105</option>
  <option value="110">110</option>
 </select>
</div>

<div class="inputArea">
 <label for="p_no">상품번호</label>
 <input type="text" id="p_no" name="p_no" />
</div>
<div class="inputArea">
 <label for="p_name">상품명</label>
 <input type="text" id="p_name" name="p_name" />
</div>
<div class="inputArea">
 <label for="p_producer">제조회사</label>
 <input type="text" id="p_producer" name="p_producer" />
</div>

<div class="inputArea">
 <label for="price">상품가격</label>
 <input type="text" id="price" name="price" />
</div>

<div class="inputArea">
 <label for="stock">상품수량</label>
 <input type="text" id="stock" name="stock" />
</div>
<div class="inputArea">
 <label for="sale">판매유무</label>
<select class="sale" id="sale" name="sale">
  <option value="y">판매가능</option>
  <option value="n">판매불가</option>
 </select>
</div>

<div class="inputArea">
 <label for="p_content">상품소개</label>
 <textarea rows="5" cols="50" id="p_content" name="p_content"></textarea>
</div>

<div class="inputArea">
 	<label for="image">이미지</label>
	<input type="file" name='uploadFile' id="image" multiple>
</div>

<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>


</form:form>
</body>
</html>