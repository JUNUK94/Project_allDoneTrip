<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="com-body">
		<div name="boardType"></div>
		<div name="boardShow">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list}">
						<tr>
							<td>${board.bno}</td>
							<td>${board.title}</td>
							<td>${board.nick_Name}</td>
							<td>${board.regdate}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>