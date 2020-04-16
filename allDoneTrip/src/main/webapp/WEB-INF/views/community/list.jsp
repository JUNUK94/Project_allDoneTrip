<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=====================================jquery=========================================-->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script
	src="http://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM"></script>
<!--===================================bootstrap========================================-->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link href="/resources/css/community.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-2 sidenav">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#">여행후기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">동행찾기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">
							Disabled </a></li>
				</ul>
			</nav>
			<div class="col-10 page">
				<div>
					<h3>검색 조건</h3>
					<div>
						<div style="float: left;">
							<p>ddddd</p>
						</div>
						<div style="float: left;">
							<p>aaaaa</p>
						</div>
						<div style="float: right;">
							<p>fffffff</p>
						</div>
					</div>
					<div class="row col-12">
						<select name="job">
							<option value="">나라선택</option>
							<option value="학생">학생</option>
							<option value="회사원">회사원</option>
							<option value="기타">기타</option>
						</select> <select name="sdfsdfsd">
							<option value="">도시선택</option>
							<option value="학생">학생</option>
							<option value="회사원">회사원</option>
							<option value="기타">기타</option>
						</select> <select name="qwer">
							<option value="">게시글 종류</option>
							<option value="학생">학생</option>
							<option value="회사원">회사원</option>
							<option value="기타">기타</option>
						</select> <select name="zxcv">
							<option value="">별점</option>
							<option value="학생">학생</option>
							<option value="회사원">회사원</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<div>
					<button class="button boardListBtn">ajax 테스트</button>
					<br>
					<table>
						<tr class="w-100 boardTB">
						</tr>
					</table>
					<ul class="boardUL">
					<li><script>${list2 }</script></li>
					
					</ul>

				</div>
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
						<tbody>
							<c:forEach var="board" items="${list}">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<td><a class='move' href='<c:out value="${board.bno}"/>'>
											<c:out value="${board.title}" />
									</a></td>
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
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item paginate_button previous"><a
									class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li
									class="page-item paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''} "><a
									class="page-link pageNum" href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item paginate_button next"><a
									class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
					</div>
					<form id='actionForm' action="/community/list" method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'> <input
							type='hidden' name='type'
							value='<c:out value="${ pageMaker.cri.type }"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${ pageMaker.cri.keyword }"/>'>


					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<script type="text/javascript" src="../resources/js/board/boardPaging.js"></script> -->
	<script>
		$(document)
				.ready(
						function() {
							
							var actionForm = $("#actionForm");

							$(".paginate_button a").on(
									"click",
									function(e) {

										e.preventDefault();

										console.log('click');

										actionForm.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							$(".move")
									.on(
											"click",
											function(e) {

												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='bno' value='"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action",
														"/community/view");
												actionForm.submit();

											});	
						
							$(".boardListBtn").click(function() {

								let btnNum = $(".boardListBtn").text();
								console.log(btnNum);
								
								// $.ajax({
								// 	url:
								// })
							});

							let bnoValue = '<c:out value="${board.bno}"/>';
							let boardTB = $(".boardTB");

							showList(1);

							function showList(page) {

								console.log("show list " + page);

								replyService
										.getList(
												{
													bno : bnoValue,
													page : page || 1
												},
												function(replyCnt, list) {

													console.log("replyCnt: "
															+ replyCnt);
													console
															.log("list: "
																	+ list);
													console.log(list);

													if (page == -1) {
														pageNum = Math
																.ceil(replyCnt / 10.0);
														showList(pageNum);
														return;
													}

													var str = "";

													if (list == null
															|| list.length == 0) {
														return;
													}

													for (var i = 0, len = list.length || 0; i < len; i++) {
														str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
														str += "  <div><div class='header'><strong class='primary-font'>["
																+ list[i].rno
																+ "] "
																+ list[i].replyer
																+ "</strong>";
														str += "    <small class='pull-right text-muted'>"
																+ replyService
																		.displayTime(list[i].replyDate)
																+ "</small></div>";
														str += "    <p>"
																+ list[i].reply
																+ "</p></div></li>";
													}

													replyUL.html(str);

													showReplyPage(replyCnt);

												});//end function

							}//end showList

							var pageNum = 1;
							var replyPageFooter = $(".panel-footer");

							function showReplyPage(replyCnt) {

								var endNum = Math.ceil(pageNum / 10.0) * 10;
								var startNum = endNum - 9;

								var prev = startNum != 1;
								var next = false;

								if (endNum * 10 >= replyCnt) {
									endNum = Math.ceil(replyCnt / 10.0);
								}

								if (endNum * 10 < replyCnt) {
									next = true;
								}

								var str = "<ul class='pagination pull-right'>";

								if (prev) {
									str += "<li class='page-item'><a class='page-link' href='"
											+ (startNum - 1)
											+ "'>Previous</a></li>";
								}

								for (var i = startNum; i <= endNum; i++) {

									var active = pageNum == i ? "active" : "";

									str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
											+ i + "</a></li>";
								}

								if (next) {
									str += "<li class='page-item'><a class='page-link' href='"
											+ (endNum + 1) + "'>Next</a></li>";
								}

								str += "</ul></div>";

								console.log(str);

								replyPageFooter.html(str);
							}

							replyPageFooter.on("click", "li a", function(e) {
								e.preventDefault();
								console.log("page click");

								var targetPageNum = $(this).attr("href");

								console.log("targetPageNum: " + targetPageNum);

								pageNum = targetPageNum;

								showList(pageNum);
							});
						});
	</script>
</body>
</html>