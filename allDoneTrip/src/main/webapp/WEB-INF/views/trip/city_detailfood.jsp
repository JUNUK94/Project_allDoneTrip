<%@page import="org.adt.domain.CityVO"%>
<%@page import="org.adt.controller.CityMappingData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int TY_CITY_NO = 0;
		int TY_RES_NO = 1;
		String Type = (String)request.getParameter("Type");
		System.out.println("Type : " + Type);
		String[] SplitType = Type.split("F");
		
		int city_no = Integer.parseInt(SplitType[TY_CITY_NO]);
		int res_no = Integer.parseInt(SplitType[TY_RES_NO]);
		

		CityMappingData mCityMappingData = CityMappingData.getInstance();
		CityVO mCityVO = mCityMappingData.getFOODData(city_no, res_no);
		
		System.out.println("############################## end,,,,");
		String src1 = "../../resources/images/"+ Type+ ".jpg";
	%>

	<strong>city_detailfood.jsp</strong>
	<br>

	<div class="container" role="main">
	<div class="roww">
		<div class="row">
			<div class="col-3">
				<%=mCityVO.res_Name%>
			</div>
		</div>
		<!-- 사진이 들어감 -->
		<div class="row">
			<div class="col-12">
				<img alt="" src="<%=src1%>">
			</div>
		</div>
		<div class="row">
			<div class="col-6"><%=mCityVO.res_Content%></div>
			<div class="col-6"> 전화번호 : <%=mCityVO.res_Tel%></div>
		</div>
		<div class="row">
			<div class="col-6"><%=mCityVO.res_address %></div>
			<div class="col-6"><%=mCityVO.res_summary %></div>
		</div>
	</div>
</div>
	
	
</body>
</html>