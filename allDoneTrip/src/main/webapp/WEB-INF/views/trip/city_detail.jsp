<%@page import="org.adt.domain.CityVO"%>
<%@page import="org.adt.domain.CityMappingData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/css/city.css" rel="stylesheet">
</head>
<body>
	<%
		int TY_CITY_NO = 0;
		int TY_SPOT_NO = 1;
		String Type = (String)request.getParameter("Type");
		System.out.println("Type : " + Type);
		String[] SplitType = Type.split("_");
		
		int city_no = Integer.parseInt(SplitType[TY_CITY_NO]);
		int spot_no = Integer.parseInt(SplitType[TY_SPOT_NO]);
		
		System.out.println("############################## start,,,, city_no : " + city_no + " spot_no : " + spot_no);
		CityMappingData mCityMappingData = CityMappingData.getInstance();
		CityVO mCityVO = mCityMappingData.getCityData(city_no,spot_no);
		
		System.out.println("############################## end,,,,");
		String src1 = "../../resources/images/"+ Type+ ".jpg";
		
	%>



	<strong>city_detail.jsp</strong>
	<br>

	<div class="container" role="main">
	<div class="roww">
		<div class="row">
			<div class="col-3">
				<%=mCityVO.spot_Name%>
			</div>
		</div>
		<!-- 사진이 들어감 -->
		<div class="row">
			<div class="col-12">
				<img alt="" src="<%=src1%>">
			</div>
		</div>
		<div class="row">
			<div class="col-6"><strong><%=mCityVO.t_Content %></strong></div>
			<div class="col-6"> 전화번호 : <%=mCityVO.t_tel %></div>
		</div>
		<div class="row">
			<div class="col-6"><%=mCityVO.address %></div>
			<div class="col-6"><%=mCityVO.t_Explan %></div>
		</div>
	</div>
</div>

	

</body>
</html>