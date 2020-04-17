<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ page session="false" %>
<%@page import="java.util.ArrayList"%>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}" />   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.container {
	float : left;
}

.inner {
	overflow: hidden;
}

.inner img {
	transition: all 1.5s ease;
}

.inner:hover img {
	transform: scale(1.5);
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<body>

<strong>Weather & Exchange Rate</strong>

<div class = "country"> 국가:PARIS </div>
<div class = "exchange">1EUR: </div>
<div class = "ctemp">현재온도:</div>
<div class = "clowtemp">최저온도:</div>
<div class = "chightemp">최고온도:</div>
<div class = "cicon">아이콘:</div>
<div class = "time">날짜:</div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/exchange.js"></script>    
    <script>
      $(document).ready(function(){
       
         $.ajax({
            url:'https://earthquake.kr:23490/query/EURKRW,USDKRW',
            dataType:'JSON',
            type:'GET',
            
            success:function(data){
               console.log(data.update);
               
               
               var $arr1 = data.EURKRW[0];
               var DATE = data.update;
                 var arr2 = data.USDKRW;
                
               $('.exchange').append($arr1);
               
                 
                 for(var i in arr1){
                     console.log('EURKRW:'+arr1[i]);
                     console.log('DATE:' + displayTime(DATE));
                    }

                    for(var i in arr2){
                     console.log('USDKRW:'+arr2[i]);
                    }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
    
         });
    

    
         
        $.getJSON('http://api.openweathermap.org/data/2.5/weather?id=2988507&appid=5c818fece92856e67c360f488be116cc&units=metric', 
              function(data){
          //data로 할일..
           //alert(data.list[0].main.temp);
          var $minTemp = data.main.temp_min;
          var $maxTemp = data.main.temp_max;
          var $cTemp =data.main.temp;
          var $now = new Date($.now());
          var $cDate = $now.getFullYear() + '/' + $now.getMonth() +1 + '/' + $now.getDate() + '/' +
                       $now.getHours() + ':' + $now.getMinutes();
          var $wIcon = data.weather[0].icon;
          
          
          $('.ctemp').append($cTemp);
          $('.clowtemp').append($minTemp);
          $('.chightemp').append($maxTemp);
          $('.cicon').append('<img src="http://openweathermap.org/img/wn/'+$wIcon+'.png"/>');
          $('.time').append($cDate);
       }); 
       
         
      });

    </script>
ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ<br>

<br><strong >인기여행지</strong>
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
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/paris_1.jpg"
									alt="Card image cap">
							</div>
							<div class="card-body text-center">
								<h5 class="card-title">에펠탑</h5>
								<p class="card-text">명실상부 파리의 아이콘</p>
								<a href="paris?Type=6" class="btn btn-success">ㄱㄱㄱㄱ</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/paris_2.jpg"
									alt="Card image cap">
							</div>

							<div class="card-body text-center">
								<h5 class="card-title">루브르 박물관</h5>
								<p class="card-text">전 세계 3대 박물관</p>
								<a href="#" class="btn btn-success">ㄱㄱㄱㄱ.</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/paris_3.jpg"
									alt="Card image cap">
							</div>

							<div class="card-body text-center">
								<h5 class="card-title">개선문</h5>
								<p class="card-text">나폴레옹의 승리 상징</p>
								<a href="#" class="btn btn-success">ㄱㄱㄱ?</a>
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
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/a1.png"
									alt="Card image cap">
							</div>
							<div class="card-body text-center">
								<h5 class="card-title">레옹 드 브뤼셀</h5>
								<p class="card-text">벨기에 홍합 요리 전문</p>
								<a href="#" class="btn btn-success">ㄱㄱ</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/a2.jpg"
									alt="Card image cap">
							</div>

							<div class="card-body text-center">
								<h5 class="card-title">라스 뒤 팔라펠</h5>
								<p class="card-text">유대인 스타일의 샌드위치</p>
								<a href="#" class="btn btn-success">ㄱㄱ</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/a3.png"
									alt="Card image cap">
							</div>

							<div class="card-body text-center">
								<h5 class="card-title">오 프티 페흐 아 슈발</h5>
								<p class="card-text">송아지 스테이크를 저렴하게</p>
								<a href="#" class="btn btn-success">ㄱㄱㄱ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			..
		</div>
		<div class="tab-pane fade" id="contact" role="tabpanel"
			aria-labelledby="contact-tab">
					<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/a4.jpg"
									alt="Card image cap">
							</div>
							<div class="card-body text-center">
								<h5 class="card-title">디즈니 스토어</h5>
								<p class="card-text">파리 디즈니랜드의 감동을 다시 한번 </p>
								<a href="#" class="btn btn-success">ㄱㄱ</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/a5.png"
									alt="Card image cap">
							</div>

							<div class="card-body text-center">
								<h5 class="card-title">샤넬 깜봉(본점)</h5>
								<p class="card-text">샤넬 본점</p>
								<a href="#" class="btn btn-success">ㄱㄱ</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow" style="width: 20rem;">
							<div class="inner">
								<img class="card-img-top" src="../../resources/images/a6.jpg"
									alt="Card image cap">
							</div>

							<div class="card-body text-center">
								<h5 class="card-title">갤러리 약국</h5>
								<p class="card-text">저렴한 약국 화장품</p>
								<a href="#" class="btn btn-success">ㄱㄱㄱ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			</div>
	</div>
	
	<div class="container">

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
			<a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#randmark" role="tab" aria-controls="randmark" aria-selected="true">랜드마크</a></li>
					
			<li class="nav-item">
				<a class="nav-link" id="profile-tab" 
					data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">역사 유적지</a></li>
					
			<li class="nav-item">
				<a class="nav-link" id="charch-tab" 
					data-toggle="tab" href="#charch" role="tab" aria-controls="charch" aria-selected="false">성당/교회</a></li>
					
			<li class="nav-item">
				<a class="nav-link" id="concert-tab" 
					data-toggle="tab" href="#concert" role="tab" aria-controls="concert" aria-selected="false">공연장</a></li>
		</ul>
		
		
		
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="randmark" role="tabpanel" aria-labelledby="randmark-tab">랜드마큭ㄱㄱ</div>
				
			<div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">유적ㅈ긱ㄱㄱ</div>
			
			<div class="tab-pane fade" id="charch" role="charch" aria-labelledby="charch-tab">아멘...</div>
			
			<div class="tab-pane fade" id="concert" role="tabpanel" aria-labelledby="concert-tab">대대댄싱뮤직</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



</body>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/exchange.js"></script>
</html>