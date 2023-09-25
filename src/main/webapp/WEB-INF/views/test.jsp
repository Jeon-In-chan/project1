<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
Connection conn=null; //-->Connection: DB연결 권한/ 커넥션에 접근하기 위한 레퍼런스변수 선언만 해놓은 상태.

String driver="oracle.jdbc.driver.OracleDriver";//--->오라클을 사용하시는 분들은 이렇게 작성해주세요
String url="jdbc:oracle:thin:@localhost:1521:XE";
//--> 드라이버 레지스트리에 등록된 Oracle JDBC Driver의 명칭@Database가 설치된 PC:Database가 점유하고있는 포트번호:Database의 식별자

Boolean connect=false;//-->접속 확인용

try{   //--->데이터 베이스 연결하기
Class.forName(driver);//-->driver연결-DriverManager클래스한테 오라클 쓰겠다고 등록해 놓는거
conn=DriverManager.getConnection(url,"scott","tiger");//-->계정이랑 비밀번호 <객체생성>

connect=true;//-->접속 성공

conn.close();
}catch(Exception e){
connect=false;//-->접속실패
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(connect==true){ %>
연결
<%} else{ %>
실패
<%} %>
</body>
</html>