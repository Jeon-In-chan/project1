<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload with Ajax</title>
<style>
	.uploadResult {
	width:100%;
	background-color: gray; 
	}
	.uploadResult ul{
	display:flex;
	flex-flow: row;
	justify-content: center;
	align-content: center;
	}
	.uploadResult ul li {
	list-style: none;
	padding: 10px;
	}
	.uploadResult ul li img {
	width: 50px;
	}
	.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	/* background-color: gray; */
	z-index: 100;
	background: rgba(0, 0, 0, 0.5);
	}
	.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	}
	.bigPicture img {
	width: 600px;
	}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
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
		
		var cloneObj = $(".uploadDiv").clone();
		
		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			// add filedate to formdata
			for (var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size) ){
					return false;
				}
				
				formData.append('uploadFile', files[i]);
			}
		
			$.ajax({
				url : '/project1/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(result) {
					console.log(result);
					
					showUploadedFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
				}
			});

		});
		
		var uploadResult = $(".uploadResult ul")
		
		function showUploadedFile(uploadResultArr) {
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				console.log(obj.image);
				var extensionName = obj.fileName.substring(obj.fileName.lastIndexOf("."));
				var pureFileName = obj.fileName.substring(0, obj.fileName.lastIndexOf("."));
				
				if(!obj.image) {	
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/"+pureFileName + "_" + obj.uuid + extensionName);
					
					/* var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/"); */
					

					str += "<li><div><a href='/download?fileName="+ fileCallPath+"'>"
						+  "<img src='/resources/img/attach.png'>" + obj.fileName + "</a>"
						+  "<span data-file='"+fileCallPath+"' data-type='file'> x </span></div></li>";
				} else {
					//str += "<li>" + obj.fileName + "</li>";
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/"+pureFileName + "_" + obj.uuid + "_s" + extensionName);
					var originPath = obj.uploadPath + "\\" + pureFileName + "_" + obj.uuid + extensionName;
				       
				       originPath = originPath.replace(new RegExp(/\\/g),"/");
					
					str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+" '></a>"
						+  "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span></li>";
				}
			});
			
			uploadResult.append(str);
		}
		
		$(".bigPictureWrapper").on("click", function(e) {
			$(".bigPicture").animate({width:'0%',height:'0%'}, 1000);
			setTimeout(() => {
				$(this).hide();
			}, 1000);
		});
		
		$(".uploadResult").on("click", "span", function(e) {
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType:"text",
				type: 'POST',
					success: function(result) {
						alert(result);
					}
			});
			
		});
		
	});
	
	function showImage(fileCallPath) {
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html("<img src='display?fileName="+ encodeURI(fileCallPath)+"'>").animate({width:'100%',height:'100%'}, 1000);
	}
</script>
</head>
<body>
	<h1>Upload with Ajax</h1>
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' id='uploadFile' multiple>
	</div>
	<button id='uploadBtn'>Upload</button>
	<div class="uploadResult">
		<ul>
		
		</ul>
	</div>

<div class="bigPictureWrapper">
	<div class="bigPicture">
	
	</div>
</div>

</body>
</html>