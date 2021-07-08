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
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class = "content">
		<!-- list section -->
	<section class = "product_more">	
		<section class = "plist_r">
			<div class = "content">
				<div class = "content_t">
					<a href = "http://localhost:9000/daangn/product_content.do"><button type = "button" class = "btn_back">←</button></a>
					<span>바니바니바니님의 판매 상품 보기</span>
						<div class = "more_menu">
						<button type = "button" class = "btn_filter_onclick">전체</button>
						<button type = "button" class = "btn_filter">거래중</button>
						<button type = "button" class = "btn_filter">거래완료</button>
					</div>
				</div>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul class = "sold">
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
			</div>
		</section>
	</div><!-- div.content -->
	</section>
	</section>	
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>