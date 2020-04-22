<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이드바</title>
<style type="text/css">
.bar {
	width: 100%;
	padding: 20px 24%;
	font-size: 18px;
}
</style>
</head>
<body>

<!--
	<div class = "row">
	<img src="../../resources/images/slide2.png">
	</div>-->
	<!--<c:url value='/info_main?pageNum=${pageNum}' var="info_home" />-->
	<div class = "bar">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<a href="#" class="pageMenu">Home</a>&nbsp; 
			<a href="#" class="pageMenu">기본정보</a>&nbsp; 
			<a href="#" class="pageMenu">지도보기</a>&nbsp;
			<a href="#" class="pageMenu">명소</a>&nbsp; 
			<a href="#" class="pageMenu">맛집</a>&nbsp; 
			<a href="#" class="pageMenu">테마</a>&nbsp;
			<a href="#" class="pageMenu">쇼핑</a>&nbsp; 
			<a href="#" class="pageMenu">추천플래너</a>
			<div class="col-sm-1"></div>
		</div>
	</div>
</div>


	<form id="pageMoveForm" action="" method="get">
			<input type="hidden" name="Type" value="">
		</form>


		<script>
		$(document).ready(function(){
			
			var pageMoveForm = $("#pageMoveForm");
			
			$("a.pageMenu").on("click", function(e){
				
				e.preventDefault();
				
				var pageMenu = $(this).html();
				
				switch(pageMenu){
					case "Home" :
						$("input[name='Type']").val('1');
						break;
					case "기본정보" :
						$("input[name='Type']").val('2');
						break;
					case "지도보기" :
						//$("input[name='Type']").val('3');
						var win = window.open("./write", "_blank", "toolbar=yes,scrollbars=yes,resizable=no,top=500,left=500,width=800,height=800")
						break;
					case "명소" :
						$("input[name='Type']").val('4');
						break;
					case "맛집" :
						$("input[name='Type']").val('5');
						break;
					case "테마" :
						$("input[name='Type']").val('6');
						break;
					case "쇼핑" :
						$("input[name='Type']").val('7');
						break;
					case "추천플래너" :
						$("input[name='Type']").val('8');
						break;
				}
						
				pageMoveForm.attr("action","/trip/city/paris");
				pageMoveForm.submit();
				
			});
			
		});
	</script>
</body>
</html>