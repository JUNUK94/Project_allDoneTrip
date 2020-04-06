<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=====================================jquery=========================================-->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

<!--===================================bootstrap========================================-->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

.right-align {
	text-align: right;
}
/* 사이드바 */
/*     .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px
    } */
/* 본문 */
/*     .page {
     margin-top:50px;
     margin-left: 50px;
    }
 */
</style>
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
					<div style="float: left;">
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
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="text-center">
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${list}">
								<tr class="w-100">
									<td class="right-align">${board.bno}</td>
									<td>${board.title}</td>
									<td>${board.nick_Name}</td>
									<td>${board.regdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-10">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage - 1}">previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item"><a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage + 1}">next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>