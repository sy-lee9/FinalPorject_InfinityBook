var ws = new WebSocket("ws://" + location.host + "/chat");	

alarmchk();

ws.onmessage = function(msg) {
	
	
	setInterval(alarmchk(), 1000);

	console.log('받아?');
			  		  
}

var data = {};//전송 데이터(JSON)





function alarm_send(){			

	var temp = JSON.stringify("a");
	ws.send(temp);			
}


function alarmchk(){

		$.ajax({
			url:"/alarmchk.ajax",
			method:"GET",
			data:{
			},
			success:function(data){
				console.log(data);
				if(data > 0){
					$('.alarm').html(data);
					$('.alarm').css('display', 'block');
				}
				
			},
			error : function() {

			}
		});
}	 
