<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/carousel.css">
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
/******
팝업창 띄우기
*****/ 

$(document).on('click', '#btn_price',function(){
	var popupHeight = 350;
	var popupWidth = 450;

	var popupX = (window.screen.width/2) - (popupWidth / 2);
	var popupY= (window.screen.height/2) - (popupHeight / 2);	

	window.open('http://localhost:9000/daangn/product_price.do', 'window', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY + ', scrolbars = no ');

});

$(document).ready(function(){
	$("#report").click(function(){
		alert("신고가 접수되었습니다.");
	});
});


</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<section class = "p_w_content">
	<div class = "content">
		<!-- content  -->
		<!-- 캐러셀 시작 -->
		<div class = "carousel">
		<div id="demo" class="carousel slide" data-ride="carousel">
	
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		  <c:choose>
		  	<c:when test = "${vo.psfile ne null }">
			    <div class="carousel-item active">
			      <img src="http://localhost:9000/daangn/pro_upload/${vo.psfile}" alt="Los Angeles" width="450" height="500">
			    </div>
		    </c:when>
		    <c:otherwise>
			    <div class="carousel-item active">
			      <img src="http://localhost:9000/daangn/pro_img/noimage.png" alt="Los Angeles" width="450" height="500">
			    </div>
		    </c:otherwise>
		   </c:choose> 
		    <div class="carousel-item">
		      <img src="http://localhost:9000/daangn/pro_img/noimage.png" alt="Chicago" width="450" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="http://localhost:9000/daangn/pro_img/noimage.png" alt="New York" width="450" height="500">
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
		</div>
		
		<!-- 캐러셀 종료 -->
		<!-- 내용 section -->
		<section class = "p_content">
			<div class = profile>
				<img src = "http://localhost:9000/daangn/pro_img/profile_icon.png">
				<div>
					<a href = "#"><span>바니바니바니</span></a>
					<span>${vo.location}</span>
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
				<h1>${vo.ptitle}</h1>
				<span>${vo.category } ∙ ${vo.pdate}</span><br>
				<h3>${vo.price }원</h3>
				<!-- 가격제안 가능시 선택 가능한 버튼으로 (클릭시 메시지 전달)-->
				<c:choose>
					<c:when test = "${vo.pchoice == 0}">
						<button type = "button" class = "btn_no" disabled>가격제안 불가</button>
					</c:when>
					<c:otherwise>
						<button type = "button" class = "btn_yes" id = "btn_price">가격제안하기</button>
					</c:otherwise>
				</c:choose>
				<p>${content}</p>
				<span>채팅 ${vo.chat} ∙ 관심 ${vo.favorite} ∙ 조회 ${vo.phit}</span>
				<div class = "update_click">
					<a href = "http://localhost:9000/daangn/product_update.do?pid=${pid}&rno=${rno}">수정하기</a>
					<a href = "http://localhost:9000/daangn/product_delete.do?pid=${pid}&rno=${rno}">삭제하기</a>
					<a href = "#" id = "report">신고하기</a>
				</div>
			</div>
			<div class = "content_button">
				<button class = "heart_button">♡</button>
				<!-- 팔렸으면 버튼 disabled -->
				<c:choose>
					<c:when test = "${vo.saled eq 'N'}">
						<button type = "button" class = "btn_confrim">채팅으로 거래하기</button>
					</c:when>	
					<c:otherwise>
						<button type = "button" class = "btn_sold" disabled>채팅으로 거래하기</button>
					</c:otherwise>
				</c:choose>	
			</div>
			<div>
				<section class = "plist_r">
					<div class = "content">
						<div class = "content_t">
							<span>바니바니바니님의 판매 상품</span>
							<!-- 마이페이지로 이동 -->
							<a href = "http://localhost:9000/daangn/product_more.do"><span>더보기</span></a>
						</div>
						<c:forEach var = "userlist" items = "${ulist}">
						<ul>
							<c:choose>
								<c:when test = "${userlist.psfile ne null}">
									<li><img src = "http://localhost:9000/daangn/pro_upload/${userlist.psfile}" class = "item"></li><!-- 사진 -->
								</c:when>
								<c:otherwise>
									<li><img src = "http://localhost:9000/daangn/pro_img/noimage.png" class = "item"></li><!-- 사진 -->
								</c:otherwise>
							</c:choose>
								<li><a href = "product_content.do?pid=${userlist.pid}&rno=${userlist.rno}"><span class = "prod_t">${userlist.ptitle}</span></a></li><!-- 이름 -->
								<li>${userlist.location}</li><!-- 주소 -->
								<li>${userlist.price}원</li><!-- 가격 -->
								<li><img src = "http://localhost:9000/daangn/pro_img/hearticon.PNG"><span>${userlist.favorite}</span></li>
						</ul>
						</c:forEach>
					</div>
				</section>	
			</div>
		</section>
			
		<!-- 중고 추천 section -->
		<section class = "plist_r">
			<div class = "content">
				<div class = "content_t">
					<span>당근마켓 인기중고</span>
					<a href = "http://localhost:9000/daangn/product.do"><span>더 구경하기</span></a>
				</div>
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
		</section>
	</div><!-- div.content -->
	</section>
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>