<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="uploadFormAction" method="post" enctype="multipart/form-data">
	<input type="file" name="uploadFile" multiple>
	<button>Submit</button><!-- form 안에서 button을 만들고 아무런 type을 지정하지 않으면 submit default -->
</form>
</body>
</html>