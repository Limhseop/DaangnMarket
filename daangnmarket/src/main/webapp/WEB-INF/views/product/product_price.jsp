<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/product_css.css">
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
</head>
<script>
	$(document).ready(function(){
		
		$("#btn_send").click(function(){
			alert("가격이 전송되었습니다.")
		});
	});
</script>
<body>
	<div class = "price_content">
		<h1>가격 제안하기</h1>
		<div>
			<span>홍길동님,</span>
			<span>시세에 맞는 가격을 제안해보세요.</span>
		</div>
		<input type = "text" placeholder = "제안금액">
		<button class = "btn_cancle" id = "btn_send">제안하기</button>
	</div>
</body>
</html>