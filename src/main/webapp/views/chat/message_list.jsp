 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 방</title>

<!-- CSS File -->
<link href="css/message_list.css" rel="stylesheet">

<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<style>
  input[type='file'] {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
  }

  input[type='file'] + label {
    display: inline-block;
    padding: 10px;
    border: none;
    border-radius: 0;
    cursor: pointer;
    background: none;
  }

  input[type='file'] + label:before {
    content: '+';
    display: block;
    text-align: center;
    font-size: 36px;
    line-height: 1;
    color: #999;
  }

  input[type='file'] + label:hover {
    background-color: #e9e9e9;
  }

  input[type='file']:focus + label,
  input[type='file'] + label:focus {
    outline: none;
  }

  #fileName {
    display: none; /* 파일명을 숨김 */
  }
</style>
</head>
<script>		
var CODE_IDX = '';
var room = '';
var other_nick = '';
var library ='';
var apply_user = '';

// 가장 처음 메세지 리스트를 가져온다.
const FirstMessageList = function(){
	$.ajax({
		url:"message_ajax_list.do",
		method:"get",
		data:{
		},
		success:function(data){
			console.log("메세지 리스트 리로드 성공");
			
			$('.inbox_chat').html(data);
			
			
			// 메세지 리스트중 하나를 클릭했을 때
			$('.chat_list').on('click', function(){
				CODE_IDX = $(this).attr('code');
				room = $(this).attr('room');
				other_nick = $(this).attr('other-nick');
				library = $(this).attr('library');					
				apply_user =$(this).attr('apply-user');
				
				// 메세지 내용을 불러오는 함수 호출
				MessageContentList(CODE_IDX,room);
				
				// 클릭한 방의 책 정보 호출
				Messagebook();
				
				$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);					
				
				$('.unread'+CODE_IDX+'a'+room).empty();
		
				// 선택한 메세지빼고 나머지는 active 효과 해제하기
				$('.chat_list_box').not('.chat_list_box'+CODE_IDX+'a'+room).removeClass('active_chat');
				//$('.chat_list_box').not('.chat_list_box.chat_list_box'+CODE_IDX+room).removeClass('active_chat');
				
				// 선택한 메세지만 active 효과 주기
				$('.chat_list_box'+CODE_IDX+'a'+room).addClass('active_chat');
				
				let send_msg = "";
				send_msg += "<div class='type_msg'>";
				send_msg += "	<div class='input_msg_write row'>";
				send_msg += "		<div class='col-11'>";
				send_msg += "			<input type='file' id='fileInput' name='photo'/>";
				send_msg += "			<label for='fileInput'></label>";
				send_msg += "			<p id='fileName'></p>";					
				send_msg += "			<input type='text' class='write_msg' placeholder='메세지를 입력...'/>";
				send_msg += "		</div>";
				send_msg += "		<div class='col-1'>";
				send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				send_msg += "		</div>";
				send_msg += "	</div>";
				send_msg += "</div>";

				
				// 메세지 입력, 전송 칸을 보인다.
				$('.send_message').html(send_msg);	
				
				// 메세지입력칸에서 엔터키 입력 시
				$('.write_msg').on('keyup',function(ev){
					if(ev.keyCode == 13){
						console.log('전송');
						SendMessage(CODE_IDX,room, other_nick);
					}
				});

				// 메세지 전송버튼을 눌렀을 때
				$('.msg_send_btn').on('click',function(){

					// 메세지 전송 함수 호출
					SendMessage(CODE_IDX,room, other_nick);
					// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
					// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
					//$('.chat_list_box:first').addClass('active_chat');
				});

				// 사진 업로드 시  
				$('#fileInput').on('change',function(event) {
				 
					SendPhoto(CODE_IDX,room, other_nick,event.target.files[0]);

				});
			});// 채팅방 클릭 끝
		}// 처음리스트 들고오기 성공 끝
	});// 리스트 ajax 끝
}
const Messagebook = function(){
	// 대화방의 상품정보를 넣는다.
	$.ajax({
		url:"message_librarydetailajax.do",
		method:"GET",
		data:{library : library},							
		datatype: 'json',
		success:function(data){
			console.log("책 가져오기 성공");
			console.log(data);
										
			let book = '<div style="display: flex;">';
			book += '<img src="' + data.LIBRARY_COVER + '" style="width: 50px; margin-right: 10px;"/>';
			book += '<div class="library">';
			book += '<div>' + data.LIBRARY_TITLE + '</div>';
			book += '<div style="font-size: 10px;">' + data.LIBRARY_INFO + '</div>';
			book += '</div>';
			book += '</div>';
			
			$('.mmgs').html(book);
			
			// 상품에 대한 상태정보
			$.ajax({
				url: "total_stateajax.do",
				method:"GET",
				data:{
					CODE_IDX : CODE_IDX,
					room : room,
					other_nick : other_nick,
					library : library
				},
				datatype: 'json',
				success:function(data){
					console.log(data);
					
					var chkbutton = '';
					// 책 정보의 상태에 따라 다르게 표시
					if(data.librarystate == 1 && data.rentck > 0 && data.rentstate == 0){
						chkbutton +='<div>현재 다름사람에게 대여 중인 책입니다.</div>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else if(data.rentstate == 3){
						chkbutton +='<div>현재 대여 중인 책입니다.</div>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else if(!data.librarystate && data.rentck > 0 && data.rentstate == 0 || data.chgck > 0 && data.changestate == 0){
						chkbutton +='<div>현재 다른사람과 약속이 잡힌 책입니다.</div>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else if(!data.librarystate && data.rentck == 0 && data.rentstate == 0 && ${sessionScope.MEMBER_IDX} != apply_user  || data.chgck == 0 && data.changestate == 0 && ${sessionScope.MEMBER_IDX} != apply_user){									
						chkbutton +='<button class="reservation">약속 잡기</button>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else if(data.rentstate == 1 && ${sessionScope.MEMBER_IDX} == apply_user || data.changestate == 1 && ${sessionScope.MEMBER_IDX} == apply_user){
						chkbutton +='<button class="reservationok">약속 승인</button>';
						chkbutton +='<button class="reservationno">약속 취소</button>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else if(data.rentstate == 1 && ${sessionScope.MEMBER_IDX} != apply_user || data.changestate == 1 && ${sessionScope.MEMBER_IDX} != apply_user){
						chkbutton +='<button class="reservationno">약속 취소</button>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else if(data.rentstate == 2 || data.changestate == 2){
						chkbutton +='<button class="reservationno">약속 취소</button>';
						chkbutton +='<button class="chatout">나가기</button>';
					}else{
						chkbutton +='<button class="chatout">나가기</button>';
					}
					
					$('.library').html($('.library').html() + chkbutton);
					
					// 약속 잡기 클릭 시
					$('.reservation').on('click',function(){
						console.log('약속잡기 이벤트 발생');

						openPopup()

						function openPopup() {
						    var screenWidth = window.screen.availWidth;
						    var screenHeight = window.screen.availHeight;
						    var popupWidth = 500;
						    var popupHeight = 850;
						    var left = (screenWidth - popupWidth) / 2;
						    var top = (screenHeight - popupHeight) / 2;    

						    window.open('reservation.go?code_idx='+CODE_IDX+'&idx='+room+'&other_nick='+other_nick, '약속 잡기',  'width=500, height=500, left=' + left + ', top=' + top);
						}

					});
					
					// 수락 버튼 클릭 시
					$('.reservationok').on('click',function(){																	
						console.log('약속 수락 이벤 발생');
						
						$.ajax({
							url: "reservationok_ajax.do",
							method:"GET",
							data:{
								CODE_IDX : CODE_IDX,
								room : room,
								other_nick : other_nick,
								library : library
							},
							datatype: 'json',
							success:function(data){
								console.log(data);
								
								// 메세지 리스트 리로드
								FirstMessageList();
								
								// 메세지 내용  리로드
								MessageContentList(CODE_IDX,room);
																				
								
								
								if(data == 1){													
									alert('보증금이 부족합니다.');																										
								}else if(data == 2){
									alert('약속을 수락했습니다.');													
								}																																			
							},error : function(e){
								console.log(e);
							}
						});
						
					});
					
					// 거절 버튼 클릭 시
					$('.reservationno').on('click',function(){																	
						console.log('약속 취소 이벤 발생');						 
						
						$.ajax({
							url: "reservationno_ajax.do",
							method:"GET",
							data:{
								CODE_IDX : CODE_IDX,
								room : room,
								other_nick : other_nick,
								library : library
							},
							datatype: 'json',
							success:function(data){
								console.log(data);																									
								
								if(data > 0){
									// 메세지 내용  리로드
									MessageContentList(CODE_IDX,room);
														
									// 메세지 리스트 리로드
									FirstMessageList();
									
									alert('약속 취소 했습니다.');
								}							
							},error : function(e){
								console.log(e);
							}
						});						
					});
					
					// 나가기 버튼 클릭시	 													
					$('.chatout').on('click',function(){							
						console.log('나가기 버튼 이벤 발생');	
						
						$.ajax({
							url: "chatout_ajax.do",
							method:"GET",
							data:{
								CODE_IDX : CODE_IDX,
								room : room,
								other_nick : other_nick,
								library : library
							},
							datatype: 'json',
							success:function(data){
								console.log(data);																				
																																																									
								if(data == 1){
									alert('현재 약속 수락대기 상태입니다. \r\n약속 취소 후 시도해주세요.');
									
								}else if(data == 2){
									alert('현재 예약중인 상태입니다. \r\n약속 취소 후 시도해주세요.');
									
								}else if(data == 3){
									alert('현재 대여중인 상태입니다. \r\n책을 돌려받거나 돌려준 후 가능합니다.');
									
								}else{
									// 해당 채팅내역, 책 정보, 메세지 전송칸 지우기
									$('.msg_history').html("");
									$('.mmgs').html("");
									$('.send_message').html("");																					
									// 메세지 리스트 리로드
									FirstMessageList();
									
									alert('채팅방을 나갔습니다.');
								}						
							},error : function(e){
								console.log(e);
							}
						});											 
					});// 나가기 끝														
				},error : function(){// 책불러오기 성공 후
					alert('에러');
				}
			});// 상태 불러오기 후							
		},error : function(){// 상태 불러오기 성공 후
			alert('서버 에러');
		}		
	});// 상품들고오기 ajax 끝		
}
	
