<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 100px;
	padding: 5px;
}

label[for='p_content'] {
	display: block;
}

input {
	width: 150px;
}

textarea#p_content {
	width: 400px;
	height: 180px;
}

.uploadResult {
	width: 100%;
	background-color: gray;
	margin-top: 10px;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
	vertical-align: top;
	overflow: auto;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	margin-left: 2em;
}

.uploadResult ul li img {
	width: 100px;
}
</style>
</head>
<body>
	<form role="form" method="post" >
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />

		<div class="inputArea">
			<label>종류</label> <select id="p_type" name="p_type" class="p_type">
				<option  value="">종류</option>
				<option  value="1">상의</option>
				<option  value="2">하의</option>
				<option  value="3">신발</option>
				<option  value="4">잡화</option>
				<option  value="5">세트</option>
			</select>
			 <label>사이즈</label> <select class="p_size" name="p_size">
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
			<label for="p_name">상품명</label> <input type="text" id="p_name"
				name="p_name" />
		</div>
		<div class="inputArea">
			<label for="p_producer">제조회사</label> <input type="text"
				id="p_producer" name="p_producer" />
		</div>

		<div class="inputArea">
			<label for="price">상품가격</label> <input type="text" id="price"
				name="price" />
		</div>

		<div class="inputArea">
			<label for="stock">상품수량</label> <input type="text" id="stock"
				name="stock" />
		</div>
		<div class="inputArea">
			<label for="sale">판매유무</label> <select class="sale" id="sale"
				name="sale">
				<option value="y">판매가능</option>
				<option value="n">판매불가</option>
			</select>
		</div>

		<div class="inputArea">
			<label for="p_content">상품소개</label>
			<textarea rows="5" cols="50" id="p_content" name="p_content"></textarea>
		</div>

		<div class="inputArea">
			<label >이미지</label>
			<div class="uploadDiv">
				<input  type="file" name='uploadFile' multiple> 				
			</div>
		</div>
		
		<div class="uploadResult">
					<ul>

					</ul>
				</div>
	
		<div class="inputArea">
			<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
		</div>

<script>
$(document).ready(function(e) {
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='imageVO["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='imageVO["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='imageVO["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='imageVO["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		formObj.append(str).submit();
	});
	
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").change(function(e) {
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data: formData,
			type: 'POST',
			success: function(result){
				console.log(result);
				showUploadResult(result);
			}
		});
	});
	
	$(".uploadResult").on("click", "button", function(e) {
		console.log("delete file");
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type: type},
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: 'text',
			type: 'POST',
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
		});
	});
	
});


var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize) {
	if(fileSize>= maxSize){
		alert("file size over");
		return false;
	}
	if(regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드 할 수 없습니다");
		return false;
	}
	return true;
}


function showUploadResult(uploadResultArr) {
	if(!uploadResultArr || uploadResultArr.length == 0){
		return;
	}
	
	var uploadUL = $(".uploadResult ul");
	
	var str = "";
	
	$(uploadResultArr).each(function(i, obj) {
		console.log(obj.image);
		var extensionName = obj.fileName.substring(obj.fileName.lastIndexOf("."));
		var pureFileName = obj.fileName.substring(0, obj.fileName.lastIndexOf("."));
		
		if(!obj.image) {	
			alert("이미지 파일이 아닙니다.");
		} else {
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/"+pureFileName + "_" + obj.uuid + "_s" + extensionName);
   
		        str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<span>" + obj.fileName + "</span>"; 
				str += "<button type='button' data-file='"+fileCallPath+"' data-type='image' class='btn btn-warning btn-circle'>";
				str += "<i class='fa fa-times'></i></button><br>"; 
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div></li>";

		}
	});
	uploadUL.append(str);
}
	
	
	
	

        </script>
	</form>
</body>
</html>