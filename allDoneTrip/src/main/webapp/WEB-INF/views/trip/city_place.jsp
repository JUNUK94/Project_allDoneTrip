<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>city_place</title>
	<style>
		.img {
			max-width: 100%;
			height: auto;
		}
		
		#myTab li a {
			color: black;
		}
	</style>
</head>

<body>
	<strong>명소</strong>

	<div class="container">

		<form id="pageMoveForm" action="" method="get">
			<input id="detail" type="hidden" name="Type" value="6">
		</form>

		<script>
			function showDetailInfo(cityNo, spotNo){
				location.href = "/trip/city/paris?Type="+ cityNo + "_"+ spotNo;
			}
		
		</script>

		<div class="tab-content" id="myTabContent" >
			
		<!-- 페이지3개씩 뿌림 -->
			<div class="d-flex flex-wrap justify-content-between tab-pane fade show active"  id="randmark" role="tabpanel" aria-labelledby="randmark-tab">
				<c:forEach  var="list" items="${list}" varStatus="status">	
					<c:if test="${!status.last}">
						<div id="spot_List${status.index}" class="d-flex flex-column" style="width:30%; margin-bottom: 20px;"
										 onclick ="showDetailInfo(${list.city_No},${list.spot_No})">
							<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
							<span>${list.spot_Name}</span>
						</div>
					</c:if>
					<c:if test="${status.last}">
						<c:if test="${(status.index % 3) == 0}">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;"  
								onclick ="showDetailInfo(${list.city_No},${list.spot_No})">
								<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
								<span>${list.spot_Name} ${status.end}</span>
							</div>
						</c:if>
					
						<c:if test="${(status.index % 3) == 1}">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;"
								onclick ="showDetailInfo(${list.city_No},${list.spot_No})">
								<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
								<span>${list.spot_Name} ${status.end}</span>
							</div>
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
							</div>
							</div>
						</c:if>
					
						<c:if test="${(status.index % 3) == 2}">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;"
								onclick ="showDetailInfo(${list.city_No},${list.spot_No})">
								<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail" >
								<span>${list.spot_Name} ${status.end}</span>
							</div>
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>

		</div>
	</div>


</body>
</html>