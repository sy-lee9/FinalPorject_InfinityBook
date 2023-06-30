<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  		<link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	 button{
            width: 165px;
            height: 45px;
	}
	.container {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	}	
</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">
</head>
<body>	
	<div class="container">
		<table>
			<tr>
				<th>
					<label for="email">이메일</label>
				</th>
				<td>
                    <input type="text" id="member_email" placeholder="이메일">
                    <span id="email_msg1"></span>
                    <select id="member_email2">
                    	<option>이메일 선택</option>
                        <option>@naver.com</option>
                        <option>@daum.net</option>
                        <option>@gmail.com</option>
                        <option>@hanmail.com</option>
                        <option>@yahoo.co.kr</option>
                    </select>
                    &nbsp;
                    <button onclick="findmember()">확인</button>
                </td>
	        </tr>
	        <tr>
	            <th>
	            	인증번호 확인
	            </th>		
	            <td>
	            	<input type="text" id="email_confirm" placeholder="인증번호 6자리를 입력하세요.">
	            	<span id="email_msg2"></span>
	            </td>		
			</tr>		
			<tr >	
				<th>
					비밀번호
				</th>				
				<td>						
					<input type="password" id="member_pw" placeholder="비밀번호 8자리 이상 입력하세요.">
					<span id="pw_msg1"></span>					
				</td>								
			</tr>
			<tr>	
				<th>
					비밀번호 확인
				</th>				
				<td>						
					<input type="password" id="pw_confirm" placeholder="비밀번호 확인">
					<span id="pw_msg2"></span>				
				</td>								
			</tr>
			<tr>				
				<th>
					닉네임
				</th>
				<td>						
					<input type="text" id="member_nickname" placeholder="닉네임을 입력하세요.">
					<span id="nickname_msg"></span>				
				</td>								
			</tr>
		    <tr>
		        <th>주소(시/군/구)</th>	              
				<td>
				<input type="text" id="location" name="location"  readonly /> &nbsp;&nbsp;
				<input type="button" id="address_kakao" value="검색" style="margin: 5px; font-size:15;" class="btn btn-outline-dark"/>
				</td>
		    </tr>
			<tr>
				<th colspan="2">
					<button onclick="location.href='/join'">회원가입</button>									
					<button onclick="location.href='/login.go'">취소</button>
				</th>
			</tr>
		</table>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 비밀번호 체크
var pweq = false;
//닉네임 중복 체크
var overlayNicknameChk = false;
//이메일 중복 체크
var overlayEmailChk = false;
//회원가입 버튼 클릭시 실행되는 함수
function join(){
	// 변수 선언
	var $member_email1 = $('#member_email');
	var $member_email2 = $('#member_email2');
	var $member_pw = $('#member_pw');
	var $member_nickname = $('#member_nickname');
	var $location = $('#location');
	
	// 회원가입 버튼 클릭시 실행되는 빈칸 체크
	if($member_email1.val()==''){
		alert('이메일을 입력해 주세요!');
		$member_email1.focus();
	}else if($('#member_email1').val().length <= 4){
		alert('이메일을 5자리 이상 입력해 주세요!'); 
		$member_email1.focus();
	}else if($('#member_email2').val().length <= 6){
		alert('이메일 주소를 선택해주세요!'); 
		$member_email.focus();	
	}else if($member_pw.val()==''){
		alert('비밀번호를 입력해 주세요!');			
		$member_pw.focus();			
	}else if($member_pw.val().length <= 7){
		alert('비밀번호를 8자리 이상 입력해 주세요!');
		$member_pw.focus();
	}else if($member_nickname.val()==''){
		alert('닉네임를 입력해 주세요!');
		$member_nickname.focus();			
	}else if($('#member_nickname').val().length <=1 || $('#member_nickname').val().length >=11){			
		alert('닉네임을 2글자 이상  10글자 이하로입력해주세요.');
		$member_nickname.focus();
	}else if($location.val()==''){
		alert('지역을 선택해 주세요!');
	}else if(pweq && overlayEmailChk && overlayNicknameChk){
			// 입력한 값을 배열에? 담음
			var param = {};
			param.member_email = $member_email.val() + $member_email2.val();
			param.member_pw = $member_pw.val();
			param.member_nickname = $member_nickname.val();
			param.location = $location.val();
						
			console.log(param);
			// 컨트롤러에 통신
			$.ajax({
				type:'post'
				,url:'join.ajax'
				,data:param
				,dataType:'json'
				,success:function(data){
					console.log(data);
					if(data.success == 1){
						alert('회원가입이 완료 되었습니다.');
						location.href ='./login.go';
					}else{
						alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요');						
					}
				},
				error:function(e){
					console.log(e);
					alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요');
				}
			});
			// 컨트롤러에서 갔다왔는데
		}else if(!overlayEmailChk){
			alert('중복된 이메일 입니다.');
			$member_email.focus();
		}else if(!overlayNicknameChk){
			alert('중복된 닉네임 입니다.');
			$member_nickname.focus();
		}
}

