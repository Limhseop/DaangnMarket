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
			<section class = "content_search">
				<!-- 내 근처 위치를 잡아서 필터링/DB에 저장된 주소에 따라 필터링/체크박스에 따라 필터링  -->
				<select class = "pro_select">
					<option value = "choice">선택</option>
					<option value = "state">지역</option>
					<option value = "product">물품</option>
				</select>
				<input type = "text" class = "search" placeholder = "동네이름, 물품명 등을 검색해보세요!">
				<button type = "button" class = "carrot_btn">검색</button>
				<div class = "message">
					<span>경기도 시흥시 근처를 검색하고 있어요!</span><!-- 검색하면 검색한 지역명 보이도록 -->
					<span>다른 동네를 찾으셨나요?</span>
				</div>
				<!-- <span>추천  잠실 냉장고 분당 유모차 자전거 키즈카페 강남 명품가방 홍대 쇼파</span> -->
				<!-- 물품을 검색하면 관련 추천 검색어가 뜨도록 -->
			</section>
			<section class = "no_data"><!-- 검색 결과가 없을때 띄우는 창 -->
				<div class = "content_nodata">
					<p>'sdfw'에 대한 검색 결과가 없어요.<br>
					검색어를 다시 확인해주세요!</p>
					<span>다시 검색하기</span><!-- 클릭시 검색창으로 커서 이동 -->
				</div>
			</section>
			<!-- 검색결과가 없을 시 하단에 추천 상품만 뜨도록  -->
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