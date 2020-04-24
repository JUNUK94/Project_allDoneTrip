<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/css/city.css" rel="stylesheet">
	<script type="text/javascript"
		src="https://ko.exchange-rates.org/GetCustomContent.aspx?sid=CC000MGL3&amp;type=CurrencyConverter&amp;stk=-09RGYGO24J"
		charset="utf-8">
	</script>
</head>
<body>


	<noscript>
		<iframe ID="frmExchRatesCC000MGL3"
			style="margin: 0px; border: none; padding: 0px;" frameborder="0"
			width="641" height="61"
			src="https://ko.exchange-rates.org/GetCustomContent.aspx?sid=CC000MGL3&amp;type=CurrencyConverter&amp;submit=submit&amp;stk=051T3L724K"></iframe>
	</noscript>

	<div class="container">
		<div class="row text-center">
			<div class="col-sm">
				<div class="country">국가:PARIS</div>
				<div class = "time">날짜:</div>
				<div class="cicon">아이콘:</div>
			</div>
			<div class="col-sm">
				<div class="ctemp">현재온도:</div>
				<div class="clowtemp">최저온도:</div>
				<div class="chightemp">최고온도:</div>
			</div>
			<div class="col-sm">
				<div class="exchange">1EUR:</div>
			</div>
		</div>

		<br><br><br>여기에 환율계산기<br><br><br><br><br>
		<strong>인기여행지</strong>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">명소</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">맛집</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">쇼핑</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1_1';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1_1.jpg"
										style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">에펠탑</div>
									<p class="cardtext">명실상부 파리의 아이콘</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1_21';">
								<div class="inner">
									<img class="card-img-top"
										src="../../resources/images/paris_2.jpg"
										style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">루브르박물관</div>
									<p class="cardtext">전 세계 3대 박물관</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1_6';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1_6.jpg"
										style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">개선문</div>
									<p class="cardtext">나폴레옹의 승리 상징</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">

				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1F1';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1F1.jpg"
										alt="Card image cap" style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">레옹 드 브뤼셀</div>
									<p class="cardtext">벨기에 홍합 요리 전문</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1F3';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1F3.jpg"
										alt="Card image cap" style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">라스 뒤 팔라펠</div>
									<p class="cardtext">유대인 스타일의 샌드위치</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1F5';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1F5.jpg"
										alt="Card image cap" style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">오 프티 페흐 아 슈발</div>
									>
									<p class="cardtext">송아지 스테이크를 저렴하게</p>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1E1';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1E1.jpg"
										alt="Card image cap" style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">디즈니 스토어</div>
									<p class="cardtext">파리 디즈니랜드의 감동을 다시 한번</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1E4';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1E4.jpg"
										alt="Card image cap" style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">샤넬 깜봉(본점)</div>
									<p class="cardtext">샤넬 본점</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card" onclick="location.href='paris?Type=1E6';">
								<div class="inner">
									<img class="card-img-top" src="../../resources/images/1E6.jpg"
										alt="Card image cap" style="width: 320px; height: 220px;">
								</div>
								<div class="card-body text-left">
									<div class="cardtitle">갤러리 약국</div>
									<p class="cardtext">저렴한 약국 화장품</p>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- /////////////////////////////////////////////////////////////////////////////////// -->
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#tema" role="tab" aria-controls="tema"
					aria-selected="true">테마</a></li>

				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#choiplan" role="tab"
					aria-controls="choiplan" aria-selected="false">추천플래너</a></li>
			</ul>


			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="tema" role="tabpanel"
					aria-labelledby="tema-tab">
					테마들어감
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-4">
								<div class="card" onclick="location.href='paris?Type=1E1';">
									<div class="inner">
										<img class="card-img-top"
											src="../../resources/img/planner/pengsu.jpg"
											alt="Card image cap" style="width: 320px; height: 220px;">
									</div>
									<div class="card-body text-left">
										<div class="cardtitle">테마1</div>
										<p class="cardtext">123</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card" onclick="location.href='paris?Type=1E4';">
									<div class="inner">
										<img class="card-img-top"
											src="../../resources/img/planner/pengsu.jpg"
											alt="Card image cap" style="width: 320px; height: 220px;">
									</div>
									<div class="card-body text-left">
										<div class="cardtitle">테마2</div>
										<p class="cardtext">123</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card" onclick="location.href='paris?Type=1E6';">
									<div class="inner">
										<img class="card-img-top"
											src="../../resources/img/planner/pengsu.jpg"
											alt="Card image cap" style="width: 320px; height: 220px;">
									</div>
									<div class="card-body text-left">
										<div class="cardtitle">테마3</div>
										<p class="cardtext">123</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="choiplan" role="tabpanel"
					aria-labelledby="choiplan-tab">
					플래너가 들어갈예정

					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-4">
								<div class="card" onclick="location.href='paris?Type=1E1';">
									<div class="inner">
										<img class="card-img-top"
											src="../../resources/img/planner/pengsu.jpg"
											alt="Card image cap" style="width: 320px; height: 220px;">
									</div>
									<div class="card-body text-left">
										<div class="cardtitle">테마1</div>
										<p class="cardtext">123</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card" onclick="location.href='paris?Type=1E4';">
									<div class="inner">
										<img class="card-img-top"
											src="../../resources/img/planner/pengsu.jpg"
											alt="Card image cap" style="width: 320px; height: 220px;">
									</div>
									<div class="card-body text-left">
										<div class="cardtitle">테마2</div>
										<p class="cardtext">123</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="card" onclick="location.href='paris?Type=1E6';">
									<div class="inner">
										<img class="card-img-top"
											src="../../resources/img/planner/pengsu.jpg"
											alt="Card image cap" style="width: 320px; height: 220px;">
									</div>
									<div class="card-body text-left">
										<div class="cardtitle">테마3</div>
										<p class="cardtext">123</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div>
	<a href="https://ko.exchange-rates.org/" rel="nofollow">ko.exchange-rates.org</a>
	</div>

	<script src="${contextPath}/resources/js/city/cityexchange.js"></script>
</body>
</html>