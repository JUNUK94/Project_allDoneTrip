<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/common.css?utv=00023528" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/dest.css?utv=00023528" />
<link rel="stylesheet" type="text/css"
	href="//img.tourtips.com/css/pc/jquery-ui.css?utv=00023528" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info_home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	기본정보 city_list.jsp
	<br>

	<div class="container">

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
								aria-selected="true">여행지 정보</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">날씨</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">환전</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#bus" role="tab" aria-controls="bus"
				aria-selected="false">공항 및 교통</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">가나다.</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">배고파</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">집갈랭</div>
			<div class="tab-pane fade" id="bus" role="tabpanel"
				aria-labelledby="bus">졸리다</div>
		</div>
	</div>
	
	<div class="best_spot">
		<h2 class="title">인기 여행지</h2>
		<div class="popular_tab">
			<ul>
				<li class="on"><a href="#">명소</a></li>
				<li style=""><a href="#">맛집</a></li>
				<li style=""><a href="#">쇼핑</a></li>
				<li style=""><a href="#">숙박</a></li>
			</ul>
		</div>
		<!-- popular_conts -->
		<div class="popular_conts">
			<div class="popular_box" style="display: block;">
				<div class="spot_list">
					<ul>


						<li><a
							href="/dest/content/1014_paris?contentID=1000001463101&amp;type=place">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2016030331/gjf6fs/DSC01116.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">박물관, 미술관</div>
									<strong class="title">루브르 박물관</strong>
									<p>전 세계 3대 박물관</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001463101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001425101&amp;type=place">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014102259/gje0lp/파리_개선문_TTS박진형 (4).JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">랜드마크</div>
									<strong class="title">개선문</strong>
									<p>나폴레옹의 승리 상징</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001425101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001593101&amp;type=place">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062316/gjdo4g/마레 지구.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">랜드마크</div>
									<strong class="title">마레 지구</strong>
									<p>예술가와 패션 피플들의 거리</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001593101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001410101&amp;type=place">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2016030394/gjf6fn/DSC00401.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">랜드마크</div>
									<strong class="title">에펠탑</strong>
									<p>명실상부 파리의 아이콘</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001410101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001514101&amp;type=place">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014092584/gje00l/파리_노트르담대성당_TTS최다혜 (2).JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">성당/교회</div>
									<strong class="title">노트르담 대성당</strong>
									<p>너무나 유명한 아름다운 성당</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001514101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001408101&amp;type=place">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2015010902/gje2ew/DSC01435.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">박물관, 미술관</div>
									<strong class="title">로댕 미술관</strong>
									<p>작지만 알찬 구성의 로댕 조각품 전시</p>
									<p class="star">4.3</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001408101">
								<span></span>
							</button></li>
					</ul>
				</div>
				<a class="more_info" href="/dest/list/1014_paris?type=place">더보기</a>
			</div>
			
			<div class="popular_box">
				<div class="spot_list">
					<ul>


						<li><a
							href="/dest/content/1014_paris?contentID=1000001448101&amp;type=food">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062318/gjdp44/레옹 드 브뤼셀.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">시푸드</div>
									<strong class="title">레옹 드 브뤼셀</strong>
									<p>벨기에 홍합 요리 전문</p>
									<p class="star">4.7</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001448101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001454101&amp;type=food">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062383/gjdjax/(샹젤리제 거리 주변)_르 흘레 드 랑트헤코트 내부_ML.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">양식</div>
									<strong class="title">르 흘레 드 랑트흐코트</strong>
									<p>프랑스식 스테이크</p>
									<p class="star">4.1</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001454101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001618101&amp;type=food">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062313/gjdjbd/(마레 지구 주변)_라 스 뒤 팔라페1_TT.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">베이커리/디저트</div>
									<strong class="title">라스 뒤 팔라펠</strong>
									<p>유대인 스타일의 샌드위치</p>
									<p class="star">4.7</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001618101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001455101&amp;type=food">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062303/gjdjbl/(샹젤리제 거리 주변)_푸케_TT.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">카페/바</div>
									<strong class="title">푸케</strong>
									<p>문화예술인들이 사랑한 카페</p>
									<p class="star">3.9</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001455101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001620101&amp;type=food">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062346/gjdjbg/(마레 지구 주변)_오 프티 페흐 아 슈발1_TT.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">양식</div>
									<strong class="title">오 프티 페흐 아 슈발</strong>
									<p>송아지 스테이크를 저렴하게</p>
									<p class="star">4.4</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001620101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001451101&amp;type=food">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062318/gjdldz/_샹젤리제 거리_맛집_히포포타무스_TTS곽한주.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">양식</div>
									<strong class="title">히포포타무스</strong>
									<p>샹젤리제 거리의 스테이크집</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001451101">
								<span></span>
							</button></li>
					</ul>
				</div>
				<a class="more_info" href="/dest/list/1014_paris?type=food">더보기</a>
			</div>
			<div class="popular_box">
				<div class="spot_list">
					<ul>


						<li><a
							href="/dest/content/1014_paris?contentID=1000001441101&amp;type=shop">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062303/gjdle0/_샹젤리제 거리_쇼핑_디즈니 스토어_TTS곽한주(1).JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">로드샵/기념품샵</div>
									<strong class="title">디즈니스토어</strong>
									<p>파리 디즈니랜드의 감동을 다시 한 번</p>
									<p class="star">4</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001441101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001546101&amp;type=shop">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062329/gjdoi0/방브 벼룩시장.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">시장/마트</div>
									<strong class="title">방브 벼룩시장</strong>
									<p>파리 시민들이 가장 많이 찾는 벼룩시장</p>
									<p class="star">4.2</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001546101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001477101&amp;type=shop">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2015031089/gjelbe/DSC00560.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">쇼핑센터(몰)/백화점</div>
									<strong class="title">쁘렝땅</strong>
									<p>천장 유리가 문화재인 아름다운 백화점</p>
									<p class="star">4.3</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001477101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001486101&amp;type=shop">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062369/gjdjbc/(르부르 박물관 주변_샤넬 깜봉_TT.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">상점</div>
									<strong class="title">샤넬 깜봉(본점)</strong>
									<p>샤넬 본점</p>
									<p class="star">4.1</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001486101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001440101&amp;type=shop">
								<strong class="recommend">강추</strong>
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2015010919/gje2fj/888.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">상점</div>
									<strong class="title">루이비통 본점</strong>
									<p>언제나 북적거리는 루이비통 본점</p>
									<p class="star">4.1</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001440101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000001488101&amp;type=shop">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014062345/gjdos5/갤러리 약국.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">드러그 스토어</div>
									<strong class="title">갤러리 약국</strong>
									<p>저렴한 약국 화장품</p>
									<p class="star">3.8</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000001488101">
								<span></span>
							</button></li>
					</ul>
				</div>
				<a class="more_info" href="/dest/list/1014_paris?type=shop">더보기</a>
			</div>
			<div class="popular_box">
				<div class="spot_list">
					<ul>


						<li><a
							href="/dest/content/1014_paris?contentID=1000004211101&amp;type=lodge">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014092423/gjdzty/500203_라크씨엘 한인민박_공식_11.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">기타</div>
									<strong class="title">라크시엘 파리 민박</strong>
									<p>개선문과 가까운 한인민박</p>
									<p class="star">4.4</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000004211101">
								<span></span>
							</button></li>

						<li><a class="no_thumb"
							href="/dest/content/1014_paris?contentID=1000004209101&amp;type=lodge">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="//img.tourtips.com/images/mo/dest_v2/img_noThumbnail.gif">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">게스트하우스</div>
									<strong class="title">파리 마리하우스</strong>
									<p>편리한 교통편과 푸짐한 한식</p>
									<p class="star">4.5</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000004209101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000004187101&amp;type=lodge">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014092445/gjdzsq/500101_호텔 드 론드레스 에펠_공홈_04.jpg">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">호텔</div>
									<strong class="title">호텔 드 론드레스 에펠</strong>
									<p>창 밖의 에펠탑을 보며 잠들기</p>
									<p class="star">4.2</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000004187101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000004208101&amp;type=lodge">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014092460/gjdzu7/500303_에드베니엇 호스텔_공홈_08.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">호스텔(백패커스)</div>
									<strong class="title">애드베니엇 호스텔</strong>
									<p>샹제리제 근처에 있는 저렴한 호스텔</p>
									<p class="star">4</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000004208101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000004201101&amp;type=lodge">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014092451/gjdzt1/500115_퍼시픽 호텔_공홈_12.JPG">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">호텔</div>
									<strong class="title">퍼시픽 호텔</strong>
									<p>넓은 방도 에펠탑도 놓치기 싫다면</p>
									<p class="star">4.4</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000004201101">
								<span></span>
							</button></li>

						<li><a
							href="/dest/content/1014_paris?contentID=1000004192101&amp;type=lodge">
								<div class="thumb_wrap">
									<div class="thumb">
										<div class="in">
											<div class="thumb_img">
												<img alt=""
													src="http://cfd.tourtips.com/@cms_600/2014092457/gjdzue/호텔파리프랑스_OW호텔파리프랑스홈페이지.png">
											</div>
										</div>
										<span class="cover"></span>
									</div>
								</div>

								<div class="info">
									<div class="category">호텔</div>
									<strong class="title">파리 프랑스 호텔</strong>
									<p>유럽 내 전통 있는 호텔</p>
									<p class="star">4.1</p>
								</div> <span class="border"></span>
						</a>
							<button title="즐겨찾기" class="bookmark r_bookmark"
								seq-id="1000004192101">
								<span></span>
							</button></li>
					</ul>
				</div>
				<a class="more_info" href="/dest/list/1014_paris?type=lodge">더보기</a>
			</div>
		</div>
		<!-- //best_spot -->
	</div>

</body>
</html>