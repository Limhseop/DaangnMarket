<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/service_center.css">
<body>
<!-- Header -->
	<jsp:include page ="../header.jsp"></jsp:include>


	<div class ="content">
		<div class ="search_bg">
		<!-- 검색란 텍스트 -->
			<div class="search_txt">
				<strong>궁금하신 점을 검색 해 주세요.</strong>
				<p>
					알고 싶으신 내용이 있으시면 키워드를 입력하셔서 검색해 주세요.<br>
					FAQ, 이용안내, 팁 등에 대한 내용을 검색하실 수 있습니다.
				</p>
			</div>
		<!-- 검색란 Input -->
			<div class ="main_search_input">
				<input placeholder="검색어를 입력하세요" type="text" name="service_search" id="service_search">
				<a href="" class="sch_btn" id="sch_btn">검색</a>
			</div>
			<ul class ="quick_service">
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
			<!-- FAQ && 문의 하기 -->
			<div class ="faq_wrap">
				<div class="faq_wrap_inner">
					<div class ="faq_wrap_inner_1">
						<strong>FAQ</strong>	
						<p>자주하시는 질문을 모아놓았습니다. 궁금하신 내용을 검색해 주세요.</p>
						<ul>
							<li><a href="">커뮤니티 가이드라인</a></li>
							<li><a href="">당근마켓 운영정책</a></li>
							<li><a href="">판매금지 물품</a></li>
							<li><a href="">당근마켓 뜻이 뭔가요?(왜 당근마켓 인가요?)</a></li>
							<li><a href="">당근마켓 지역광고 운영정책</a></li>
							<li><a href="">알림은 어디서 확인하나요?</a></li>
						</ul>
					
					</div>
					<div class ="faq_wrap_inner_2">
						<strong>문의하기</strong>
						<p>문의에 대한 처리현황을 확인할 수 있습니다.</p>	
						<div class="voc_login">
							<div class ="voc_login_inner">
							<figure>
							<img alt="" src="//image.istarbucks.co.kr/common/img/util/csi/voc_login_pic.png">
							</figure>
							<p><span>로그인이 필요한<br>서비스입니다.</span></p>
							</div>
						</div>	
					<a class="btn_login" href="">로그인</a>					
					</div>
					
					
					
				</div>
			</div>
	
		
	
	
	
	
	</div>
	
<!-- Footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>	
</body>
</html>