<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>플래너 조회</title>
	<% 
		//session.setAttribute("email", "ccc@naver.com");
		//session.setAttribute("nick_Name", "짜파구리");
		session.invalidate();
	%>
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
				<img id="likeBtn" src="/resources/img/Like.png" width="80px">
				<br>
				<c:forEach items="${content}" var="pvo">
					<label name="likeCnt">${pvo.plan_Like}</label>
				</c:forEach>
				</div>
			<div class="col-md-2"></div>			
		</div>
	
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="height:40px; border-bottom: 1px solid gray; border-top: 1px solid gray">
				댓글 (${totalReply})
			</div>
			<div class="col-md-2"></div>
		</div>
		
		<br>
		
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-1">
			<img src="/resources/img/Non_User_Photo.JPG">
			</div>
			<div class="col-md-6">
				<textarea id="plannerReply" class="col-md-12 bg-light" style="height:100px;" placeholder="댓글을 입력해주세요"></textarea>
			</div>	
			<div class="col-md-1" >
				<button id="sendPlannerReply" class="col-md-12 bg-light" style="height:100px;">등록</button>
			</div>
			<div class="col-md-2"></div>
		</div>
		
		<br>
		<div id="plannerReplyList">
			<c:forEach items="${reply}" var="prvo" varStatus="vs">
				<div class="row" id="${vs.index}">
					<div class="col-md-2"></div>
					<div class="col-md-1">
						<img src="/resources/img/Non_User_Photo.JPG">
					</div>
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-2 small text-left">
								<a href="${prvo.nick_Name}">${prvo.nick_Name}</a>
							</div> 
							<div class="col-md-10 small text-left">
								${prvo.regdate}
							</div>
						</div>
						<div>${prvo.pr_Content}</div>				
					</div>
					<div class="col-md-1 small text-right">
						<a href="#" id="count_reReply${vs.index}" onclick="show_reReplyList(${vs.index})">∨</a>
					</div>
					<div class="col-md-1 small text-right" id="replyRUD">	
						<c:if test="${prvo.email == email}" >
							<a href="#" onclick="replyDelete(${prvo.p_Rno})">삭제</a> | 
						</c:if>
						<a href="#" onclick="replyWarning(${prvo.p_Rno})">신고</a> | 
						<a href="#" onclick="reReply(${prvo.p_Rno},${vs.index})">답글</a>
					</div>
					<div class="col-md-2"></div>
				</div>
				
				<!-- 답글 입력창 -->
				<div class="row" id="reReply${vs.index}" style="display:none;">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<textarea id="reReplyText${vs.index}" class="col-md-12 bg-light" style="height:100px;" placeholder=">답글"></textarea>
					</div>	
					<div class="col-md-1" >
						<button class="col-md-12 bg-light" style="height:100px;" onclick="reReplyInsert(${prvo.p_Rno}, ${vs.index})">등록</button>
					</div>
					<div class="col-md-2"></div>
				</div>
				
				<!-- 답글 띄우기 -->
				<div class="row" id="reReplyList${vs.index}" style="display:none;">
					<c:forEach items="${reReply}" var="rrvo">
						<c:if test="${rrvo.up_Prno == prvo.p_Rno}">
								<div class="col-md-2"></div>
								<div class="col-md-7">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-1 text-right">┕</div>
										<div class="col-md-2 text-left small bg-light">${rrvo.nick_Name}</div>
										<div class="col-md-7 text-left small bg-light"> ${rrvo.regdate}</div>
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
								<br><br><br>
						</c:if>
					</c:forEach>
				</div>
				<br>
			</c:forEach>
		</div>
		

				


		
		<!-- 세션의 닉네임,이메일 & 현재 페이지의 플래너번호 가져오기-->
		<form id="sessionForm" action="/planner/plannerReply" method="get">
			<input type="hidden" name="plan_No" value="${param.plan_No}">
			<input type="hidden" name="nick_Name" value="${nick_Name}">
			<input type="hidden" name="email" value="${email}">
		</form>
		
		

<!--====================================================================================-->

	<script src="${contextPath}/resources/js/plannerShow.js"></script>
	<script src="${contextPath}/resources/js/plannerReply.js"></script>

<!--====================================================================================-->
</body>
</html>