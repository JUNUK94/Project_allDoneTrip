<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-2 border" >
			<br>
			<div class="badge" style="position: relative; font-size:15pt;">마이페이지 </div><br><br>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="myBoard nav-link" id="">나의 게시글</a><br>
				</li>
				<li class="nav-item">
					<a class="myPlanner nav-link" id="">나의 플래너</a><br>
				</li>
				<li class="nav-item">
					<a class="myScrap nav-link" id="">스크랩</a><br>
				</li>
				<li class="nav-item">
					<a class="myInfo nav-link" id="">회원정보 수정/탈퇴</a>
				</li>
			</ul>		
		</div>
		<div class="col-10 border">
			
			내용
			
			<div class="sns-go">
			  <ul>
			    <li>
			      <a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Naver" ><img src="../resources/img/share/sns_naver.png" width="40" alt="네이버 블로그 공유하기"></a>
			    </li> 
			    <li>
			      <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" ><img src="../resources/img/share/sns_face.png" width="40" alt="페이스북 공유하기"></a>
			    </li>
			    <li>
			      <a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Twitter" ><img src="../resources/img/share/sns_tw.png" width="40" alt="트위터 공유하기"></a>
			    </li>
			    <li>
			      <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;" target="_blank" alt="Share on kakaostory"><img src="../resources/img/share/sns_kakao.png" width="40" alt="카카오스토리 공유하기"></a>
			    </li>
			  </ul>
			</div>
		</div>
	</div>

</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="/resources/js/my/myMain.js"></script>
</html>