<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>플래너 리스트</title>
	<style>
		table > thead{
			text-align: center;
			color: #0C3272;
		}
	
		table .planList_td{
			display: table-cell;
			vertical-align: inherit;
			text-align: center;
		}
	</style>
</head>

<body>
	<!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>모두의 플래너</h2>
                            <p>Share every plan in the World</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

	<div class="containor-fluid">
		<div 	class="d-flex flex-row align-items-center justify-content-center" 
				style="height: 80px; background-color: #EAEFFF;">
				<div class="p-3">
					<input type="radio" id="sortType" name="sortType" value="regdate">등록일순
					&nbsp;
					<input type="radio" id="sortType" name="sortType" value="plan_Like">추천순
					&nbsp;
					<input type="radio" id="sortType" name="sortType" value="click_Num">조회순
				</div>
				<div class="p-3">
					<select id="city_No" name="city_No" class="form-control">
						<option value="">도시 선택</option>
						<option value="1">파리</option>
						<option value="2">니스</option>
						<option value="3">리옹</option>
						<option value="4">상해</option>
						<option value="5">홍콩</option>
						<option value="6">방콕</option>
						<option value="7">다낭</option>
						<option value="8">하노이</option>
						<option value="9">치앙마이</option>
						<option value="10">베이징</option>
					</select>
				</div>
				<form id="searchForm" action="/planner/list" method='get'>
					<div class="input-group p-3">
						<div class="input-group-prepend">
							<select id="type" name ="type" class="form-control">
								<option value="T">제목</option>
								<option value="W">작성자</option>
								<option value="C" hidden="">도시</option>
							</select>
						</div>
						<input type="text" id="keyword" name="keyword" class="form-control" placeholder='Search Keyword' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
						<div class="input-group-append">
							<label class="input-group-text" style="background-color: white">
								<i class="ti-search"></i>
							</label>
 						</div>
					</div>
					<input type="hidden" name="sortType" value = "${pageMaker.cri.sortType}">
					<input type="hidden" name="pageNum" value= "${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value= "${pageMaker.cri.amount}">
				</form>
				<div class="p-3">
					<select id="amount" class="form-control">
						<option value="10">10개씩 보기</option>
						<option value="20">20개씩 보기</option>
						<option value="30">30개씩 보기</option>
						<option value="40">40개씩 보기</option>
						<option value="50">50개씩 보기</option>
					</select>
				</div>
				<div class="p-3">
					<a href="/planner/write">
						<i class='far fa-edit' style='font-size:20px; margin-left: 30px'></i>
					</a>
				</div>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10 table-responsive-lg">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천</th>
							<th>다운로드</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="pvo">
							<tr>
								<td class="planList_td">${pvo.plan_No}</td>
								<td class="d-flex flex-row align-items-center">
									<div style="width:30%">
										<img src='${pvo.p_Thumbnail}' width='100px' height='150px'>
									</div>
									<div class="small p-2" style="width:70%">
										<h5><a class="show" href="${pvo.plan_No}">${pvo.p_Title}</a></h5>
										<div>
											<hr>
											${pvo.city_Name}<br>
											${pvo.trip_Period}
										</div>
									</div>
								</td>
								<td class="planList_td">${pvo.nick_Name}</td>
								<td class="planList_td">${pvo.click_Num}</td>
								<td class="planList_td">
									<i class='far fa-thumbs-up' style='font-size:20px; color: #0C3272;'></i>
									&nbsp;
									${pvo.plan_Like}
								</td>
								<td class="planList_td">
									<button class="btn btn-outline-primary btn-sm">
										pdf 다운로드
										&nbsp;
										<i class='fas fa-download' style='font-size:20px'></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	
		<br>
		<br>
		
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="pagination justify-content-center">
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
			<div class="col-md-2"></div>
		</div>
	</div>

	<br><br><br><br>
		

	<form id="actionForm" action="/planner/list" method="get">
		<input type="hidden" name="type" value = "${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value = "${pageMaker.cri.keyword}">
		<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value = "${pageMaker.cri.amount}">
		<input type="hidden" name="sortType" value = "${pageMaker.cri.sortType}">
	</form>
	
<!--====================================================================================-->

	<script src="${contextPath}/resources/js/planner/plannerList.js"></script>

<!--====================================================================================-->

</body>
</html>