var ws = new WebSocket("ws://" + location.host + "/alarm");	
var alarm = '.';
alarmchk();

ws.onmessage = function(msg) {

	alarmchk();
			  		  
}

alarm_send();

var data = {};//전송 데이터(JSON)

function alarm_send(){			
	data = alarm;
	var temp = JSON.stringify(data);
	ws.send(temp);			
}


function alarmchk(){

		$.ajax({
			url:"alarmchk.ajax",
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