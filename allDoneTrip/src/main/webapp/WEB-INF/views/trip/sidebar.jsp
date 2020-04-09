<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이드바</title>
</head>
<body>

<img src="../../resources/images/slide2.png" height="100">
	여기는 파리!<br>

	<c:set var="pageNum" value="1" />
		<c:url value='/trip/city/paris' var="main" />
	<!--<c:url value='/info_main?pageNum=${pageNum}' var="info_home" />-->
	<a href="${main}">Home</a><br>
	
	
	<c:set var="pageNum" value="2" />
	<c:url value='/trip/city/paris?Type=2' var="info_normal" />
	<a href="${info_normal}">기본정보</a><br>
	
	<c:set var="pageNum" value="3" />
	<c:url value='/trip/city/paris?Type=3' var="city_map" />
	<a href="${city_map}">지도보기</a><br>
	
	<c:set var="pageNum" value="4" />
	<c:url value='/trip/city/paris?Type=4' var="city_place" />
	<a href="${city_place}">추천명소</a><br>
	
	<c:set var="pageNum" value="plan" />
	<c:url value='/trip/city/paris?Type=5' var="info_plan" />
	<a href="${info_plan}">추천플래너</a><br>
	
</body>
</html>