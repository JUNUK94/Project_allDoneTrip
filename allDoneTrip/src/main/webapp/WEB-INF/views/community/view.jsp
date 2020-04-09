<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
	<div class="row ">
		<div class="col-lg-12">
			<h1 class="page-header"></h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row bodyMargin">
		<nav class="col-2 sidenav">
			<h4 class="flex-column">커뮤니티</h4>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="#">여행후기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">동행찾기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
			</ul>
		</nav>
		<div class="col-9">
			<div class="panel panel-default">

				<!-- /.panel-heading -->
				<div class="panel-body">

					<div class="form-group">
						<label>글 번호</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>글 제목</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${board.b_content}" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							value='<c:out value="${board.nick_Name }"/>' readonly="readonly">
					</div>

					<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>


					<form id='operForm' action="/community/modify" method="get">
						<input type='hidden' id='bno' name='bno'
							value='<c:out value="${board.bno}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

					</form>


				<div class="row">
				<div class="col-12 text-right">
					<button data-oper='modify' class="btn btn-primary">수정</button>
					<button data-oper='list' class="btn btn-info">목록</button>
				</div>
				</div>
				</div>
				<!--  end panel-body -->
			</div>
			<!--  end panel-body -->
			<div class="row">
				<div class="col-md-1">
					<img src="/resources/img/planner/Non_User_Photo.JPG">
				</div>
				<div class="col-md-8">
					<textarea id="plannerReply" class="col-md-12 bg-light"
						style="height: 100px;" placeholder="댓글을 입력해주세요"></textarea>
				</div>
				<div class="col-md-2">
					<button id="sendPlannerReply" class="col-md-12 bg-light"
						style="height: 100px;">등록</button>
				</div>
				<div class="col-md-2"></div>
			</div>

			<br>
			<div id="plannerReplyList">
				<c:forEach items="${reply}" var="prvo" varStatus="vs">
					<div class="row" id="${vs.index}">
						<div class="col-md-1">
							<img src="/resources/img/planner/Non_User_Photo.JPG">
						</div>
						<div class="col-md-5">
							<div class="row">
								<div class="col-md-2 small text-left">
									<a href="${prvo.nick_Name}">${prvo.nick_Name}</a>
								</div>
								<div class="col-md-10 small text-left">${prvo.regdate}</div>
							</div>
							<div>${prvo.pr_Content}</div>
						</div>
						<div class="col-md-1 small text-right">
							<a href="#" id="count_reReply${vs.index}"
								onclick="show_reReplyList(${vs.index})">∨</a>
						</div>
						<div class="col-md-1 small text-right" id="replyRUD">
							<c:if test="${prvo.email == email}">
								<a href="#" onclick="replyDelete(${prvo.p_Rno})">삭제</a> | 
						</c:if>
							<a href="#" onclick="replyWarning(${prvo.p_Rno})">신고</a> | <a
								href="#" onclick="reReply(${prvo.p_Rno},${vs.index})">답글</a>
						</div>
						<div class="col-md-2"></div>
					</div>

					<!-- 답글 입력창 -->
					<div class="row" id="reReply${vs.index}" style="display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-1"></div>
						<div class="col-md-6">
							<textarea id="reReplyText${vs.index}" class="col-md-12 bg-light"
								style="height: 100px;" placeholder=">답글"></textarea>
						</div>
						<div class="col-md-1">
							<button class="col-md-12 bg-light" style="height: 100px;"
								onclick="reReplyInsert(${prvo.p_Rno}, ${vs.index})">등록</button>
						</div>
						<div class="col-md-2"></div>
					</div>

					<!-- 답글 띄우기 -->
					<div class="row" id="reReplyList${vs.index}" style="display: none;">
						<c:forEach items="${reReply}" var="rrvo">
							<c:if test="${rrvo.up_Prno == prvo.p_Rno}">
								<div class="col-md-2"></div>
								<div class="col-md-7">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-1 text-right">┕</div>
										<div class="col-md-2 text-left small bg-light">${rrvo.nick_Name}</div>
										<div class="col-md-7 text-left small bg-light">
											${rrvo.regdate}</div>
									</div>
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-1"></div>
										<div class="col-md-9 bg-light">${rrvo.pr_Content}</div>
									</div>
								</div>
								<div class="col-md-1 text-right small">
									<c:if test="${rrvo.email == email}">
										<a href="#" onclick="replyDelete(${rrvo.p_Rno})">삭제</a> |
									</c:if>
									<a href="#" onclick="reReplyWarning(${rrvo.p_Rno})">신고</a>
								</div>
								<div class="col-md-2"></div>
								<br>
								<br>
								<br>
							</c:if>
						</c:forEach>
					</div>
					<br>
				</c:forEach>
			</div>
			<!-- ./ end row -->
		</div>
	</div>
	<!-- end panel -->
	</div>
	<!-- /.row -->






	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label> <input class="form-control" name='reply'
							value='New Reply!!!!'>
					</div>
					<div class="form-group">
						<label>Replyer</label> <input class="form-control" name='replyer'
							value='replyer'>
					</div>
					<div class="form-group">
						<label>Reply Date</label> <input class="form-control"
							name='replyDate' value='2018-01-01 13:13'>
					</div>

				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



	<script type="text/javascript" src="/resources/js/reply.js"></script>

	<script>
		$(document)
				.ready(
						function() {

							var bnoValue = '<c:out value="${board.bno}"/>';
							var replyUL = $(".chat");

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

							/*     function showList(page){
							
							 replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
							
							 var str="";
							 if(list == null || list.length == 0){ 
							
							 replyUL.html("");
							
							 return;
							 }
							 for (var i = 0, len = list.length || 0; i < len; i++) {
							 str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
							 str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
							 str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							 str +="    <p>"+list[i].reply+"</p></div></li>";
							 }


							 replyUL.html(str);

							 });//end function
							
							 }//end showList */

							var modal = $(".modal");
							var modalInputReply = modal
									.find("input[name='reply']");
							var modalInputReplyer = modal
									.find("input[name='replyer']");
							var modalInputReplyDate = modal
									.find("input[name='replyDate']");

							var modalModBtn = $("#modalModBtn");
							var modalRemoveBtn = $("#modalRemoveBtn");
							var modalRegisterBtn = $("#modalRegisterBtn");

							$("#modalCloseBtn").on("click", function(e) {

								modal.modal('hide');
							});

							$("#addReplyBtn").on(
									"click",
									function(e) {

										modal.find("input").val("");
										modalInputReplyDate.closest("div")
												.hide();
										modal.find(
												"button[id !='modalCloseBtn']")
												.hide();

										modalRegisterBtn.show();

										$(".modal").modal("show");

									});

							modalRegisterBtn.on("click", function(e) {

								var reply = {
									reply : modalInputReply.val(),
									replyer : modalInputReplyer.val(),
									bno : bnoValue
								};
								replyService.add(reply, function(result) {

									alert(result);

									modal.find("input").val("");
									modal.modal("hide");

									//showList(1);
									showList(-1);

								});

							});

							//댓글 조회 클릭 이벤트 처리 
							$(".chat")
									.on(
											"click",
											"li",
											function(e) {

												var rno = $(this).data("rno");

												replyService
														.get(
																rno,
																function(reply) {

																	modalInputReply
																			.val(reply.reply);
																	modalInputReplyer
																			.val(reply.replyer);
																	modalInputReplyDate
																			.val(
																					replyService
																							.displayTime(reply.replyDate))
																			.attr(
																					"readonly",
																					"readonly");
																	modal
																			.data(
																					"rno",
																					reply.rno);

																	modal
																			.find(
																					"button[id !='modalCloseBtn']")
																			.hide();
																	modalModBtn
																			.show();
																	modalRemoveBtn
																			.show();

																	$(".modal")
																			.modal(
																					"show");

																});
											});

							/*     modalModBtn.on("click", function(e){
							
							 var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
							
							 replyService.update(reply, function(result){
							
							 alert(result);
							 modal.modal("hide");
							 showList(1);
							
							 });
							
							 });

							 modalRemoveBtn.on("click", function (e){
							
							 var rno = modal.data("rno");
							
							 replyService.remove(rno, function(result){
							
							 alert(result);
							 modal.modal("hide");
							 showList(1);
							
							 });
							
							 }); */

							modalModBtn.on("click", function(e) {

								var reply = {
									rno : modal.data("rno"),
									reply : modalInputReply.val()
								};

								replyService.update(reply, function(result) {

									alert(result);
									modal.modal("hide");
									showList(pageNum);

								});

							});

							modalRemoveBtn.on("click", function(e) {

								var rno = modal.data("rno");

								replyService.remove(rno, function(result) {

									alert(result);
									modal.modal("hide");
									showList(pageNum);

								});

							});

						});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {

			var operForm = $("#operForm");

			$("button[data-oper='modify']").on("click", function(e) {

				operForm.attr("action", "/board/modify").submit();

			});

			$("button[data-oper='list']").on("click", function(e) {

				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list")
				operForm.submit();

			});
		});
	</script>


</body>
</html>