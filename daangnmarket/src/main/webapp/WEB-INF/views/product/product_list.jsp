<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/commons.css">
</head>
<body>
	<!-- header -->
	
	<!-- content -->
	<div><!-- 검색 부분은 fixed로 해 두기 -->
		<!-- 검색 section -->
		<section>
			<!-- 내 근처 위치를 잡아서 필터링/DB에 저장된 주소에 따라 필터링/체크박스에 따라 필터링  -->
			<input type = "text" class = "search">
			<button type = "button" class = "btn_confrim">검색</button>
		</section>
	</div>
	<div>
		<!-- list section -->
		<section class = "plist">
			<div class = "content">
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
			</div>
		</section>
	</div>
	<!-- footer -->
</body>
</html>