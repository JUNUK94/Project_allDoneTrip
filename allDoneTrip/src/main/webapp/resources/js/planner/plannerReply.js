$(document).ready(function(){

//=================================================선언부===========================================================	

	var plannerReply = $("#plannerReply");
	var sessionForm = $("#sessionForm");
	var replyDelete =$("#replyDelete");
	
	var plan_No = sessionForm.find("input[name='plan_No']").val();
	var nick_Name = sessionForm.find("input[name='nick_Name']").val();
	var email = sessionForm.find("input[name='email']").val();
	
//=================================================이벤트 영역========================================================	
	
	//댓글 등록
	$("#sendPlannerReply").on("click",function(){
		
		//일시 가져오기
		var d = new Date();
		var year = d.getFullYear();
		var month = d.getMonth()+1;
		var date = d.getDate();
		var hour = d.getHours();
		var min = d.getMinutes();
		var sec = d.getSeconds();

		//ajax로 보낼 변수
		var pr_Content = plannerReply.val();
		var regdate = year + "." + month + "." + date + "/" + hour + ":" + min + ":" + sec;
		
		if(email != null && email != ""){
			$.ajax({
				url: '/planner/replyWrite',
				type: 'post',
				dataType: 'JSON',
				data: {plan_No:plan_No, nick_Name:nick_Name, pr_Content:pr_Content, regdate:regdate, email:email},
				async: false,
				success: function(map){
					alert("댓글이 등록되었습니다.");
					window.location.reload();
				},
				error:function(){
					alert("댓글 등록에 실패하였습니다.");
				}
			});//end of Ajax
		}else{
			alert("먼저 로그인이 필요합니다.");
		}	
	});

}); //end of ajax


//댓글 삭제 이벤트
function replyDelete(p_Rno){
	
	event.preventDefault();
	var plan_No = document.getElementsByName('plan_No')[0].value;
	
	$.ajax({
        url: '/planner/replyDelete',
        type: 'post',
        dataType: 'JSON',
        data: {plan_No:plan_No, p_Rno:p_Rno},
        success: function(map){
			console.log(map);
        	alert(map.message);
        	window.location.reload();
        },
        error:function(request, error){
        	alert(request.responseText);
        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
        }
	});//end of Ajax
}

//답글 등록 이벤트
function reReplyInsert(p_Rno, index){

	//ajax로 보낼 변수
	var plan_No = document.getElementsByName('plan_No')[0].value;
	var nick_Name = document.getElementsByName('nick_Name')[0].value;
	var email = document.getElementsByName('email')[0].value;
	var pr_Content = document.getElementById("reReplyText"+index).value;
	var up_Prno = p_Rno;
	
	var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth()+1;
	var date = d.getDate();
	var hour = d.getHours();
	var min = d.getMinutes();
	var sec = d.getSeconds();

	var regdate = year + "." + month + "." + date + "/" + hour + ":" + min + ":" + sec;
	if(email != null && email != ""){
		$.ajax({
			url: '/planner/reReplyWrite',
			type: 'post',
			dataType: 'JSON',
			data: {plan_No:plan_No, p_Rno:p_Rno, nick_Name:nick_Name, email:email, pr_Content:pr_Content, regdate:regdate, up_Prno:up_Prno},
			success: function(map){
				alert("답글이 등록되었습니다.");
				window.location.reload();
			},
			error:function(request, error){
				alert('error');
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
			}
		});//end of Ajax
	}else{
		alert("먼저 로그인이 필요합니다.");
	}
}


//버튼 클릭시 답글 리스트 띄우기 이벤트
function show_reReplyList(index){

	event.preventDefault();
	
	var plan_No = document.getElementsByName('plan_No')[0].value;
	var reply_writeframe = document.getElementById("reReply"+index);
	var frame = document.getElementById("reReplyList"+index);
	var aTag = document.getElementById("count_reReply"+index);
	
	if(frame.style.display == "none"){
		reply_writeframe.removeAttribute("style");
	}else{
		reply_writeframe.setAttribute("style","display:none");
	}

	if(frame.style.display == "none"){
		frame.style.display = '';
	}else{
		frame.style.display = 'none';
	}
}