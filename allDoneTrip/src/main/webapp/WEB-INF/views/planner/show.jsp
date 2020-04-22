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
										<c:if test="${pvo.p_Thumbnail != null}">
											<img src='${pvo.p_Thumbnail}'>
										</c:if>
										<c:if test="${pvo.p_Thumbnail == null}">
											<script>
												var i = parseInt((Math.random()*7));
												document.write("<img src='https://alldonetrip.shop/resources/img/basic/thumbnail/BasicThumbnail_"+i+".png'");
											</script>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<div class="col-lg-6 d-flex flex-column">
								<div class="row align-items-center" style="height:80%">
									<div class="about_text">
										<c:forEach items="${content}" var="pvo">
											<h5 style="color: #fe5c24; font-size: 16px;">
												${pvo.city_Name}
											</h5>
											<h2 style="font-weight: bold;">
												${pvo.p_Title}
											</h2>
											<br>
											<p>${pvo.trip_Period}<br>
												작성자 : ${pvo.nick_Name}</p>
										</c:forEach>
									</div>
								</div>
								<div class="row align-items-end" style="height:20%">
									<button type="button" class="btn btn-outline-primary">pdf 다운로드</button>
								</div>
							</div>
							<div class="col-lg-2 d-flex flex-column">
								<div class="row d-flex flex-row justify-content-end">
									<i class='far fa-envelope text-primary p-1' style='font-size:30px;'></i>
									<i class='far fa-envelope text-primary p-1' style='font-size:30px;'></i>
								</div>
								<div class="row d-flex flex-row justify-content-between">
								</div>
							</div>
							<div class="col-lg-1 d-flex flex-column"></div>
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
		                            	<c:if test="${List.p_Thumbnail != null}">
		                                	<img src="${List.p_Thumbnail}" width='70px' height='70px' style="overflow: hidden;">
		                                </c:if>
		                                <c:if test="${List.p_Thumbnail == null}">
		                                	<script>
												var i = parseInt((Math.random()*7));
												document.write("<img src='https://alldonetrip.shop/resources/img/basic/thumbnail/BasicThumbnail_"+i+".png' width='70px' height='70px' style='overflow: hidden;'>");
											</script>
		                                </c:if>
		                                <div class="media-body">
		                                	<a href="single-blog.html">
		                                        <p style="color: #fe5c24;">${List.city_Name}</p>
		                                    </a>
		                                    <a href="single-blog.html">
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
		                            	<c:if test="${List.p_Thumbnail != null}">
		                                	<img src="${List.p_Thumbnail}" width='70px' height='70px' style="overflow: hidden;">
		                                </c:if>
		                                <c:if test="${List.p_Thumbnail == null}">
		                                	<script>
												var i = parseInt((Math.random()*7));
												document.write("<img src='https://alldonetrip.shop/resources/img/basic/thumbnail/BasicThumbnail_"+i+".png' width='70px' height='70px' style='overflow: hidden;'>");
											</script>
		                                </c:if>
		                                <div class="media-body">
		                                	<a href="single-blog.html">
		                                        <p style="color: #fe5c24;">${List.city_Name}</p>
		                                    </a>
		                                    <a href="single-blog.html">
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
    <!--================ Blog Area end =================-->							
	
	
		<!-- 세션의 닉네임,이메일 & 현재 페이지의 플래너번호 가져오기-->
		<form id="sessionForm" action="/planner/plannerReply" method="get">
			<input type="hidden" name="plan_No" value="${param.plan_No}">
			<input type="hidden" name="nick_Name" value="${nick_Name}">
			<input type="hidden" name="email" value="${email}">
		</form>
		
		

<!--====================================================================================-->

	<script src="${contextPath}/resources/js/planner/plannerShow.js"></script>
	<script src="${contextPath}/resources/js/planner/plannerReply.js"></script>

<!--====================================================================================-->
</body>
</html>