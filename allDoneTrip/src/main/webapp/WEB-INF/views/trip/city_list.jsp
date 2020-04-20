<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

.text-overlay{
	position: absolute;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
}

</style>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

<strong> city_list.jsp</strong><br>



	<div class="container">

	
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
								aria-selected="true" >여행지 정보</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">날씨</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">환전</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#bus" role="tab" aria-controls="bus"
				aria-selected="false">공항 및 교통</a></li>
		</ul>
		
<!-- ----------------------------------------------------------------------------------------------------------구분선 -->					
		
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<div class="container">
				      <div class="row"> 
				        <div class="col-3"> 
				          	  <div class="card" onClick="location.href='city_list_p1'"> 
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				             		국가정보
				            </div>
				          </div>
				        </div>
				        
				        <div class="col-3">
				          <div class="card" onClick="location.href='city_list_p2'">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				  			            근교여행
				            </div>
				          </div>
				        </div>
				        
				        <div class="col-3">
				          <div class="card" onClick="location.href='city_list_p3'">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				         		     여행최적기 
				            </div>
				          </div>
				        </div>
				         <div class="col-3"> 
				          <div class="card" onClick="location.href='city_list_p4'">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				        		     현지어한마디
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
				</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">배고파
					
					</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">집갈랭</div>
			<div class="tab-pane fade" id="bus" role="tabpanel"
				aria-labelledby="bus">
				<div class="container">
				      <div class="row">
				        <div class="col-3"> 
				          <div class="card">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				             		공항정보
				            </div>
				          </div>
				        </div>
				        
				        <div class="col-3">
				          <div class="card">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				  			            공항 / 시내
				            </div>
				          </div>
				        </div>
				        
				        <div class="col-3">
				          <div class="card">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				         		     시내교통
				            </div>
				          </div>
				        </div>
				         <div class="col-3"> 
				          <div class="card">
				            <img src="../../resources/images/a1.png" alt="" class="card-img" />
				            <div class="text-overlay">
				        		   교통패스
				            </div>
				          </div>
				        </div>
				      </div>
				    </div></div>
		</div>
	</div>
	
	
	
</body>
</html>