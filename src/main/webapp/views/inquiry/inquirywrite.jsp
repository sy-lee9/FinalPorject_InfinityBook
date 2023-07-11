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
	<form id="inquiry" action="/inquirywrite.do" method="post">
		<table>			
			<tr>
				<td>
					<select name="code_idx" id="code_idx">
					<option value="default">문의 종류</option>
						<option value="61">이벤트 문의</option>
						<option value="62">계정 문의</option>						
						<option value="63">결제 문의</option>
						<option value="64">기타 문의</option>
					</select>						
				</td>
			</tr>
			<tr>
				<td><input type="text" name="inquiry_title" placeholder="제목"/></td>
			</tr>
			<tr>
				<td>
					<div id="div_editor"></div>
					<input id="inquiry_content" type="hidden" name="inquiry_content"/>
				</td>
			</tr>	
			<tr>
				<td><input type="button" onclick="save()" value="저장"/></td>
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
		console.log($('#code_idx').val());
		var content = editor.getHTMLCode();
		console.log(content.length);
		if(content.length > (4*1024*1024)){
			alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여 주세요.');
		}else if($('#code_idx').val() == 'default'){
			alert('문의 종류를 선택 해 주세요.');
		}else{
			$('input[id="inquiry_content"]').val(content);
			$('form').submit();
		}
	}
	
	/*	data:image 방식
		장점 : 서버에서 별도의 파일처리 과정이 없어 사용이 간단하다. 
		단점 :	 용량제어가 어렵고, 기존파일보다 용량이 커진다.(base64 인코딩시 크기가 커진다.)
	
		tomcat 에서 post 방식으로허용하는 기본 크기는 2MB 이다.(텍스트만..)
		data:image 를 사용하면 문자열의 크기가 커지기 때문에 controller 에서 null 로 받게 된다.
		
		해결방법 1 : server.xml 에서 Connector 에 maxPostSize="-1"(무제한) 을 해 주거나  2MB(2*1024*1024) 보다 큰 수를 지정한다.
		
		해결방법 2: 내장톰캣 사용시 application.properties 에서 설정 해 준다.
	
	*/

</script>
</html>