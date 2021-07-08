<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<link rel="stylesheet" href="css/product_css.css">
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>


	<div class = "content">
		<section class = "m4_page">
			<img src = "">
				<span>정말 삭제하시겠습니까?</span>
				<span>삭제하신 글은 복구가 불가능합니다.</span>
			<div>
				<a href = "http://localhost:9000/daangn/product_search.do"><button type = "button" class = "btn_cancle">예</button></a>
				<button type = "button" class = "btn_confrim">아니오</button>
			</div>
		</section>
	</div>
	
	<!-- 예를 클릭하면 alert 후 리스트로 이동 -->
	
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>