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
<title>플래너 조회</title>
	<% 
		session.setAttribute("email", "silverdue@gmail.com");
		session.setAttribute("nick_Name", "창창");
		session.setAttribute("profile", "http://alldonetrip.shop/resources/img/user/profile/a.jpg");
		//session.invalidate();
	%>
	<style>
		#likeBtn{
			width:48px; 
			height: 48px; 
			padding-top: 10px; 
			padding-left: 12px;
			margin-right: 5px;
			z-index:5; 
		}
		
		#scrapBtn{
			width:48px; 
			height: 48px; 
			padding-top: 12px; 
			padding-left: 14px;
			margin-left: 200px;
			z-index:5; 
		}
		
		#likeBtn:hover,
		#scrapBtn:hover{
			cursor: pointer;
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
                            <h2>플래너</h2>
                            <p>We hope to find the Best Planner for you</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
	<!--================Blog Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                    <div class="single-post">
	                    <div class="row">
	                        <div class="col-lg-3">
								<div class="about_img">
									<c:forEach items="${content}" var="pvo">
										<img src='${pvo.p_Thumbnail}'>
									</c:forEach>
								</div>
							</div>
							<div class="col-lg-7 d-flex flex-column hotel_list">
								<div class="row align-items-center" style="height:80%">
									<div class="about_text">
										<c:forEach items="${content}" var="pvo">
											<h5 style="color: #fe5c24; font-size: 16px;">
												${pvo.city_Name}
											</h5>
											<h2 style="font-weight: bold;">
												${pvo.p_Title}
												<c:if test="${pvo.email == email}">
													<!-- 수정, 삭제 버튼 -->
													&nbsp;<a id="modify_Planner" href="#"><i class='fas fa-eraser' style='font-size: 18px; color: gray'></i></a>
													&nbsp;<span data-toggle="modal" data-target="#delete_Planner_Modal"><i class='fas fa-trash-alt' style='font-size: 18px; color: gray'></i></span>
												</c:if>
											</h2>
											<br>
											<p>${pvo.trip_Period}<br>
												작성자 : ${pvo.nick_Name}</p>
										</c:forEach>
									</div>
								</div>
								<div class="row single_ihotel_list justify-content-between align-items-end" style="height:30%">
									<!-- 다운로드 버튼 -->
									<button type="button" class="btn btn-outline-primary">pdf 다운로드</button>
									<c:if test="${scrapStatus == true}">
										<span id="scrapBtn" class="rounded-circle align-items-center" style="background-color: rgb(92, 209, 229);">
											<i class='far fa-bookmark' style='font-size:25px;color: white'></i>
										</span>
									</c:if>
									<c:if test="${scrapStatus == false}">
										<span id="scrapBtn" class="rounded-circle align-items-center" style="background-color: #fe5c24;">
											<i class='far fa-bookmark' style='font-size:25px;color: white'></i>
										</span>
									</c:if>
									<!-- 좋아요 버튼 -->
									<c:if test="${likeStatus == true}">
										<span id="likeBtn" class="rounded-circle align-items-center" style="background-color: rgb(92, 209, 229);">
											<i class='far fa-thumbs-up' style='font-size:25px; color: white;'></i>
										</span>
									</c:if>
									<c:if test="${likeStatus == false}">
										<span id="likeBtn" class="rounded-circle align-items-center" style="background-color: #fe5c24;">
											<i class='far fa-thumbs-up' style='font-size:25px; color: white;'></i>
										</span>
									</c:if>
									<!-- 공유 아이콘 -->
									<div class="hover_text" style="margin-left: 450px; margin-top: 0px;">
										<div class="hotel_social_icon">
											<ul>
												<li>
													<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook">
														<i class="ti-facebook"></i>
													</a>
												</li>
												<li>
													<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Twitter">
														<i class="ti-twitter-alt"></i>
													</a>
												</li>
												<!-- 네이버 블로그로.. -->
												<li>
													<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Naver">
														<i class="ti-linkedin"></i>
													</a>
												</li>
											</ul>
										</div>
										<div class="share_icon">
											<i class="ti-share"></i>
										</div>
									</div>
									<!-- end of 공유아이콘-->
								</div>
							</div>
							<div class="col-lg-2 d-flex flex-column"></div>
						</div>
                    </div>
				
                    <!-- 작성자 프로필 부분 -->
					<div class="blog-author" style="margin-top:30px;">
						<div class="media align-items-center">
							<!-- 작성자의 프로필 사진  -->
							<img src="" alt="writer_Profile" class="mr-3 mt-3 rounded-circle" style="width:60px;">
							<i class='fas fa-user-circle' style='font-size:48px; color:#eaefff;'></i>
							<div class="media-body">
								<c:forEach items="${content}" var="pvo">
									<a href="#">
										<h4>${pvo.nick_Name}</h4>
									</a>
								</c:forEach>
								<!-- 유저의 소개글 정보 얻어오기  -->
								<p>유저의 소개글 정보 얻어오기</p>
							</div>
						</div>
					</div>
					<div class="navigation-top">
                        <div class="d-sm-flex justify-content-between text-center p-2">
                            <p class="like-info align-self-center">
								<c:forEach items="${content}" var="pvo">
	                            	<span class="align-middle">
	                            		<i class='far fa-thumbs-up'></i>
										${pvo.plan_Like}
									</span>
								</c:forEach>
                            </p>
                            <p class="like-info">
                            	<span class="align-middle">
                                	<i class="far fa-comments"></i>
									${totalReply} Comments
								</span>
							</p>
                        </div>
                    </div>
                    
                    <!-- 댓글 작성부분 -->
                   	<div class="comment-form">
						<div class="row form-contact comment_form">
	          				<div class="col-12">
	                        	<div class="form-group">
	                            	<textarea class="form-control w-100" name="plannerReply" id="plannerReply" cols="30" rows="7" placeholder="Write Comment"></textarea>
	    						</div>
	       				    </div>
	                	</div>
						<div class="form-group">
							<button id="sendPlannerReply" class="button button-contactForm btn_1">
								Send Message
							</button>
						</div>
					</div>
					
                    <!-- 댓글 영역 -->
                    <div class="comments-area">
                        <c:forEach items="${reply}" var="prvo" varStatus="vs">
	                        <div id="${vs.index}" class="comment-list">
	                            <div class="single-comment justify-content-between d-flex">
	                                <div class="user justify-content-between d-flex col-lg-12">
	                                    <div class="thumb">
		                                    <!-- 댓글작성자 사진 -->
	                                        <img src="../resources/main/img/comment/comment_1.png" alt="">
	                                    </div>
	                                    <div class="desc flex-grow-1">
	                                        <p class="comment">${prvo.pr_Content}</p>
	                                        <div class="d-flex justify-content-between">
	                                            <div class="d-flex align-items-center">
	                                                <h5>
														<a href="${prvo.nick_Name}">${prvo.nick_Name}</a>
													</h5>
	                                                <p class="date">${prvo.regdate}</p>
	                                            </div>
	                                            <div id="replyRUD" class="reply-btn">
													<c:if test="${prvo.email == email}" >
														<a href="#" class="btn-reply text-uppercase" onclick="replyDelete(${prvo.p_Rno})">
															delete
														</a>
													</c:if>
													<a href="#" class="btn-reply text-uppercase" onclick="replyWarning(${prvo.p_Rno})">
														warn
													</a>
	                                                <a href="#" id="count_reReply${vs.index}" class="btn-reply text-uppercase" onclick="show_reReplyList(${vs.index})">
	                                                	reply
	                                                </a>
	                                            </div>
	                                        </div>
	                                        
	                                        <!-- 답글 입력창 -->
					                   		<div id="reReply${vs.index}" class="comment-form" style="display:none;">
												<div class="row form-contact comment_form">
					                                <div class="col-12">
					                                    <div class="form-group">
					                                        <textarea id="reReplyText${vs.index}" class="form-control w-100" cols="30" rows="4" placeholder="Write reply"></textarea>
					                                    </div>
													</div>
												</div>
												<div class="form-group">
													<button id="sendPlannerReply" class="button button-contactForm btn_2" onclick="reReplyInsert(${prvo.p_Rno}, ${vs.index})">Send reply</button>
												</div>
					                    	</div>
	                                    </div>
	                                </div>
	                            </div>
							</div>
							
							<!-- 답글 리스트 -->
							<div id="reReplyList${vs.index}" class="comment-list" style="display:none;">
								<c:forEach items="${reReply}" var="rrvo">
									<c:if test="${rrvo.up_Prno == prvo.p_Rno}">
			                            <div class="single-comment justify-content-between">
			                                <div class="user justify-content-between d-flex col-lg-12">
			                                    <div class="thumb">
			                                        <img src="../resources/main/img/comment/comment_1.png" style="visibility: hidden;">
			                                    </div>
			                                    <div class="thumb">
				                                    <!-- 댓글작성자 사진 -->
			                                        <img src="../resources/main/img/comment/comment_1.png" alt="">
			                                    </div>
			                                    <div class="desc flex-grow-1">
			                                        <p class="comment">${rrvo.pr_Content}</p>
			                                        <div class="d-flex justify-content-between">
			                                            <div class="d-flex align-items-center">
			                                                <h5>
																<a href="${rrvo.nick_Name}">${rrvo.nick_Name}</a>
															</h5>
			                                                <p class="date">${rrvo.regdate}</p>
			                                            </div>
			                                            <div id="replyRUD" class="reply-btn">
															<c:if test="${rrvo.email == email}" >
																<a href="#" class="btn-reply text-uppercase" onclick="replyDelete(${rrvo.p_Rno})">
																	delete
																</a>
															</c:if>
															<a href="#" class="btn-reply text-uppercase" onclick="reReplyWarning(${rrvo.p_Rno})">
																warn
															</a>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                            <br><br>
		                            </c:if>
								</c:forEach>
							</div>
						</c:forEach>
                	</div><!-- end of Comment Area -->
                </div> <!-- end of posts-list -->
                
                <!-- 사이드 바 부분 시작 -->
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
	                        <form id="searchForm" action="/planner/list" method='get'>
		                        <div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<select id="type" name ="type" class="form-control">
												<option value="T">제목</option>
												<option value="W">작성자</option>
												<option value="C" hidden="">도시</option>
											</select>
										</div>
										<input type="text" id="keyword" name="keyword" class="form-control" placeholder='Search Keyword' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
										<div class="input-group-append">
											<button class="btn" type="button"><i class="ti-search"></i></button>
				 						</div>
									</div>
								</div>
                                <button id="search_Submit" class="button rounded-0 primary-bg text-white w-100 btn_1" type="submit">Search</button>
								
								<input type="hidden" name="sortType" value = "${pageMaker.cri.sortType}">
								<input type="hidden" name="pageNum" value= "${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value= "${pageMaker.cri.amount}">
							</form>
                        </aside>
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Planner</h3>
                            <c:set var="loop" value="true" />
                            <c:forEach items="${plannerList}" var="List" varStatus="li">
                            	<c:if test="${loop}">
		                            <div class="media post_item">
	                                	<img src="${List.p_Thumbnail}" width='70px' height='70px' style="overflow: hidden;">
		                                <div class="media-body">
											<p style="color: #fe5c24;">${List.city_Name}</p>
		                                    <a href="/planner/show?plan_No=${List.plan_No}">
		                                        <h3 style="font-weight: bold;">${List.p_Title}</h3>
		                                    </a>
		                                    <p>${List.trip_Period}</p>
		                                </div>
		                            </div>
		                            <c:if test="${li.index == 2}">
		                            	 <c:set var="loop" value="false" />
		                            </c:if>
                            	</c:if>
                            </c:forEach>
                        </aside>
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Popular Planner</h3>
                            <c:set var="loop" value="true" />
                            <c:forEach items="${popular_PlannerList}" var="List" varStatus="li">
                            	<c:if test="${loop}">
		                            <div class="media post_item">
	                                	<img src="${List.p_Thumbnail}" width='70px' height='70px' style="overflow: hidden;">
		                                <div class="media-body">
											<p style="color: #fe5c24;">${List.city_Name}</p>
		                                    <a href="/planner/show?plan_No=${List.plan_No}">
		                                        <h3 style="font-weight: bold;">${List.p_Title}</h3>
		                                    </a>
		                                    <p>${List.trip_Period}</p>
		                                </div>
		                            </div>
		                            <c:if test="${li.index == 2}">
		                            	 <c:set var="loop" value="false" />
		                            </c:if>
                            	</c:if>
                            </c:forEach>
                        </aside>
                    </div>
                </div><!-- end of 사이드 바 -->
            </div>
        </div>
    </section>
    <!--================ end of Blog Area =================-->							
	

	<!-- 세션의 닉네임,이메일 & 현재 페이지의 플래너번호 가져오기-->
	<form id="sessionForm" action="/planner/plannerReply" method="get">
		<input type="hidden" name="plan_No" value="${param.plan_No}">
		<input type="hidden" name="nick_Name" value="${nick_Name}">
		<input type="hidden" name="email" value="${email}">
	</form>
		
		
	
