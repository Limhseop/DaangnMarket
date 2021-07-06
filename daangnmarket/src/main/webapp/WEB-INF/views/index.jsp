<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/daangn/css/index.css">
<title>당신의 근처 당근마켓</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page ="header.jsp"></jsp:include>
	
	<!-- 첫번째 이미지(섹션) -->
	<section id="home-main-section-top" class="background-pale-peach">
	 	 <div id="home-main-top">
   	 		<div class="home-main-desc">
      			<h1 class="home-main-title">당신 근처의<br>당근마켓</h1>
      			<p class="text-m">
        		중고 거래부터 동네 정보까지, 이웃과 함께해요.<br>가깝고 따뜻한 당신의 근처를 만들어요.
     			 </p>
    		</div>
    	<div class="home-main-image-top"></div>
  		</div>
	</section>
	<!-- 두번째 이미지(섹션) -->
	
	<section class="home-main-section">
	  <div class="home-main-content">
	    <div class="home-main-image home-main-image-01"></div>
	    <div>
	      <h1 class="home-main-title">우리 동네<br>중고 직거래 마켓</h1>
	      <p class="text-m">
	        동네 주민들과 가깝고 따뜻한 거래를
	        
	        지금 경험해보세요.
	      </p>
	      <div class="home-buttons">
	        <a class="home-button text-l text-bold" href="/hot_articles">인기매물 보기</a>
	        <a class="home-button text-l text-bold ml-3" href="/trust">믿을 수 있는 중고거래</a>
	      </div>
	    </div>
	  </div>
	</section>
	
	<!-- 세번째 이미지(섹션) -->
	<section class="home-main-section background-pale-green">
	  <div class="home-main-content home-main-reverse">
	    <div class="home-main-image home-main-image-02"></div>
	    <div>
	      <h1 class="home-main-title">이웃과 함께 하는<br>동네생활</h1>
	      <p class="text-m">
	        우리 동네의 다양한 이야기를
	        
	        이웃과 함께 나누어요.
	      </p>
	        <ul class="home-story-list">
	          <li class="home-story-list-item">
	            <div class="icon-story icon-story-01"></div>
	            <div class="text-s text-bold mt-3 mb-2">우리동네질문</div>
	            <div class="text-xs">궁금한 게 있을 땐 이웃에게 물어보세요. </div>
	          </li>
	          <li class="home-story-list-item">
	            <div class="icon-story icon-story-02"></div>
	            <div class="text-s text-bold mt-3 mb-2">동네분실센터</div>
	            <div class="text-xs">무언가를 잃어버렸을 때, 함께 찾을 수 있어요.</div>
	          </li>
	          <li class="home-story-list-item">
	            <div class="icon-story icon-story-03"></div>
	            <div class="text-s text-bold mt-3 mb-2">동네모임</div>
	            <div class="text-xs">관심사가 비슷한 이웃과 온오프라인으로 만나요.</div>
	          </li>
	        </ul>
	    </div>
	  </div>
	</section>
	
	<!-- 네번째 이미지(섹션) -->
	
	<section class="home-main-section">
	  <div class="home-main-content">
	    <div class="home-main-image home-main-image-03"></div>
	    <div>
	      <h1 class="home-main-title">내 근처에서 찾는<br>동네가게</h1>
	      <p class="text-m">
	        우리 동네 가게를 찾고 있나요?<br>동네 주민이 남긴 진짜 후기를 함께 확인해보세요!
	      </p>
	      <div class="home-buttons">
	        <a target="_blank" id="town-link-button" class="ga-click home-button text-l text-bold" data-event-category="town_link_from" data-event-action="index_base" data-event-label="main_town" href="https://town.daangn.com">당근마켓 동네가게 찾기</a>
	      </div>
	    </div>
	  </div>
	</section>
	
	<!-- 다섯번째 (인기 중고 매물) -->
	
	
	<!-- Footer -->
	<jsp:include page ="footer.jsp"></jsp:include>

</body>
</html>