<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이드바</title>

<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
			integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
			crossorigin="anonymous"></script>

<!--====================================================================================-->

</head>
<body>

<img src="../../resources/images/slide2.png" style='max-width:100%; max-height:auto'>
	

	

	<!--<c:url value='/info_main?pageNum=${pageNum}' var="info_home" />-->
	<a href="#" class="pageMenu">Home</a><br>
	<a href="#" class="pageMenu">기본정보</a><br>
	<a href="#" class="pageMenu">지도보기</a><br>	
	<a href="#" class="pageMenu">명소</a><br>
	<a href="#" class="pageMenu">맛집</a><br>	
	<a href="#" class="pageMenu">테마</a><br>
	<a href="#" class="pageMenu">쇼핑</a><br>
	<a href="#" class="pageMenu">추천플래너</a><br>	

	
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