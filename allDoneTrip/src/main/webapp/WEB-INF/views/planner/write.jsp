<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 작성</title>

<!--=====================================jquery=========================================-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
			integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
			crossorigin="anonymous"></script>
<!--====================================================================================-->
</head>
<body>

	<!-- 드래그&드롭 테스트 -->
	<h5>드래그&드롭 테스트</h5>

	<div>
		<ul>
		<li id="pensu" draggable="true">펭수</li>
		<li id="nice" draggable="true">니스</li>
		<li id="lyon" draggable="true">리옹</li>
		</ul>
	</div>

	<div class="1" draggable="true" style="width:300px; background-color: skyblue;">drop here</div>
	
	<br>
	<br>
	
	<!-- 계산기 -->
	<h5>계산기</h5>
	<div class="wrapper-calculator">
		<input type="text" name="inputNum" placeholder="0">
		<button class="calculator">=</button>
		<div>
			<div>
				<button class="plus"> + </button>
				<button class="minus"> - </button>
				<button class="multiple"> * </button>
				<button class="devide"> / </button>
			</div>
			<div>
				<button class="openBracket"> ( </button>
				<button class="closeBracket"> ) </button>
				<button class="back"> back </button>
			</div>
			<div>
				<button class="clear"> clear </button>
			</div>
			</div>
	</div>
	<br>
	<div>
		<input type="text" class="showProcess" placeholder="결과">
		<div class="showResult"></div>
	</div>
	
	<br>
	<br>
	
	<!-- 환율 계산기 -->
	<h5>환율계산기</h5>
	<div>
		<select class="exchange_Country" style="width:150px;">
			<option value="USD">미국</option>
			<option value="HKD">홍콩</option>
			<option value="EUR">유럽</option>
			<option value="JPY">일본</option>
			<option value="KRW">한국</option>
		</select>
		<br>
		<input name="InputMoney" type="text" style="width:150px; text-align:right;">
		<label class="currency1">달러</label>
	</div>
	<div style="width:150px; text-align:center;">=</div>
	<div>
	<select class="exchange_Result_Country" style="width:150px;">
		<option value="KRW">한국</option>
		<option value="USD">미국</option>
		<option value="HKD">홍콩</option>
		<option value="EUR">유럽</option>
		<option value="JPY">일본</option>
	</select>
	<br>
	<input name="ResultMoney" type="text" style="width:150px; text-align:right;">
	<label class="currency2">원</label>
	</div>
	
	<br>
	<br>
	


	
	
	
</body>
<!--====================================================================================-->	
 	<script src="${contextPath}/resources/js/drag&drop.js"></script>
	<script src="${contextPath}/resources/js/calculator.js"></script>
	<script src="${contextPath}/resources/js/exchange.js"></script>
	 
<!--====================================================================================-->	
</html>
