<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>

	<style>
	div{
	display:block;
	}
	
	</style>
</head>
<body>
	<form action="BookReportWrite.do" method="post">
	<h3>감상문 등록</h3>
	<select name="reportOpen" id="reportOpen">
	    <option value="select">공개여부</option>
	    <option value="open">공개</option>
	    <option value="hide">비공개</option>
  	</select>
	<input type="text"  name="reportTitle" value="제목을 입력해주세요."/>
	<h3>텍스트 에디터 들어갈 자리</h3>
	<div id="div_editor"></div>
	<input type="button" onclick="save()" value="등록"/>
	<input type="hidden" name="content"/>
	</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
var config = {};


//editor 크기 조절 불가
config.editorResizeMode = "none"; 

//파일 업로드 관련 설정
config.file_upload_handler = function(file,callback){
console.log(file);
// file정보 : 크기, 이름, 종류 등을 알 수 있다.
if(file.size>(1*1024*1024)){
	alert('1MB 이하 파일만 업로드 가능합니다.');
	callback('/images/noimage.png');
}
console.log(callback);
}
var editor = new RichTextEditor("#div_editor",{ skin: "gray", toolbar: "basic" });

function save(){
console.log('저장');
var content = editor.getHTMLCode();
console.log(content.length);
console.log(content);
if(content.length>(4*1024*1024)){
	alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여주세요');
}else{
	$('input[name="content"]').val(content);
	$('form').submit();
}
}

</script>
</html>