// 메세지 내용을 가져온다.
// 읽지 않은 메세지들을 읽음으로 바꾼다.
const MessageContentList = function(CODE_IDX, room) {
	
	$.ajax({
		url:"message_content_list.do",
		method:"GET",
		data:{
			CODE_IDX : CODE_IDX,
			room : room
		},
		success:function(data){
			console.log("메세지 내용 가져오기 성공");
			
			// 메세지 내용을 html에 넣는다
			$('.msg_history').html(data);
			$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
										
		},
		error : function() {
			alert('서버 에러');
		}
	});


}
	
const SendPhoto = function(CODE_IDX,room, other_nick,photo){
	console.log(CODE_IDX);
	console.log(room);
	console.log(other_nick);
	console.log(photo);
	console.log(photo.name);
   
	var extidx = photo.name.lastIndexOf(".");	  
	var ext = photo.name.slice(extidx + 1).toLowerCase();
	
	if(ext != 'jpg' && ext !='png' && ext !='gif'){
		alert('확장자가 jpg,png,gif 인 파일만 전송 할 수 있습니다.');
	}else if(photo.size >= 50000000){
		alert('사이즈가 50MB 이하인 파일만 전송 할 수 있습니다.');
	}else{
		
		var formData = new FormData(); // FormData 객체 생성
	    formData.append('photo', photo); // 파일 추가
	    formData.append('CODE_IDX', CODE_IDX); // 나머지 필드 추가
	    formData.append('IDX', room); // 나머지 필드 추가other_nick
	    formData.append('CHAT_RECIEVER', other_nick);
		$.ajax({
		      type: 'post',
		      url: 'chatphoto.ajax',
			  data: formData,							     
		      processData: false, // 데이터를 처리하지 않음
		      contentType: false, // 컨텐츠 타입을 설정하지 않음
		      success: function (data) {
		    	  console.log(data);			    	  
		    	// 웹소캣으로 실시간 전달
				send(CODE_IDX,room,other_nick,data);
		    	
				// 메세지 내용  리로드
				MessageContentList(CODE_IDX,room);
									
				// 메세지 리스트 리로드
				FirstMessageList();
	
		      },
		      error: function (e) {
		        console.log(e);
		      }
		    });
	}
};
	
