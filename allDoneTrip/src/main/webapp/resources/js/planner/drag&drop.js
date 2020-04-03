$(document).ready(function(){
	
	//드래그 시작시 - ajax로 통신하여 데이터 가져옴
	$("li").on("dragstart", function(e){	
	
		var id = $(this).attr("id");
		var arr = [];

		console.log('start');
		console.log('id = ' + id);
		
		$.ajax({
	        url:'/planner/cityInfo',
	        dataType:'JSON',
	        type:'POST',
	        async: false,
	        data:{"img":"펭하.jpg","title":"귀여운 펭수", "text":"신이나~ 신이나~ 참치먹고 신이나~ 어이어이어이어이! 신이나~"},
	        success:function(map){
	        	
	        	arr.push(map.img);
	        	arr.push(map.title);
	        	arr.push(map.text);
	        	console.log("arr = "+arr);
	        }
		});//end of Ajax
		
		event.dataTransfer.setData('img', arr[0]);
		event.dataTransfer.setData('title', arr[1]);
		event.dataTransfer.setData('text', arr[2]);
		
	});
	
	
	// 드롭하는 부분에 마우스가 올라갔을 때의 이벤트(필수)
	$("div.1").on("dragover", function(e){
		e.preventDefault();
	});
	
	
	// 드롭하는 부분에 발생하는 이벤트-내용 append
	$("div.1").on("drop", function(e){
		var img = event.dataTransfer.getData('img');
		var title = event.dataTransfer.getData('title');
		var text = event.dataTransfer.getData('text');
		
		var str = img + title + text;
		
		$(this).html("");
		$(this).append(str);
	});
	
});
