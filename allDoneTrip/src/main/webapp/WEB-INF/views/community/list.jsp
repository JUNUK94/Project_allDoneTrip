<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=====================================jquery=========================================-->

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM"></script>
<!--===================================bootstrap========================================-->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="/resources/css/community.css" rel="stylesheet">
<!-- <script src="/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script> -->
</head>
<body>
	<div class="container totalWidth">
		<div class=" row">
			<nav class="col-2 sidenav">
				<h2 class="mt-3" style="width:100%;">커뮤니티</h2>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link sideMenu paddingRemove mt-2" data-btype="2">여행후기</a></li>
					<li class="nav-item"><a class="nav-link sideMenu paddingRemove mt-2" data-btype="3">동행찾기</a></li>
					<li class="nav-item"><a class="nav-link sideMenu paddingRemove mt-2" data-btype="4">자유게시판</a></li>
				</ul>
			</nav>
			<div class="col-10 page">
			<div>
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
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/community/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>검색형식</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
			</div> 
				<div>
					<table class="table table=responsive table-bordered table-hover col-12">
						<thead>
							<tr class="text-center">
								<th style="width: 10%;">글번호</th>
								<th style="width: 50%;">제목</th>
								<th style="width: 10%;">작성자</th>
								<th style="width: 10%;">작성일자</th>
								<th style="width: 10%;">조회수</th>
								<th style="width: 10%;">좋아요</th>
							</tr>
						</thead>
						<tbody class="boardList">
							<c:forEach var="board" items="${list}">
								<tr>
									<td>
										<c:out value="${board.bno}" />
									</td>
									<td>
										<a class='move' href='<c:out value="${board.bno}"/>'> <c:out value="${board.title}" /></a>
									</td>
									<td>
										<c:out value="${board.nick_Name}" />
									</td>
									<td style="font-size: 10px;">${board.regdate}</td>
									<td>${board.b_clickNum}</td>
									<td>${board.b_Like}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="reviewCard row align-content-center flex">
				<c:forEach var="board" items="${list }">
					<div class="card col-5 ml-4 mr-2 mt-2 align-content-center text-center" style="padding: 5px;">
						<img class="card-img-bottom" src="/resources/img/listimage/test.png" alt="Card image" style="width: 100%; height: 200px;">
						<div class="card-body">
							<h4 class="card-title">${board.title }</h4>
							<p class="card-text">여행지 해시태그</p>
							<div class="row align-content-center">
								<a href="#" class="btn-sm btn-primary col-6">좋아요 수</a> <a href="#" class="btn-sm btn-primary col-6">See Profile</a>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="row">
					<div class="col-md-10">
						<ul class="pagination pageNumber paddingRemove">
							<c:if test="${pageMaker.prev}">
								<li class="page-item paginate_button previous"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="page-item paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''} "><a class="page-link pageNum" href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item paginate_button next"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
					</div>
					<button class="col-2 btn-sm btn-primary float-right d-inline btnMargin btnWrite">글 작성</button>
					<br><br><br><br>

					<form id='actionForm' action="/community/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'> 
						<input type='hidden' name='b_Type' value='${ pageMaker.cri.b_Type }'>
						<input type='hidden' name='keyword' value='${ pageMaker.cri.keyword }'>
						<input type="hidden" name='sortType' value = "${pageMaker.cri.sortType}">
						<input type='hidden' name='bno' value=""/>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<script type="text/javascript" src="../resources/js/board/boardPaging.js"></script> -->
	<script>
		$(document).ready(function() {

			var actionForm = $("#actionForm");

			//페이지리스트 이동
			$(".paginate_button a").on("click", function(e) {
				e.preventDefault();

				let bType = '<c:out value="${ pageMaker.cri.b_Type }"/>';
				actionForm.find("input[name='pageNum']").val("value", $(this).attr("href"));
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));

				actionForm.submit();
			});

			//게시글 선택 조회
			$(".move").on("click", function(e) {
				e.preventDefault();
				let bnoMove = $(this).attr("href");
				actionForm.find("input[name='bno']").val($(this).attr("href"));
				actionForm.attr("action", "/community/view");
				actionForm.submit();
			});

			//n개씩 보기 선택 시
			$("#amount").on("change", function(e){
				var amount = $(this).val();
				actionForm.find("input[name='amount']").val(amount);
				actionForm.submit();
			});

			//사이드 메뉴 이동
			$('.sideMenu').on("click", function(e) {
				e.preventDefault();

				let btype = $(this).data("btype");

				$(location).attr('href', 'list?b_Type=' + btype)
			})

			//글쓰기 버튼
			$(".btnWrite").on("click", function() {

				$(location).attr('href', 'write');

			})

		});
	</script>
</body>
</html>