// 메세지를 전송하는 함수
const SendMessage = function(CODE_IDX,room, other_nick){
	
	let content = $('.write_msg').val();
	//alert("content: " + content);

	content = content.trim();
	
	if(content == ""){
		alert("메세지를 입력하세요!");
	}else{
		$.ajax({
			url:"message_send_inlist.do",
			method:"GET",
			data:{
				CODE_IDX : CODE_IDX,
				room : room,
				other_nick: other_nick,
				content: content
			},
			success:function(data){
				console.log("메세지 전송 성공");
				
				// 웹소캣으로 실시간 전달
				send(CODE_IDX,room,other_nick,content);		
				// 메세지 입력칸 비우기
				$('.write_msg').val("");
				
				// 메세지 내용  리로드
				MessageContentList(CODE_IDX,room);
									
				// 메세지 리스트 리로드
				FirstMessageList();				
			},
			error : function() {
				alert('서버 에러');
			}
		});
	}	
};	

function getId(id){
	return document.getElementById(id);
}
	
function getName(name){
	return document.getElementsByClassName(name);
}
	
var data = {};//전송 데이터(JSON)

var ws ;
var btnSend = getName('btnSend');
var chat = getName('chat_list');
var msg = getName('write_msg');

var ws = new WebSocket("ws://" + location.host + "/chat");	

