<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Editor</title>

<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
<link rel="stylesheet" href="/richtexteditor/res/style.css">

<script src="/richtexteditor/rte.js"></script>
<script src="/richtexteditor/plugins/all_plugins.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	input[type="text"]{
		width: 100%;
		border: 1px solid lightgray;
	}
	table{
		margin-left: 45px;
	}
	
</style>
</head>
<body>
	<form id="inquiry" action="/inquiryreplywrite.do" method="post">
	<input type="hidden" name="inquiry_idx" value="${inquiry_idx}"/>
	<input type="hidden" name="code_idx" value="${code_idx}"/>
		<table>			
			<tr>
				<td><input type="text" name="inquiry_title" placeholder="제목"/></td>
			</tr>
			<tr>
				<td>
					<div id="div_editor"></div>
					<input id="content" type="hidden" name="inquiry_content"/>
				</td>
			</tr>	
			<tr>
				<td><input type="button" onclick="save()" value="확인"/></td>
			</tr>	
		</table>	
	</form>
</body>
<script>
	var config = {};
	config.editorResizeMode = "none";// 에디터 크기조절 : none
	
	// 파일 업로드
	config.file_upload_handler = function(file, callback){// file 정보, 이미지 경로 변경 함수
		console.log(file);	// 크기, 이름, 종류 등을 알 수 있다.
		console.log(callback);		
		if(file.size>(1*1024*1024)){
			alert("1MB 이상의 파일은 업로드 할 수 없습니다.");
			callback('/upload/noimage.png');
		}
	}
	var editor = new RichTextEditor("#div_editor", config);
	
	function save(){
		console.log('저장');
		var content = editor.getHTMLCode();
		console.log(content.length);
		if(content.length > (4*1024*1024)){
			alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여 주세요.');
		}else{
			$('input[id="content"]').val(content);
			$('form').submit();
		}
		
	}


</script>
</html>