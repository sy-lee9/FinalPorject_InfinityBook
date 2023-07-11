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
	table, th, td{
		border: 1px solid lightgray;
		border-collapse: collapse;
	}
	
	#content{
		display: none;		
	}
	
</style>
</head>
<body>
		<table>
			<tr>
				<td>${inquiry.inquiry_idx}</td>
			</tr>
			<tr>
				<td>${inquiry.code_idx}</td>
			</tr>
			<tr>
				<td>${inquiry.title}</td>
			</tr>
			<tr>
				<td>${inquiry.user_name}</td>
			</tr>			
			<tr>
				<td>
					<div id="div_editor"></div>
					
				</td>
			</tr>	
			<tr>
				<td>
					<button onclick="location.href=/inquiryrelplywrite.go?inquiry_idx=${inquiry.inquiry_idx}&code_idx=${inquiry.code_idx}">답변 하기</button>
				</td>
				<td>
					<button onclick="location.href=/inquirylist.go">리스트</button>
				</td>
			</tr>	
		</table>	
		<div id="content">${inquiry.inquiry_content}</div>		
</body>
<script>
/*
	var config = {};
	config.editorResizeMode = "none";// 에디터 크기조절 : none
	// 상세보기에서는 필요한 툴바만 노출한 예정(html저장, 출력, pdf저장, 코드보기)
	config.toolbar="simple";
	config.toolbar_simple="{save, print, html2pdf, code}"
*/	
	var editor = $('#div_deitor');
	editor.setHTMLCode($("#content").html()); // editor 에 내용 넣기	
	editor.setReadOnly();
	

</script>
</html>