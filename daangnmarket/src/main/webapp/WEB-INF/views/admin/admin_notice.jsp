<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/admin.css">
</head>
<body>
	<!-- Header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	<br><br>
	<div class="section">
		<div class="section1">
			<table class="table table-bordered table1" style="width:15%;">
				<thead>
					<tr>
						<th>메뉴</th>
					</tr>
				</thead>
				<tbody>
					<tr class="info">
						<td>회원 관리</td>
					</tr>
					<tr>
						<td>공지사항 관리</td>
					</tr>
					<tr>
						<td>문의사항 답변하기</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered memberlist" style="width:80%;">
				<thead>
					<tr>
						<th style="width:20%;">번호</th>
						<th style="width:20%;">제목</th>
						<th style="width:30%;">작성일자</th>
						<th style="width:10%;">삭제</th>
						<th style="width:10%;">수정</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${list}" var = "list">
					<tr>
						<td><c:out value="${list.bno}" /></td>
						<td><c:out value="${list.title}" /></td>
						<td><c:out value="${list.ndate}" /></td>
						<td><button onclick="location.href='admin_noticedelete_proc.do?bno=${list.bno}' ">삭제</button></td>
						<td><button onclick="location.href='admin_noticeupdate.do?bno=${list.bno}' ">수정</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

			<table class="table table-bordered noticemanage" style="width:80%;">
				<thead>
					<tr>
						<th>메뉴</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>회원 관리</td>
					</tr>
					<tr>
						<td>공지사항 관리</td>
					</tr>
					<tr>
						<td>문의사항 답변하기</td>
					</tr>
				</tbody>
			</table>

			<table class="table table-bordered qanda" style="width:80%;">
				<thead>
					<tr>
						<th>메뉴</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>회원 관리</td>
					</tr>
					<tr>
						<td>공지사항 관리</td>
					</tr>
					<tr>
						<td>문의사항 답변하기</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html> 