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
							<div class="col-lg-9 d-flex flex-column">
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
						</div>
                        <div class="blog_details">
                            <ul class="blog-info-link mt-3 mb-4">
                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- 작성자 프로필 부분 -->
					<div class="blog-author">
						<div class="media align-items-center">
							<!-- 작성자의 프로필 사진  -->
							<img src="img_avatar3.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
							<i class='fas fa-user-circle' style='font-size:48px; color:blue;'></i>
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
                        <div class="d-sm-flex justify-content-between text-center">
                            <p class="like-info"><span class="align-middle"><i class="far fa-heart"></i></span> Lily and 4 people like this</p>
                            <div class="col-sm-4 text-center my-2 my-sm-0">
                                <!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
                            </div>
                            <ul class="social-icons">
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fab fa-behance"></i></a></li>
                            </ul>
                        </div>
                        <div class="navigation-area">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img class="img-fluid" src="../resources/main/img/post/preview.png" alt="">
                                        </a>
                                    </div>
                                    <div class="arrow">
                                        <a href="#">
                                            <span class="lnr text-white ti-arrow-left"></span>
                                        </a>
                                    </div>
                                    <div class="detials">
                                        <p>Prev Post</p>
                                        <a href="#">
                                            <h4>Space The Final Frontier</h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                                    <div class="detials">
                                        <p>Next Post</p>
                                        <a href="#">
                                            <h4>Telescopes 101</h4>
                                        </a>
                                    </div>
                                    <div class="arrow">
                                        <a href="#">
                                            <span class="lnr text-white ti-arrow-right"></span>
                                        </a>
                                    </div>
                                    <div class="thumb">
                                        <a href="#">
                                            <img class="img-fluid" src="../resources/main/img/post/next.png" alt="">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comments-area">
                        <h4>05 Comments</h4>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="../resources/main/img/comment/comment_1.png" alt="">
                                    </div>
                                    <div class="desc">
                                        <p class="comment">
                                            Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                            </div>
                                            <div class="reply-btn">
                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="../resources/main/img/comment/comment_2.png" alt="">
                                    </div>
                                    <div class="desc">
                                        <p class="comment">
                                            Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                            </div>
                                            <div class="reply-btn">
                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="../resources/main/img/comment/comment_3.png" alt="">
                                    </div>
                                    <div class="desc">
                                        <p class="comment">
                                            Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                            </div>
                                            <div class="reply-btn">
                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comment-form">
                        <h4>Leave a Reply</h4>
                        <form class="form-contact comment_form" action="#" id="commentForm">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" placeholder="Write Comment"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="name" id="name" type="text" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="email" id="email" type="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="website" id="website" type="text" placeholder="Website">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="button button-contactForm btn_1">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
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
                            <h3 class="widget_title">Recent Post</h3>
                            <div class="media post_item">
                                <img src="../resources/main/img/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>From life was you fish...</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="../resources/main/img/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>The Amazing Hubble</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="../resources/main/img/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Astronomy Or Astrology</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="../resources/main/img/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Asteroids telescope</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Tag Clouds</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">project</a>
                                </li>
                                <li>
                                    <a href="#">love</a>
                                </li>
                                <li>
                                    <a href="#">technology</a>
                                </li>
                                <li>
                                    <a href="#">travel</a>
                                </li>
                                <li>
                                    <a href="#">restaurant</a>
                                </li>
                                <li>
                                    <a href="#">life style</a>
                                </li>
                                <li>
                                    <a href="#">design</a>
                                </li>
                                <li>
                                    <a href="#">illustration</a>
                                </li>
                            </ul>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ Blog Area end =================-->							
	
	
	
		<div class="row">
			<div class="col-lg1"></div>
			<div class="col-lg10 bg-light">
			</div>
			<div class="col-lg1"></div>			
		</div>
	
		<div class="row">
			<div class="col-lg2"></div>
			<div class="col-lg8" style="height:40px; border-bottom: 1px solid gray; border-top: 1px solid gray">
				댓글 (${totalReply})
			</div>
			<div class="col-lg2"></div>
		</div>
		
		<br>
		
		<div class="row">
			<div class="col-lg2"></div>
			<div class="col-lg1">
			<img src="/resources/img/planner/Non_User_Photo.JPG">
			</div>
			<div class="col-lg6">
				<textarea id="plannerReply" class="col-lg12 bg-light" style="height:100px;" placeholder="댓글을 입력해주세요"></textarea>
			</div>	
			<div class="col-lg1" >
				<button id="sendPlannerReply" class="col-lg12 bg-light" style="height:100px;">등록</button>
			</div>
			<div class="col-lg2"></div>
		</div>
		
		<br>
		<div id="plannerReplyList">
			<c:forEach items="${reply}" var="prvo" varStatus="vs">
				<div class="row" id="${vs.index}">
					<div class="col-lg2"></div>
					<div class="col-lg1">
						<img src="/resources/img/planner/Non_User_Photo.JPG">
					</div>
					<div class="col-lg5">
						<div class="row">
							<div class="col-lg2 small text-left">
								<a href="${prvo.nick_Name}">${prvo.nick_Name}</a>
							</div> 
							<div class="col-lg10 small text-left">
								${prvo.regdate}
							</div>
						</div>
						<div>${prvo.pr_Content}</div>				
					</div>
					<div class="col-lg1 small text-right">
						<a href="#" id="count_reReply${vs.index}" onclick="show_reReplyList(${vs.index})">∨</a>
					</div>
					<div class="col-lg1 small text-right" id="replyRUD">	
						<c:if test="${prvo.email == email}" >
							<a href="#" onclick="replyDelete(${prvo.p_Rno})">삭제</a> | 
						</c:if>
						<a href="#" onclick="replyWarning(${prvo.p_Rno})">신고</a> | 
						<a href="#" onclick="reReply(${prvo.p_Rno},${vs.index})">답글</a>
					</div>
					<div class="col-lg2"></div>
				</div>
				
				<!-- 답글 입력창 -->
				<div class="row" id="reReply${vs.index}" style="display:none;">
					<div class="col-lg2"></div>
					<div class="col-lg1"></div>
					<div class="col-lg6">
						<textarea id="reReplyText${vs.index}" class="col-lg12 bg-light" style="height:100px;" placeholder=">답글"></textarea>
					</div>	
					<div class="col-lg1" >
						<button class="col-lg12 bg-light" style="height:100px;" onclick="reReplyInsert(${prvo.p_Rno}, ${vs.index})">등록</button>
					</div>
					<div class="col-lg2"></div>
				</div>
				
				<!-- 답글 띄우기 -->
				<div class="row" id="reReplyList${vs.index}" style="display:none;">
					<c:forEach items="${reReply}" var="rrvo">
						<c:if test="${rrvo.up_Prno == prvo.p_Rno}">
								<div class="col-lg2"></div>
								<div class="col-lg7">
									<div class="row">
										<div class="col-lg2"></div>
										<div class="col-lg1 text-right">┕</div>
										<div class="col-lg2 text-left small bg-light">${rrvo.nick_Name}</div>
										<div class="col-lg7 text-left small bg-light"> ${rrvo.regdate}</div>
									</div>
									<div class="row">
										<div class="col-lg2"></div>
										<div class="col-lg1"></div>
										<div class="col-lg9 bg-light">${rrvo.pr_Content}</div>
									</div>
								</div>
								<div class="col-lg1 text-right small">
									<c:if test="${rrvo.email == email}">
										<a href="#" onclick="replyDelete(${rrvo.p_Rno})">삭제</a> |
									</c:if>
									<a href="#" onclick="reReplyWarning(${rrvo.p_Rno})">신고</a>
								</div>
								<div class="col-lg2"></div>
								<br><br><br>
						</c:if>
					</c:forEach>
				</div>
				<br>
			</c:forEach>
		</div>
	</div>

				


		
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