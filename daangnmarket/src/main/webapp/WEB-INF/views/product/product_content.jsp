<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/commons.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<script>
//slide-wrap
var slideWrapper = document.getElementById('slider-wrap');
//current slideIndexition
var slideIndex = 0;
//items
var slides = document.querySelectorAll('#slider-wrap ul li');
//number of slides
var totalSlides = slides.length;
//get the slide width
var sliderWidth = slideWrapper.clientWidth;
//set width of items
slides.forEach(function (element) {
    element.style.width = sliderWidth + 'px';
})
//set width to be 'x' times the number of slides
var slider = document.querySelector('#slider-wrap ul#slider');
slider.style.width = sliderWidth * totalSlides + 'px';

// next, prev
var nextBtn = document.getElementById('next');
var prevBtn = document.getElementById('previous');
nextBtn.addEventListener('click', function () {
    plusSlides(1);
});
prevBtn.addEventListener('click', function () {
    plusSlides(-1);
});

// hover
slideWrapper.addEventListener('mouseover', function () {
    this.classList.add('active');
    clearInterval(autoSlider);
});
slideWrapper.addEventListener('mouseleave', function () {
    this.classList.remove('active');
    autoSlider = setInterval(function () {
        plusSlides(1);
    }, 3000);
});


function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlides(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    slideIndex = n;
    if (slideIndex == -1) {
        slideIndex = totalSlides - 1;
    } else if (slideIndex === totalSlides) {
        slideIndex = 0;
    }

    slider.style.left = -(sliderWidth * slideIndex) + 'px';
    pagination();
}

//pagination
slides.forEach(function () {
    var li = document.createElement('li');
    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
})

function pagination() {
    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
    dots.forEach(function (element) {
        element.classList.remove('active');
    });
    dots[slideIndex].classList.add('active');
}

pagination();
var autoSlider = setInterval(function () {
    plusSlides(1);
}, 3000);
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class = "content">
		<!-- content  -->
		<!-- 캐러셀 시작 -->
		
<div id="slider-wrap">
    <ul id="slider">
        <li>
            <div>
                <h3>Slide #1</h3>
                <span>Sub-title #1</span>
            </div>
            <img src="https://fakeimg.pl/350x200/960a96/000?text=11111">
        </li>

        <li>
            <div>
                <h3>Slide #2</h3>
                <span>Sub-title #2</span>
            </div>
            <img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
        </li>

        <li>
            <div>
                <h3>Slide #3</h3>
                <span>Sub-title #3</span>
            </div>
            <img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
        </li>

        <li>
            <div>
                <h3>Slide #4</h3>
                <span>Sub-title #4</span>
            </div>
            <img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
        </li>

        <li>
            <div>
                <h3>Slide #5</h3>
                <span>Sub-title #5</span>
            </div>
            <img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
        </li>
    </ul>

    <div class="slider-btns" id="next"><span>▶</span></div>
    <div class="slider-btns" id="previous"><span>◀</span></div>

    <div id="slider-pagination-wrap">
        <ul>
        </ul>
    </div>
</div>
		<!-- 캐러셀 종료 -->
		<!-- 내용 section -->
		<section class = "p_content">
			<div class = profile>
				<img src = "http://localhost:9000/daangn/pro_img/profile_icon.png">
				<div>
					<a href = "#"><span>바니바니바니</span></a>
					<span>시흥시 정왕동</span>
				</div>
				<!-- 매너온도 표시 : 클릭시 해당 회원정보 페이지로 이동 -->
				<div class = "content_manner">
					<div class = "manner_pro">
						<span>36.5℃</span>
						<progress value = "36.5" max = "100"></progress>
					</div>
					<img src = "http://localhost:9000/daangn/pro_img/manner3.PNG">
					<a href = "#" class = "c_manner">매너온도</a>
				</div>
			</div>	
			<div class = "pro_content" id = "pro_content">
				<h1>의자,테이블 정리해요 각 만원!</h1>
				<span>가구/인테리어 ∙ 5일 전</span>
				<h3>10,000원</h3>
				<p>의자 8개<br>
				긴의자 1개<br>
				테이블 2개<br>
				<br>
				톡 주세요!</p>
				<span>채팅 20 ∙ 관심 13 ∙ 조회 413</span>
				<div class = "update_click">
					<a href = "http://localhost:9000/daangn/product_update.do">수정하기</a>
					<a href = "http://localhost:9000/daangn/product_delete.do">삭제하기</a>
				</div>
			</div>
		</section>
			
		<!-- 중고 추천 section -->
		<section class = "plist_r">
			<div class = "content">
				<div class = "content_t">
					<span>당근마켓 인기중고</span>
					<a href = "http://localhost:9000/daangn/product.do"><span>더 구경하기</span></a>
				</div>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">11L 제습기 싸게 팔아요</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 장곡동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>5</span></li><!-- 관심수 표시 (있으면 보여주고 없으면 보여주지 않음)-->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img2.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">위닉스 제습기</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 은행동</li><!-- 주소 -->
					<li>70,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>2</span></li><!-- 관심수 표시 -->
				</ul>
				<ul>
					<li><img src = "http://localhost:9000/daangn/pro_img/pro_img3.jpg" class = "item"></li><!-- 사진 -->
					<li><a href = "http://localhost:9000/daangn/product_content.do"><span class = "prod_t">의자, 테이블 정리해요 각 만원!</span></a></li><!-- 이름 -->
					<li>경기도 시흥시 정왕동</li><!-- 주소 -->
					<li>10,000원</li><!-- 가격 -->
					<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>3</span></li><!-- 관심수 표시 -->
				</ul>
			</div>
		</section>
	</div><!-- div.content -->
	
	<!-- footer -->
	
</body>
</html>