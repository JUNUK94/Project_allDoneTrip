	
	//idSearch 체크 이벤트
	$("#idButton").on("click",function(e){
		var form = $("#idSearchForm");
		form.attr("action","/login/idSearch");
		form.attr("method","post");
		form.submit();
	});
	
	//pwSearch 체크 이벤트
	$("#pwButton").on("click",function(e){
		var form = $("#pwSearchForm");
		form.attr("action","/login/pwSearch");
		form.attr("method","post");
		form.submit();
	});