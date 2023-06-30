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
	 button {
            width: 150px;
            height: 45px;
	}
	.container {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	}
	.certifi {
	    display: none;
	}
		
</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">
</head>
<body>	
	<div class="container">
		<form action="join.do">
			<table>
				<tr>
					<td>
						<label for="email">이메일</label>
					</td>
					<td>
                <div class="form-group email-form">
                    <div class="input-group">
                        <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" style="display:inline;">
                        <select class="form-control" name="userEmail2" id="userEmail2">
                            <option>@naver.com</option>
                            <option>@daum.net</option>
                            <option>@gmail.com</option>
                            <option>@hanmail.com</option>
                            <option>@yahoo.co.kr</option>
                        </select>
                    </div>
                </div>
            </td>
            <td>
                <div class="input-group-addon">
                    <button type="button" class="btn btn-primary" id="mail-Check-Btn">이메일 인증요청</button>
                </div>
            </td>
		        </tr>
		        <tr>
		            <td class="certifi" style="display: none;">
		                <div class="mail-check-box">
		                    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
		                </div>
		                <span id="mail-check-warn"></span>
		            </td>				
				</tr>		
				<tr >	
					<td>
						비밀번호
					</td>				
					<td>						
						<input type="password" name="" placeholder="비밀번호 8자리 이상 입력">				
					</td>								
				</tr>
				<tr>	
					<td>
						비밀번호 확인
					</td>				
					<td>						
						<input type="password" name="" placeholder="비밀번호 확인">				
					</td>								
				</tr>
				<tr>				
					<td>
						닉네임
					</td>
					<td colspan="1">						
						<input type="text" name="" placeholder="닉네임을 입력하세요.">				
					</td>								
				</tr>
			    <tr>
			      <th>주소</th>
	              <td>
	                  <input type="text" id="postcode" name="postcode" placeholder="우편번호">
	                  <input type="button" onclick="execDaumPostcode()" value="주소 찾기(시/구)"><br>
	                  <input type="text" id="address" name="address" placeholder="주소"><br>	                  
	              </td>
			    </tr>

				
				<tr>
					<td><a href="join.do">회원가입</a></td>
					<td><a href="login.go">취소</a></td>
				</tr>
			</table>
		</form>		
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 동 정보를 제외한 시/구 정보 추출
            var city = '';
            var district = '';

            // 시/도 정보 추출
            var cityIndex = addr.indexOf('시');
            var province = addr.substring(0, cityIndex + 1);

            // 시/구 정보 추출
            var districtIndex = addr.indexOf('구');
            if (districtIndex !== -1) {
                city = addr.substring(cityIndex + 1, districtIndex + 1);
                district = addr.substring(districtIndex + 1);
            } else {
                city = addr.substring(cityIndex + 1);
            }

            var simplifiedAddr = province + ' ' + city;

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }

                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }

                var extraAddressElement = document.getElementById("extraAddress");
                if (extraAddressElement) {
                    extraAddressElement.value = extraAddr;
                }
            } else {
                var extraAddressElement = document.getElementById("extraAddress");
                if (extraAddressElement) {
                    extraAddressElement.value = '';
                }
            }

            var postcodeElement = document.getElementById('postcode');
            var addressElement = document.getElementById("address");
            var detailAddressElement = document.getElementById("detailAddress");

            if (postcodeElement) {
                postcodeElement.value = data.zonecode;
            }

            if (addressElement) {
                addressElement.value = simplifiedAddr;
            }

            if (detailAddressElement) {
                detailAddressElement.focus();
            }
        }
    }).open();
}




document.getElementById("mail-Check-Btn").addEventListener("click", function() {
    var certifiTd = document.querySelector('.certifi');
    certifiTd.style.display = 'table-cell';
});

$('#mail-Check-Btn').click(function() {
	const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send eamil
</script>
</html>