


var socket = null;
$(document).ready(function(){
	//소켓 연결
	connectWs();
});

function connectWs(){
	//WebSocketConfig에서 설정한 endPoint("/push")로 연결
	var ws = new SockJS("/push");
	socket = ws;
	
	ws.onopen = function() {
		console.log('open');
	};

	ws.onmessage = function(event) {
		console.log('소켓에서 받은거: ' + event.data);
		let $socketAlert = $('#socketAlert');
        //EchoHandler에서 설정한 메세지 넣어줌
		$socketAlert.html(event.data)
		$socketAlert.css('display', 'block');
		
        //일정 시간 지나면 알림 사라짐
		setTimeout(function(){
			$socketAlert.css('display','none');
		}, 5000);
	};

	ws.onclose = function() {
		console.log('close');
	};
 
};

/* 부모댓글 등록 */	
$('#replyAddBtn').on('click', function(){
console.log("댓글달기 알림-녕");
	//웹 소켓의 알림 메시지에 필요한 정보들
	var replyForm = $('#replyForm').val();
	var param = { "replyForm" : replyForm};
	
	if (socket){
					alert('소켓에 메세지를 보냈습니다: ' + replyForm);
					let socketMsg = "replyForm," + replyForm;
					socket.send(socketMsg);
			}

/*
	$.ajax({
		url 	: "/reply.ajax",
		type 	: "post",
		data 	: param,
		success : function(resp){
			alert('댓글이 등록되었습니다.');
			location.reload();
			//웹 소켓 관련 로직 추가
			
				if (socket){
					
					let socketMsg = "replyForm," + replyForm;
					socket.send(socketMsg);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown){
			alert('댓글 등록이 실패하였습니다.');
		}
	}); */
});