<%@page import="org.adt.domain.CityVO"%>
<%@page import="org.adt.controller.CityMappingData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑상세페이지</title>
</head>
<body>
	<%
		int TY_CITY_NO = 0;
		int TY_SHOP_NO = 1;
		String Type = (String)request.getParameter("Type");
		System.out.println("Type : " + Type);
		String[] SplitType = Type.split("E");
		
		int city_no = Integer.parseInt(SplitType[TY_CITY_NO]);
		int shop_no = Integer.parseInt(SplitType[TY_SHOP_NO]);
		
		//System.out.println("############################## start,,,, city_no : " + city_no + " shop_no : " + shop_no);
		CityMappingData mCityMappingData = CityMappingData.getInstance();
		CityVO mCityVO = mCityMappingData.getShopData(city_no, shop_no);
		
		System.out.println("##### shop end,,,,##### ");
		String src1 = "../../resources/images/"+ Type+ ".jpg";
	%>	

	

	<strong>city_detailShop.jsp</strong>
	<br>

	<div class="container" role="main">
	<div class="roww">
		<div class="row">
			<div class="col-3">
				<%=mCityVO.shop_Name%>
			</div>
		</div>
		<!-- 사진이 들어감 -->
		<div class="row">
			<div class="col-12">
				<img alt="" src="<%=src1%>">
			</div>
		</div>
		<div class="row">
			<div class="col-6"><%=mCityVO.s_Content%></div>
		</div>
		<div class="row">
			<div class="col-6"><%=mCityVO.s_address %></div>
			<div class="col-6"><%=mCityVO.shop_Summary %></div>
		</div>
	</div>
</div>
	

</body>
</html>