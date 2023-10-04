<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header/header.jsp"%>
<html>
<head>
<title>shoppingBasket</title>
</head>
<style>
body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  height: 80px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
  text-align: center;	
}



.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(3),
.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: limegreen;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: limegreen;
  color: white;
  border: none;
}
#click {
text-align: left;
}

</style>
<body>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                            </ul>
        </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>상품이미지</td>
                        <td>바구니번호</td>
                        <td>상품번호</td>
                        <td>상품명</td>
                        <td>카트에 담은 날짜</td>
                        <td>상품수량</td>
                        <td>상품금액</td>
                        <td>총금액</td>    
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="basket">
						<tr>
							<td><input type="checkbox"></td>
							<%-- <td>${basket.productVO.image }</td> --%>
							<td>image</td>
							<td>${basket.b_no }</td>
							<td>${basket.productVO.p_no }</td>
							<td>${basket.productVO.p_name }</td>
							<td><fmt:formatDate value="${basket.b_regDate }"
									pattern="yyyy-MM-dd" /></td>
							<td>${basket.quantity }</td>
							<td>${basket.productVO.price}</td>
							<td>${basket.totalPrice}</td>
						
						</tr>
					</c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td id="click" colspan="2"><button class="cart__list__optionbtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 선택</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${list.totalPrice}</td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right">주문하기</button>
        </div>
    </section>
</body>
</html>