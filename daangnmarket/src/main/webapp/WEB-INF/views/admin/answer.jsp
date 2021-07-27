<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"/>
	<br><br><br>
	<form action="http://localhost:9000/daangn/answerRegister.do" method="post">
		<table class="table table-bordered" style="width:50%; margin:auto;">
			<tr>
				<th>제목</th>
				<td><textarea style="width:100%; height:100%;" name="qtitle" readonly>${title}</textarea></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea style="width:100%; height:100%;" name="qcontent" readonly>${content}</textarea></td>
			</tr>
			<tr>
				<th>답변하기</th>
				<td><textarea style="width:100%;" name="qanswer"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align:center;">
					<button class="btn btn-primary">등록하기</button>
					<button class="btn btn-danger">취소</button>
				</td>
			</tr>
		</table>
	</form>
	
	
	
	<br><br><br>
	<!-- footer -->
	<jsp:include page="../footer.jsp"/>
</body>
</html>