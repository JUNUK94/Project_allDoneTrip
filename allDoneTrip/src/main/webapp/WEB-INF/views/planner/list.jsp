<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>플래너 리스트</title>

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
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>모두의 플래너</h3>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<br>
	
	<div class="row center-block bg-light" style="height: 50px">
		<div class="col-md-2"></div>
		<div class="col-md-1">
			<input type="radio" name="sortType" value="regdate">등록일순
		</div>
		<div class="col-md-1">
			<input type="radio" name="sortType" value="plan_Like">추천순
		</div>
		<div class="col-md-1">
			<input type="radio" name="sortType" value="click_Num">조회순
		</div>
		<div class="col-md-1">
			<select name="city_no">
				<option value="">도시 선택</option>
				<option value="1">파리</option>
				<option value="2">바르셀로나</option>
				<option value="3">베니스</option>
			</select>
		</div> 
		<div class="col-md-3">
			<form id="searchForm" action="/planner/list" method='get'>
				<select id='type'>
					<option value="p_Title">제목</option>
					<option value="nick_Name">작성자</option>
				</select>
				
				<input type="text" name="search_city">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="submit" value="검색">
			</form>
		</div> 
		<div class="col-md-1">	
			<select id="amount">
				<option value="">보기 수량</option>
				<option value="10">10개씩 보기</option>
				<option value="20">20개씩 보기</option>
				<option value="30">30개씩 보기</option>
				<option value="40">40개씩 보기</option>
				<option value="50">50개씩 보기</option>
			</select>
		</div> 
		<div class="col-md-2"></div>
	</div>
	
	<br>
	<br>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>추천</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>다운로드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="pvo">
						<tr>
							<td>${pvo.plan_No}</td>
							<td>${pvo.plan_Like}</td>
							<td>
								<a class="move" href="${pvo.plan_No}">${pvo.p_Title}</a>
								${pvo.city_Name}
							</td>
							<td>${pvo.nick_Name}</td>
							<td>${pvo.click_Num}</td>
							<td><button>다운로드</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>


	<div class="row">
		<div class="col-md-10">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.startPage - 1}">previous</a>
					</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage + 1}">next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	

	<form id="actionForm" action="/planner/list" method="get">
		<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value = "${pageMaker.cri.amount}">
	</form>
	
	<form id="sortForm" action="/planner/sort" method="get">
		<input type="hidden" name="sortType" value = "">
		<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value = "${pageMaker.cri.amount}">
	</form>
<!--====================================================================================-->

	<script src="${contextPath}/resources/js/plannerList.js"></script>

<!--====================================================================================-->

</body>
</html>