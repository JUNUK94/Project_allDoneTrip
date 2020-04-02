<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>플래너 조회</title>

<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
			integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
			crossorigin="anonymous"></script>

<!--===================================bootstrap========================================-->

	<link rel="stylesheet" 
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
		crossorigin="anonymous">
		
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
		crossorigin="anonymous"></script>

<!--====================================================================================-->
</head>
<body>
	<br>
	<br>
	<div class="containor">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h3>모두의 플래너</h3>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<br>
	<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>추천수</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${content}" var="pvo">
							<tr>
								<td>${pvo.plan_No}</td>
								<td>${pvo.plan_Like}</td>
								<td>${pvo.p_Title}</td>
								<td>${pvo.nick_Name}</td>
								<td>${pvo.click_Num}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2 bg-light"></div>
			<div class="col-md-2 bg-light">
				<img src="/resources/img/sample_main.JPG" width="160px">
			</div>
			<div class="col-md-2 bg-light">
				<c:forEach items="${content}" var="pvo">
					<br><br><br>
					${pvo.p_Title}
					<hr>
					${pvo.city_Name}
					<br>${pvo.trip_Period}
					<br><button>pdf로 저장</button>
				</c:forEach>
			</div>
			<div class="col-md-2 bg-light">
				<img src="/resources/img/scrap.JPG" width="30px">
				<img src="/resources/img/share.JPG" width="30px">
				<br><br><br><br><br>
				<img src="/resources/img/Like.png" width="80px">
				</div>
			<div class="col-md-2"></div>			
		</div>
	
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="height:40px; border-bottom: 1px solid gray; border-top: 1px solid gray">
				댓글
			</div>
			<div class="col-md-2"></div>
		</div>
		
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-1">
			<img src="/resources/img/Non_User_Photo.JPG">
			</div>
			<div class="col-md-6">
				<textarea class="col-md-12 bg-light" style="height:100px;" placeholder="댓글을 입력해주세요"></textarea>
			</div>	
			<div class="col-md-1" >	
				<button class="col-md-12 bg-light" style="height:100px;">등록</button>
			</div>
			<div class="col-md-2"></div>
		</div>
		
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-1">
				<img src="/resources/img/Non_User_Photo.JPG">
			</div>
			<div class="col-md-6">
				<div>작성자  + 댓글 등록일시</div>
				<div>댓글 내용</div>
			</div>
			<div class="col-md-1">	
				<a href="#">삭제</a> | <a href="#">신고</a> | <a href="#">댓글</a>
			</div>
			
			<div class="col-md-2"></div>
		</div>

</body>
</html>