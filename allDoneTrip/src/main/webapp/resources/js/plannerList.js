$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	var sortForm = $("#sortForm");
	
	//페이지 번호 선택시 
	$(".page-link").on("click", function(e){
		e.preventDefault();
		
		var num = $(this).attr("href");
		
		actionForm.find("input[name='pageNum']").val(num);
		actionForm.submit();
	});
	
	
	//n개씩 보기 선택 시
	$("#amount").on("change", function(e){
		var amount = $(this).val();
		actionForm.find("input[name='amount']").val(amount);
		actionForm.submit();
	});
	
	
	//라디오박스 선택 시
	$("input[name='sortType']").on("click", function(e){
		var sortType = $(this).val();
		sortForm.find("input[name='sortType']").val(sortType);
		sortForm.submit();
	});
	
	
	
	
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		var num = $(this).attr("href");
		var plan_No = "<input type='hidden' name='plan_No' value='"+num+"'>"
	
		actionForm.append(plan_No);
		actionForm.attr("action", "/planner/show");
		actionForm.submit();
	});
	
	
	var searchForm = $("#searchForm");
	
	$("#searchForm").find("input[type='submit']").on("click", function(e){
		e.preventDefault();
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	});
	
	$("#city_No").on("change", function(e){
		var city_No = $(this).val();
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='keyword']").val(city_No);
		searchForm.find("#type").val("C");
		searchForm.submit();
	});
});
