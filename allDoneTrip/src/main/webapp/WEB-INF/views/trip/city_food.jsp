<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
			function showDetailInfo(cityNo, resNO){
				location.href = "/trip/city/paris?Type="+ cityNo + "F"+ resNO;
			}
		
	</script>
</head>
<body>
<strong>city_food</strong>


	<div class="container">

		<div class="tab-content" id="myTabContent" >
			
		<!-- 페이지3개씩 뿌림 -->
			<div class="d-flex flex-wrap justify-content-between tab-pane fade show active" >
				<c:forEach  var="res" items="${res}" varStatus="status">	
					<c:if test="${!status.last}">
						<div id="spot_List${status.index}" class="d-flex flex-column" style="width:30%; margin-bottom: 20px;"
										 onclick ="showDetailInfo(${res.city_No},${res.res_No})">
							<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
							<span>${res.res_Name}</span>
						</div>
					</c:if>
					<c:if test="${status.last}">
						<c:if test="${(status.index % 3) == 0}">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
								<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
								<span>${res.res_Name} ${status.end}</span>
							</div>
						</c:if>
					
						<c:if test="${(status.index % 3) == 1}">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
								<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
								<span>${res.res_Name} ${status.end}</span>
							</div>
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
							</div>
							</div>
						</c:if>
					
						<c:if test="${(status.index % 3) == 2}">
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
								<img src="../../resources/images/a1.png" alt="" class="img-responsive img-thumbnail">
								<span>${res.res_Name} ${status.end}</span>
							</div>
							<div class="d-flex flex-column" style="width:30%; margin-bottom: 20px;">
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>

		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>