<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/commons.css">
<script>
$(document).ready(function(){
	$("#re_search").click(function(){
		$("#search").focus();
	});
	
});
</script>
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
				<input type = "text" class = "search" placeholder = "동네이름, 물품명 등을 검색해보세요!" id = "search">
				<button type = "button" class = "carrot_btn">검색</button>
				<a href = "http://localhost:9000/daangn/product_register.do?id=${sessionScope.svo.id}"><button type = "button" class = "btn_confrim">중고거래 올리기</button></a>
				<div class = "message">
					<span>경기도 시흥시 근처를 검색하고 있어요!</span><!-- 검색하면 검색한 지역명 보이도록 -->
					<span>다른 동네를 찾으셨나요?</span>
				</div>
				<!-- <span>추천  잠실 냉장고 분당 유모차 자전거 키즈카페 강남 명품가방 홍대 쇼파</span> -->
				<!-- 물품을 검색하면 관련 추천 검색어가 뜨도록 -->
			</section>
			<section class = "no_data"><!-- 검색 결과가 없을때 띄우는 창 -->
				<!-- <div class = "content_nodata">
					<p>'sdfw'에 대한 검색 결과가 없어요.<br>
					검색어를 다시 확인해주세요!</p>
					<span id = "re_search">다시 검색하기</span>클릭시 검색창으로 커서 이동
				</div> -->
			</section>
			<!-- 검색결과가 없을 시 하단에 추천 상품만 뜨도록  -->
			<div class = "content">
			<div style = "text-align:left; width:90%; margin:auto;">
			<c:forEach var = "plist" items = "${list}">
				<ul>
					<c:choose>
						<c:when test = "${plist.psfile ne null}">
							<li><img src = "http://localhost:9000/daangn/pro_upload/${plist.psfile}" class = "item"></li><!-- 사진 -->
						</c:when>
						<c:otherwise>
							<li><img src = "http://localhost:9000/daangn/pro_img/noimage.png" class = "item"></li><!-- 사진 -->
						</c:otherwise>
					</c:choose>
					<li><a href = "product_content.do?pid=${plist.pid}&rno=${plist.rno}"><span class = "prod_t">${plist.ptitle}</span></a></li><!-- 이름 -->
					<li>${plist.location}</li><!-- 주소 -->
					<li>${plist.price}원</li><!-- 가격 -->
					<c:choose>
						<c:when test = "${plist.favorite ne null}">
							<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>${plist.favorite}</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
						</c:when>
						<c:otherwise>
							<li></li>
						</c:otherwise>
					</c:choose>	
				</ul>
			</c:forEach>	
			</div>
		</div>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>