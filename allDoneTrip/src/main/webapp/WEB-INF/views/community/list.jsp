<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community</title>
<link href="/resources/css/community.css" rel="stylesheet">
<!-- <script src="/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script> -->
</head>
<body>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>커뮤니티</h2>
							<p>Share your Story</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<div class="container totalWidth">
		<div class=" row">
			<div class="col-12 page">
				<div>
					<div class="d-flex flex-row align-items-center justify-content-center" style="height: 80px; background-color: #EAEFFF;">
						<div class="p-3">
							<input type="radio" id="sortType" name="sortType" value="regdate">등록일순 &nbsp; 
							<input type="radio" id="sortType" name="sortType" value="plan_Like">추천순 &nbsp; 
							<input type="radio" id="sortType" name="sortType" value="click_Num">조회순
						</div>
						<form id="searchForm" action="/community/list" method="get">
							<div class="input-group p-3">
								<div class="input-group-prepend">
									<select id="type" name="type" class="form-control">
										<option value="T">제목</option>
										<option value="W">작성자</option>
										<option value="C" hidden="">도시</option>
									</select>
								</div>
								<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search Keyword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
								<div class="input-group-append">
									<label class="input-group-text" style="background-color: white"> <i class="ti-search"></i>
									</label>
								</div>
							</div>
							<input type="hidden" name="sortType" value=""> 
							<input type="hidden" name="pageNum" value="1"> 
							<input type="hidden" name="amount" value="10">
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
							<a href="/community/write"> <i class="far fa-edit" style="font-size: 20px; margin-left: 30px"></i>
							</a>
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
							<c:forEach var="board" items="${boardlist}">
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
				<div class="row">
					<div class="col-12">
						<ul class="text-center col-9 col-md-6 col-sm-1 pagination pageNumber paddingRemove marginRemove " style="float: none; margin: 0 auto;">
							<c:if test="${pageMaker.prev}">
								<li class="page-item paginate_button previous float-left"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="page-item paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''} float-left"><a class="page-link pageNum" href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item paginate_button next float-left"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
							</c:if>

							<li class="col-1 btn-sm btn-primary float-right d-inline btnMargin btnWrite">글 작성</li>
						</ul>
					</div>
					<br>
					<br>
					<br>
					<br>

					<form id='actionForm' action="/community/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'> 
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='type' value='${pageMaker.cri.type} '>
						<input type='hidden' name='b_Type' value='${ pageMaker.cri.b_Type }'> 
						<input type='hidden' name='keyword' value='${ pageMaker.cri.keyword }'> 
						<input type="hidden" name='sortType' value="${pageMaker.cri.sortType}"> 
						<input type='hidden' name='bno' value="" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<script type="text/javascript" src="../resources/js/board/boardPaging.js"></script> -->
	<script>
		$(document).ready(function() {

			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
			//페이지리스트 이동
			$(".paginate_button a").on("click", function(e) {
				e.preventDefault();

				let bType = '<c:out value="${ pageMaker.cri.b_Type }"/>';
				let keyword = '<c:out value="${ pageMaker.cri.keyword}"/>';
				let type = '<c:out value="${pageMaker.cri.type}"/>'
				
				
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.find("input[name='b_Type']").val(bType);
				actionForm.find("input[name='keyword']").val(keyword);
				actionForm.find("input[name='type']").val(type);
				

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
			$("#amount").on("change", function(e) {
				var amount = $(this).val();
				actionForm.find("input[name='amount']").val(amount);
				actionForm.submit();
			});

				//라디오박스 선택 시 정렬
			$("input[name='sortType']").on("click", function(e){
				var sortType = $(this).val();
				actionForm.find("input[name='sortType']").val(sortType);
				actionForm.submit();
			});

			//사이드 메뉴 이동
			$('.sideMenu').on("click", function(e) {
				e.preventDefault();

				let btype = $(this).data("btype");

				$(location).attr('href', 'list?b_Type=' + btype)
			})
			
				// 키워드 입력하여 검색
			$("#keyword").on("keydown", function(key){
				if(key.keyCode == 13){
					searchForm.find("input[name='pageNum']").val("1");
					searchForm.find("input[name='sortType']").val("regdate");
					
					
					searchForm.submit();
				}
			});

			//글쓰기 버튼
			$(".btnWrite").on("click", function() {

				$(location).attr('href', 'write');

			})

		});
	</script>
</body>
</html>