<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<th style="width:20%;">아이디</th>
						<th style="width:20%;">이름</th>
						<th style="width:30%;">가입일자</th>
						<th style="width:10%;">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>가입일자</td>
						<td><button>탈퇴</button></td>
					</tr>
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