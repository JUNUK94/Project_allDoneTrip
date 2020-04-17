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
	<div class="container">
		<div class=" row">
			<nav class="col-2 sidenav">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link sideMenu" data-btype="2">여행후기</a></li>
					<li class="nav-item"><a class="nav-link sideMenu" data-btype="3">동행찾기</a></li>
					<li class="nav-item"><a class="nav-link sideMenu" data-btype="4">자유게시판</a></li>
				</ul>
			</nav>
			<div class="col-10 page">
				<div>
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="text-center">
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
								<th>좋아요</th>
							</tr>
						</thead>
						<tbody class="boardList">
							<c:forEach var="board" items="${list}">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<td><a class='move' href='<c:out value="${board.bno}"/>'> <c:out value="${board.title}" /></a></td>
									<td><c:out value="${board.nick_Name}" /></td>
									<td>${board.regdate}</td>
									<td>${board.b_clickNum}</td>
									<td>${board.b_Like}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-10">
						<ul class="pagination pageNumber">
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
					<button class="col-md-2 btn btn-primary float-right d-inline btnMargin">글 작성<c:out value="${ pageMaker.cri.b_Type }"/></button>
					<form id='actionForm' action="/community/list" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='b_Type' value='<c:out value="${ pageMaker.cri.b_Type }"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>


					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<script type="text/javascript" src="../resources/js/board/boardPaging.js"></script> -->
	<script>
	$(document).ready(function () {
	  
		var actionForm = $("#actionForm");
	  
		$(".paginate_button a").on("click", function (e) {
	    	e.preventDefault();
			
	    	let bType = '<c:out value="${ pageMaker.cri.b_Type }"/>';
	    	
	    	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	    	
	    	actionForm.submit();
	  	});

		$(".move").on("click", function (e) {
	    	e.preventDefault();
	    	actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
	    	actionForm.attr("action", "/community/view");
	    	actionForm.submit();
			});
			
		$('.sideMenu').on("click", function(e) {
			e.preventDefault();
			
			var btype = $(this).data("btype");
			$(location).attr('href','list?b_Type='+btype)
			
			
		})

	});
	</script>
</body>
</html>