<!--==================================== 모달창 ========================================-->		
	<!-- 플래너 삭제요청 재확인 모달 -->
  	<div class="modal fade" id="delete_Planner_Modal">
    	<div class="modal-dialog">
     		<div class="modal-content">
      
        <div class="modal-header">
          <h5 class="modal-title">플래너 삭제</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body text-center">
        	<br>
        	한 번 삭제 후에는 복구가 불가능합니다.<br>
        	정말 삭제하시겠습니까?
        	<br><br>
        	<button id="delete_Planner" type="button" class="btn btn-secondary">삭제</button>
        	<br>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>	

	<!-- 플래너 삭제 결과 호출 모달 -->
  	<div class="modal fade" id="delete_Planner_Result_Modal">
    	<div class="modal-dialog">
     		<div class="modal-content">
      
        <div class="modal-header">
          <h5 class="modal-title">플래너 삭제</h5>
          <button type="button" class="close modal-close" data-dismiss="modal">&times;</button>
        </div>
        
        <div id="delete_Planner_Result" class="modal-body text-center">
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-danger modal-close" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>	
		
		
		

<!--====================================================================================-->

	<script src="${contextPath}/resources/js/planner/plannerShow.js"></script>
	<script src="${contextPath}/resources/js/planner/plannerReply.js"></script>

<!--====================================================================================-->
</body>
</html>