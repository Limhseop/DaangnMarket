<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/commons.css">
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<div>
		<!-- list section -->
		<section class = "plist">
			<!-- 검색 section -->
			<section class = "content_search2">
				<!-- 내 근처 위치를 잡아서 필터링/DB에 저장된 주소에 따라 필터링/체크박스에 따라 필터링  -->
				<select class = "pro_select">
					<option value = "choice">선택</option>
					<option value = "state">지역</option>
					<option value = "product">물품</option>
				</select>
				<input type = "text" class = "search" placeholder = "동네이름, 물품명 등을 검색해보세요!">
				<button type = "button" class = "carrot_btn">검색</button>
				<div class = "message">
					<span>전국민이 이용하는 당근마켓!</span>
					<span>물품을 검색하시고 우리동네에서 거래하세요</span>
				</div>
				<div class = "pro_button">
					<a href = "http://localhost:9000/daangn/product_register.do"><button type = "button" class = "btn_confrim">중고거래 올리기</button></a>
				</div>
			</section>
		</section>
	</div>
	<!-- footer -->
</body>
</html>