$('#member_email').on('keyup', function(e){

 var chkEmail = $('#member_email').val();      
 overlayEmailChk=false;
 console.log("중복체크 요청 : " + chkEmail);
 console.log($('#member_email').val().length);
 
 $.ajax({
    type: 'get'
    ,url: 'overlayEmail.ajax'
    ,data:{'member_email':chkEmail}
    ,dataType:'json'
    ,success:function(data){
       console.log(data);

       if($('#member_email').val().length <=4){
     	  $('#email_msg1').css({'font-size': '10px','color': 'red'});
     		$('#email_msg1').html('이메일을 5자리 이상 입력해주세요.');
       }else if(data.overlayid==0){
    	   overlayEmailChk=true;
          $('#email_msg1').css({'font-size': '10px','color': 'darkgreen'});
   		$('#email_msg1').html('사용 가능한 이메일 입니다.');
       } else {             
    	   overlayEmailChk=false;
          $('#email_msg1').css({'font-size': '10px','color': 'red'});
    		$('#email_msg1').html('이미 가입된 이메일 입니다.');
       }
    }
    ,error:function(e){
       console.log(e);
    }
 });      

});


$('#member_nickname').on('keyup', function(e){
 var chkNickname = $('#member_nickname').val();      
 console.log("중복체크 요청 : " + chkNickname);
 console.log($('#member_nickname').val().length);
 overlayNicknameChk=false;
 
 if($('#member_nickname').val().length <=1 || $('#member_nickname').val().length >=11){
 	$('#nickname_msg').css({'font-size': '10px','color': 'red'});
		$('#nickname_msg').html('닉네임을 2글자 이상  10글자 이하로입력해주세요.');
	}else{
			
 $.ajax({
    type: 'get'
    ,url: 'overlaynickname.ajax'
    ,data:{'member_nickname':chkNickname}
    ,dataType:'json'
    ,success:function(data){
		console.log(data);			
		
		if(data.overlaynickname==0){             
          overlayNicknameChk=true;
          $('#nickname_msg').css({'font-size': '10px','color': 'darkgreen'});
  		$('#nickname_msg').html('사용 가능한 닉네임 입니다.');
     }else {             
          overlayNicknameChk=false;
          $('#nickname_msg').css({'font-size': '10px','color': 'red'});
   		$('#nickname_msg').html('중복된 닉네임 입니다.');
       }
    }
    ,error:function(e){
       console.log(e);
    }
 });     
	}
});

$('#member_pw').on('keyup',function(e){

	if($('#member_pw.').val().length <=7){
		$('#pw_msg1').css({'font-size': '10px','color': 'red'});
		$('#pw_msg1').html('비밀번호를 8자리 이상 입력해주세요');
	}else{
		$('#pw_msg1').css({'font-size': '10px','color': 'darkgreen'});
		$('#pw_msg1').html('사용 가능한 비밀번호 입니다.');
	}
});


$('#confirm').on('keyup',function(e){
	pweq = false;
	if($('#pw_confirm').val() == $(this).val()){
		$('#pw_msg2').css({'font-size': '10px','color': 'darkgreen'});
		$('#pw_msg2').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{		  
		$('#pw_msg2').css({'font-size':'10px','color': 'red'});
		$('#pw_msg2').html('비밀번호가 일치 하지 않습니다');
		pweq = false;
	}	
	
});
document.getElementById("address_kakao").addEventListener("click", function(){ 
	//주소검색 버튼을 클릭하면 카카오 지도 발생
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            var sigungu = data.sigungu; // '구' 주소 넣기
            document.getElementById("location").value = sigungu;
            console.log($('#location').val());
            console.log(sigungu);
        }
    }).open();
});

/* 
ㄴ 나는 입력한 이메일에 대해 인증버튼을 누르면
ㄴ 인증번호를 메일로 줌(그메일이 아이디가 되는거네)
ㄴ 이메일 인증이됨과 동시에 아이디가 가능하다고 떠야함 */
function member_email_check(){
	   $.ajax({
	      type:'post'
	         ,url:'member_email_check.ajax'
	         ,data:{
	        	 member_email:$('#member_email').val(),
	        	 member_email2 : $('#member_email2').val()
	         }
	         ,dataType:'json'
	         ,success:function(data){
	            console.log(data);
	            if(data.findpw != null){               
	               alert('입력하신 이메일로 인증번호를 전송했습니다.\r\n 인증번호를 확인 해주세요.');	               
	            }else{
	               alert('입력한 이메일은 존재하지 않습니다.');
	            }
	         }
	         ,error:function(e){
	            console.log(e);
	            alert('오류가 발생했습니다. 잠시 후 다시 시도해 주세요');
	         }      
	   });   
}
</script>
</html>