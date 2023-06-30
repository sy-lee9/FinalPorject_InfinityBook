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
					//alert('room : '+ $(this).attr('room'));
					let CODE_IDX = $(this).attr('code');
					let room = $(this).attr('room');
					let other_nick = $(this).attr('other-nick');
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(CODE_IDX,room);
					$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
					
					
					$('.unread'+CODE_IDX+'a'+room).empty();
					/*
					
					console.log($('.chat_list_box'));
					*/					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+CODE_IDX+room).removeClass('active_chat');
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
					
					
					  
					  $('#fileInput').on('change',function(event) {
						  
						  SendPhoto(CODE_IDX,room, other_nick,event.target.files[0]);
						
						  /*
					    var selectedFile = event.target.files[0];
					    fileName.textContent = selectedFile.name;	
					    
					    
					    
					    console.log(selectedFile.size);
											    
					    var fileInput = getId('fileInput');
					  	
						var pCODE_IDX = $('#talk').attr('code');
						var proom =$('#talk').attr('room');
						
						console.log(ext);
						
						if(ext != 'jpg' && ext !='png' && ext !='gif'){
							alert('확장자가 jpg,png,gif 인 파일만 전송 할 수 있습니다.');
						}else if(selectedFile.size >= 50000000){
							alert('사이즈가 50MB 이하인 파일만 전송 할 수 있습니다.');
						}else{
							
							var formData = new FormData(); // FormData 객체 생성
						    formData.append('photo', selectedFile); // 파일 추가
						    formData.append('CODE_IDX', pCODE_IDX); // 나머지 필드 추가
						    formData.append('IDX', proom); // 나머지 필드 추가other_nick
						    formData.append('CHAT_RECIEVER', other_nick);
						    
							$.ajax({
							      type: 'post',
							      url: 'chatphoto.ajax',
								  data: formData,							     
							      processData: false, // 데이터를 처리하지 않음
							      contentType: false, // 컨텐츠 타입을 설정하지 않음
							      success: function (data) {
							    	console.log(data);
							    	let pdata = {};//전송 데이터(JSON)
							    	
							    	pdata.code =  CODE_IDX;
									pdata.room =  room;
									pdata.send_midx = ${sessionScope.MEMBER_IDX};
									pdata.recv_midx= other_nick;
									pdata.content = data;
									pdata.date = new Date().toLocaleString();
									let temp = JSON.stringify(pdata);							    	
									ws.send(temp);	
									MessageContentList(CODE_IDX,room);
							    	
							      },
							      error: function (e) {
							        console.log(e);
							      }
							    });													
						}
						*/
					  });
				});
			}
		});
	}
					

	// 메세지 전송시
	// 메세지 리스트를 다시 가져온다.
	/*
	const MessageList = function(){
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
					//alert('room : '+ $(this).attr('room'));
					let CODE_IDX = $(this).attr('code');
					let room = $(this).attr('room');
					let other_nick = $(this).attr('other-nick');
					
					console.log($('.chat_list_box'));
					
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+CODE_IDX+room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+CODE_IDX+'a'+room).addClass('active_chat');
					/*
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					send_msg += "		<div class='col-11'>";
					send_msg += "			<input type='file' name='photo'/><input type='text' class='write_msg' placeholder='메세지를 입력...'/>";
					send_msg += "		</div>";
					send_msg += "		<div class='col-1'>";
					send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "		</div>";
					send_msg += "	</div>";
					send_msg += "</div>";
					
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
					
					var fileInput = getId('fileInput');
					  console.log(fileInput);
					  var fileName = getId('fileName');
					  console.log(fileName);
					  
					  $('#fileInput').on('change',function(event) {
					    var selectedFile = event.target.files[0];
					    fileName.textContent = selectedFile.name;					   					   
					    
					    console.log(selectedFile.size);
											    
						var extidx = fileName.innerHTML.lastIndexOf(".");	  
						var ext = fileName.innerHTML.slice(extidx + 1).toLowerCase();
						var pCODE_IDX = $('#talk').attr('code');
						var proom =$('#talk').attr('room');
						
						console.log(ext);
						
						
					  });

					  
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
					
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(CODE_IDX,room);
					
					
				});
				
				// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
				// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
				$('.chat_list_box:first').addClass('active_chat');
				
			}
		});
	}
    */
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(CODE_IDX,room) {
		
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
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		});
		/*
		$('.unread'+CODE_IDX+'a'+room).empty();
		
		
		*/
	
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
					//MessageList();
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
					//MessageList();
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
			var tCODE_IDX = $('#talk').attr('code');
			var troom =$('#talk').attr('room');
			var item;
			var ch = getId('ch');
			var receivedData = JSON.parse(msg.data);
			
			
			var wbptidx = receivedData.content;
			var wbptidx = receivedData.content.lastIndexOf(".");	  
			var whpext = receivedData.content.slice(wbptidx + 1).toLowerCase();
			
			console.log(receivedData.content);
			
		
			
		  // 받은 메세지가 
		  // 사진을 받았을 시 ext != 'jpg' && ext !='png' && ext !='gif'
		  // talk div 추가해야함(껍데기한번더 씌워야해)
		  if (tCODE_IDX == receivedData.code && troom == receivedData.room && receivedData.content.startsWith('/upload/') && receivedData.content.endsWith('jpg') || receivedData.content.endsWith('png') || receivedData.content.endsWith('gif')) {
		      item = '<div class="incoming_msg"> <div class="received_withd_msg"> <image src="'+receivedData.content+'"width="80%"/><span class="time_date">'+receivedData.date+'</span></div></div>';
		      console.log('들어와?');
		      //talk = getId('talk');
		      //$(".msg_history").innerHTML += item;
		      //$(".msg_history").html() += item;
			  //talk.scrollTop = talk.scrollHeight; //스크롤바 하단으로 이동
			  
			  ch.innerHTML += item;
			  
			  
			  // 리스트 리로드
			  //MessageList();
			  FirstMessageList();
			  
			  
		// 그냥 메세지일시 			  		    
		  }else{
		      item = '<div class="incoming_msg"> <div class="received_withd_msg"> <p>'+receivedData.content+'</p><span class="time_date">'+receivedData.date+'</span></div></div>';
		      console.log('들어와?');
		      //talk = getId('talk');
		      //$(".msg_history").innerHTML += item;
		      //$(".msg_history").html() += item;
			  //talk.scrollTop = talk.scrollHeight; //스크롤바 하단으로 이동
			  
			  ch.innerHTML += item;
			  
			  
			  
			  //리스트 리로드
			  //MessageList();
			  FirstMessageList();
			  
			  
		  }
		  $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
	}


		  
	function send(CODE_IDX,room,other_nick,content){
/*		let content = $('.write_msg').val();
		if(content.trim() != ""){
			data.	code =  $(this).attr('code');
			data.	room =  $(this).attr('room');
			data.send_nick = ${sessionScope.MEMBER_IDX};
			data.recv_nick= $(this).attr('other-nick');
			data.content = content;
			data.date = new Date().toLocaleString();
			var temp = JSON.stringify(data);
			ws.send(temp);
*/				
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
		var CODE_IDX = $('#talk').attr('code');
		var IDX =$('#talk').attr('room');
		
		$.ajax({
			url:"read_chk.do",
			method:"GET",
			data:{
				CODE_IDX : CODE_IDX,
				IDX : IDX
			},
			success:function(data){
				$('.unread'+CODE_IDX+'a'+IDX).empty();		
				
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
				<div style="text-align: right;">
					<button style="margin-left: 10px;">예약 확정</button>
					<button>나가기</button>
				</div>
	          <!-- 메세지 내용 목록 -->
	          <div class="msg_history" name="contentList" id="ch">
	            <!-- 메세지 내용이 올 자리 -->
	          </div>
	          <div class="send_message">
	          </div>
	          <!-- 메세지 입력란이 올자리 -->
	        </div>
	      </div>
	      
	    </div>
	</div>
	
	
</body>
</html>