ws.onmessage = function(msg) {
	
		var talk = getId('talk');
		let open = $('.active_chat');
		console.log(open);
		/*
		var tCODE_IDX = $('.reservation').attr('code');
		var troom = $('.reservation').attr('room');
		*/
		var ch = getId('ch');
		var receivedData = JSON.parse(msg.data);
		
		console.log(receivedData.content);
		
	
		
	  // 받은 메세지가 
	  // 사진을 받았을 시 ext != 'jpg' && ext !='png' && ext !='gif'
	  // talk div 추가해야함(껍데기한번더 씌워야해)
	  if (CODE_IDX == receivedData.code && room == receivedData.room && receivedData.content.startsWith('/upload/') && receivedData.content.endsWith('jpg') || receivedData.content.endsWith('png') || receivedData.content.endsWith('gif')) {
	      let img = '<div class="incoming_msg"> <div class="received_withd_msg"> <image src="'+receivedData.content+'"width="80%" height="50%"/><span class="time_date">'+receivedData.date+'</span></div></div>';
	      console.log('들어와?');
	      //talk = getId('talk');
	      //$(".msg_history").innerHTML += item;
	      //$(".msg_history").html() += item;
		  //talk.scrollTop = talk.scrollHeight; //스크롤바 하단으로 이동
		  
		  $('.msg_history').html($('.msg_history').html() + img);

		  $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
		  
		  // 리스트 리로드
		  FirstMessageList();
		  
		  
	// 그냥 메세지일시 			  		    
	  }else if(CODE_IDX == receivedData.code && room == receivedData.room){
	      let chat = '<div class="incoming_msg"> <div class="received_withd_msg"> <p>'+receivedData.content+'</p><span class="time_date">'+receivedData.date+'</span></div></div>';
	      console.log('들어와?');
	      //talk = getId('talk');
	      //$(".msg_history").innerHTML += item;
	      //$(".msg_history").html() += item;
		  //talk.scrollTop = talk.scrollHeight; //스크롤바 하단으로 이동
		  
		  $('.msg_history').html($('.msg_history').html() + chat);

		  $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);  		
		  
		  // 리스트 리로드
		  FirstMessageList();			  		  
	  }	 
}
		  
function send(CODE_IDX,room,other_nick,content){			
	data.	code =  CODE_IDX;
	data.	room =  room;
	data.send_midx = ${sessionScope.MEMBER_IDX};
	data.recv_midx= other_nick;
	data.content = content;
	data.date = new Date().toLocaleString();
	var temp = JSON.stringify(data);
	ws.send(temp);			
}
	
	
$(document).on('click',function(ev){

	$.ajax({
		url:"read_chk.do",
		method:"GET",
		data:{
			CODE_IDX : CODE_IDX,
			room : room
		},
		success:function(data){
			$('.unread'+CODE_IDX+'a'+room).empty();		
			
		},
		error : function() {
			
		}
	});
});
	
$(document).ready(function(){

	console.log('aaa');
	
	FirstMessageList();
	
});	
</script>
<body>



	<br />
	<br />
	<br /> 
	<br /> 
	<br /> 
	
	<div class="msg-container">
	
		<div class="messaging">
	      <div class="inbox_msg">
	      	<!-- 메세지 목록 영역 -->
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>List</h4>
	            </div>
	            <!-- 메세지 검색 -->
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	              <!-- 
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>	                
	                </span>
				 	-->	                
	                 
	              </div>	              
	            </div>	            
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">		          
	          </div>
	        </div>	        
	        <!-- 메세지 내용 영역 -->	       
	        <div class="mesgs">
				<!-- 책 정보,나가기 버튼 영역 -->
				<div class="mmgs">
				</div>
				<!-- 메세지 내용 목록 -->
				<div class="msg_history" name="contentList" id="ch">
				<!-- 메세지 내용이 올 자리 -->
				</div>
				<div class="send_message">
				<!-- 메세지 입력란이 올자리 -->
				</div>				
				</div>
	      </div>	      
	    </div>
	</div>
</body>
</html>