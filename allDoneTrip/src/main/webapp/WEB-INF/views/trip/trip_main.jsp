<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
a {
    color: black;
    text-decoration: none;
    background-color: transparent;
}
</style>
<style type="text/css">

	div.cheese {
	text-align: center;

	}
	div.sidebar{
	border: 1px solid gray;
	text-align: center;
	}
	div.main{
	border: 1px solid gray;
	text-align: center;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파리_도시정보</title>
</head>
<body>
	<div class='row'>
		<div class='col-md-1'></div>
		<div class='col-md-11 bg-primary'>
			trip_main.jsp (header추가예정)
		</div>
	</div>
	<div class='row' >
		<div class='col-md-2 sidebar'>
			<!-- 사이드바출력 -->
			<jsp:include page="sidebar.jsp" flush="false" />
		</div>

		<div class='col-md-10 main' >
			<!-- info_main. 바뀌는 페이지 -->

			<!-- %@include file="../include/" + {$aaa} + ".jsp" % -->

			<c:set var="pageNum_Home" value="${pageNum_Home}" />
			<c:choose>
				<c:when test="${pageNum_Home eq null}">
					<jsp:include page="city.jsp" flush="false" /><!--info_main-->	
				</c:when>
				<c:when test="${pageNum_Home eq '1'}">
					<jsp:include page="city.jsp" flush="false" /><!--info_main-->
				</c:when>
				<c:when test="${pageNum_Home eq '2'}">
					<jsp:include page="city_list.jsp" flush="false" />	<!-- 기본정보 -->	
				</c:when>
				<c:when test="${pageNum_Home eq '3'}">	
					<jsp:include page="write.jsp" flush="false" /><!-- 지도보기 -->
				</c:when>
				<c:when test="${pageNum_Home eq '4'}">
					<jsp:include page="city_place.jsp" flush="false" /><!-- 명소 -->
				</c:when>
				<c:when test="${pageNum_Home eq '5'}">
					<jsp:include page="city_food.jsp" flush="false" /><!-- 맛집 -->
				</c:when>
				<c:when test="${pageNum_Home eq '6'}">
					<jsp:include page="city_theme.jsp" flush="false" /><!-- 테마 -->
				</c:when>
				<c:when test="${pageNum_Home eq '7'}">
					<jsp:include page="city_shop.jsp" flush="false" /><!-- 쇼핑 -->
				</c:when>
				<c:when test="${pageNum_Home eq '8'}">
					<jsp:include page="city_plan.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				<c:when test="${pageNum_Home eq '10'}">
					<jsp:include page="city_detail.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				<c:when test="${pageNum_Home eq '11'}">
					<jsp:include page="city_detailfood.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				<c:when test="${pageNum_Home eq '22'}">
					<jsp:include page="city_list_p1.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				<c:when test="${pageNum_Home eq '23'}">
					<jsp:include page="city_list_p2.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				<c:when test="${pageNum_Home eq '24'}">
					<jsp:include page="city_list_p3.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				<c:when test="${pageNum_Home eq '25'}">
					<jsp:include page="city_list_p4.jsp" flush="false" /><!-- 추천플래너 -->
				</c:when>
				
			</c:choose>
		</div>
	</div>

</body>
</html>