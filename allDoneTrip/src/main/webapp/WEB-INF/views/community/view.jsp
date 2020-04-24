<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	session.setAttribute("email", "herbing@naver.com");
	session.setAttribute("nick_Name", "wowgarcon");
	//session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community</title>
<link href="/resources/css/community.css" rel="stylesheet">
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
	<div class="row bodyMargin col-10" style="margin:0 auto; ">
		<div class="col-9 ">
			<div class="panel panel-default">

				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="row col-12 inputMargin">
						<div class="form-group col-2">
							<label>글 번호</label> <input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
						</div>

						<div class="form-group col-8">
							<label>글 제목</label> <input class="form-control" name='title' value='<c:out value="${board.title }"/>' readonly="readonly">
						</div>
						<div class="form-group col-2">
							<label>작성자</label> <input class="form-control" name='writer' value='<c:out value="${board.nick_Name }"/>' readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label>내용 </label>
						<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.b_content}" /></textarea>
					</div>

					<form id='operForm' action="/boad/modify" method="get">
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
					</form>


					<form id='operForm' action="/community/modify" method="get">
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'> <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'> <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

					</form>

					<div class="row">
						<div class="col-12 text-right">
							<button data-oper='modify' class="btn btn-primary boardModify">수정</button>
							<button data-oper='list' class="btn btn-info boardList">목록</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
					<img src="/resources/img/planner/Non_User_Photo.JPG">
				</div>
				<div class="col-md-8">
					<textarea id="boardReply" class="col-md-12 bg-light" style="height: 100px;" placeholder="댓글을 입력해주세요"></textarea>
				</div>
				<div class="col-md-2">
					<button id="sendBoardReply" class="col-md-12 bg-light" style="height: 100px;">등록</button>
				</div>
				<div class="col-md-2"></div>
			</div>

			<br>
			<div id="boardReplyList">
				<c:forEach items="${reply}" var="rvo" varStatus="vs">
					<div class="row" id="${vs.index}">
						<div class="col-md-1">
							<img src="/resources/img/planner/Non_User_Photo.JPG">
						</div>
						<div class="col-md-5">
							<div class="row">
								<div class="col-md-2 small text-left">
									<a href="${rvo.nick_Name}">${rvo.nick_Name}</a>
								</div>
								<div class="col-md-10 small text-left">${rvo.regdate}</div>
							</div>
							<div>${rvo.r_Content}</div>
						</div>
						<div class="col-md-1 small text-right">
							<a href="#" id="count_reReply${vs.index}" onclick="show_reReplyList(${vs.index})">∨</a>
						</div>
						<div class="col-md-1 small text-right" id="replyRUD">
							<c:if test="${rvo.email == email}">
								<a href="#" onclick="replyDelete(${rvo.rno})">삭제</a> | 
						</c:if>
							<a href="#" onclick="replyWarning(${rvo.rno})">신고</a> | <a href="#" onclick="reReply(${rvo.rno},${vs.index})">답글</a>
						</div>
						<div class="col-md-2"></div>
					</div>

					<!-- 답글 입력창 -->
					<div class="row" id="reReply${vs.index}" style="display: none;">
						<div class="col-md-2"></div>
						<div class="col-md-1"></div>
						<div class="col-md-6">
							<textarea id="reReplyText${vs.index}" class="col-md-12 bg-light" style="height: 100px;" placeholder=">답글"></textarea>
						</div>
						<div class="col-md-1">
							<button class="col-md-12 bg-light" style="height: 100px;" onclick="reReplyInsert(${rvo.rno}, ${vs.index})">등록</button>
						</div>
						<div class="col-md-2"></div>
					</div>

					<!-- 답글 띄우기 -->
					<div class="row" id="reReplyList${vs.index}" style="display: none;">
						<c:forEach items="${reReply}" var="rrvo">
							<c:if test="${rrvo.up_Rno == rvo.rno}">
								<div class="col-md-2"></div>
								<div class="col-md-7">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-1 text-right">┕</div>
										<div class="col-md-2 text-left small bg-light">${rrvo.nick_Name}</div>
										<div class="col-md-7 text-left small bg-light">${rrvo.regdate}</div>
									</div>
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-1"></div>
										<div class="col-md-9 bg-light">${rrvo.r_Content}</div>
									</div>
								</div>
								<div class="col-md-1 text-right small">
									<c:if test="${rrvo.email == email}">
										<a href="#" onclick="replyDelete(${rrvo.rno})">삭제</a> |
									</c:if>
									<a href="#" onclick="reReplyWarning(${rrvo.rno})">신고</a>
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
		<!-- end panel -->
		<!-- 참고한플래너 -->
		<div class="col-3">
			<div style="border: 4px solid #F0F;">
				<ul>
					<li class="text-center plannerAttach">참고 플래너</li>
					<!-- 플래너 영역 -->
						<li><img src=${planner.get(0).p_Thumbnail } width='200px' height='300px'></li>
						<li><p>${planner.get(0).plan_No}</p></li>
						<li><p>${planner.get(0).p_Title}</p></li>
				</ul>
			</div>
		</div>
		<!-- 참고한플래너 끝-->
		<!-- /.row -->

		<form id="sessionForm" action="/community/plannerReply" method="get">
			<input type="hidden" name="bno" value="${board.bno}"> 
			<input type="hidden" name="nick_Name" value="${nick_Name}"> 
			<input type="hidden" name="email" value="${email}"> <input type="hidden" name="b_Type" value="${board.b_Type}">
		</form>
	</div>
	<div class="col-1"></div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	//사이드 메뉴 이동
	$('.sideMenu').on("click", function(e) {
		e.preventDefault();
		
		let btype = $(this).data("btype");

		$(location).attr('href', 'list?b_Type=' + btype)
	});
	/* 
	$('.plannerAttach').on("click", function() {
		var plannerNum = '${planner.get(0).plan_No}'
	}) */
});
</script>

<!--====================================================================================-->

<script src="${contextPath}/resources/js/board/boardReply.js"></script>

<!--====================================================================================-->
</html>