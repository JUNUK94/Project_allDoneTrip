<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 작성</title>

<!--=====================================jquery=========================================-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<!--====================================CKeditor========================================-->
<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>
<!--====================================================================================-->
</head>
<body>



	<div class="container">
		<!-- 드래그&드롭 테스트 -->
		<h5>드래그&드롭 테스트</h5>

		<div>
			<ul>
				<li id="pensu" draggable="true">펭수</li>
				<li id="nice" draggable="true">니스</li>
				<li id="lyon" draggable="true">리옹</li>
			</ul>
		</div>

		<div class="1" draggable="true"
			style="width: 300px; background-color: skyblue;">drop here</div>

		<br> <br>

		<!-- 계산기 -->
		<h5>계산기</h5>
		<div class="wrapper-calculator">
			<input type="text" name="inputNum" placeholder="0">
			<button class="calculator">=</button>
			<div>
				<div>
					<button class="plus">+</button>
					<button class="minus">-</button>
					<button class="multiple">*</button>
					<button class="devide">/</button>
				</div>
				<div>
					<button class="openBracket">(</button>
					<button class="closeBracket">)</button>
					<button class="back">back</button>
				</div>
				<div>
					<button class="clear">clear</button>
				</div>
			</div>
		</div>
		<br>
		<div>
			<input type="text" class="showProcess" placeholder="결과">
			<div class="showResult"></div>
		</div>

		<br> <br>

		<!-- 환율 계산기 -->
		<h5>환율계산기</h5>
		<div>
			<select class="exchange_Country" style="width: 150px;">
				<option value="USD">미국</option>
				<option value="HKD">홍콩</option>
				<option value="EUR">유럽</option>
				<option value="JPY">일본</option>
				<option value="KRW">한국</option>
			</select> <br> <input name="InputMoney" type="text"
				style="width: 150px; text-align: right;"> <label
				class="currency1">달러</label>
		</div>
		<div style="width: 150px; text-align: center;">=</div>
		<div>
			<select class="exchange_Result_Country" style="width: 150px;">
				<option value="KRW">한국</option>
				<option value="USD">미국</option>
				<option value="HKD">홍콩</option>
				<option value="EUR">유럽</option>
				<option value="JPY">일본</option>
			</select> <br> <input name="ResultMoney" type="text"
				style="width: 150px; text-align: right;"> <label
				class="currency2">원</label>
		</div>

		<br> <br>


		<!-- 에디터 시작 -->
		<div class="container">
			<div class="content" style="width: 70%">

				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect03">
								<option selected>분류</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div>
				</div>

				<hr>

				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content"></textarea>
							<script type="text/javascript">
                  CKEDITOR.replace('p_content'
                                                  , {height: 500                                                  
                                                  });
                  </script>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">GitHub</span>
						</div>
						<input type="text" class="form-control">
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
						</div>
						<div class="custom-file">
							&nbsp;<input type="file" class="form-control-file"
								id="exampleFormControlFile1">
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<button type="submit" class="btn btn-outline-secondary"
						style="width: 20%; font-weight: bold">등 록</button>
				</div>
			</div>
		</div>
	</div>
</body>
<!--====================================================================================-->
<script src="${contextPath}/resources/js/planner/drag&drop.js"></script>
<script src="${contextPath}/resources/js/planner/calculator.js"></script>
<script src="${contextPath}/resources/js/planner/exchange.js"></script>

<!--====================================================================================-->
</html>
