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
					<a href = "http://localhost:9000/daangn/product_content.do?pid=${pid}&rno=${rno}"><button type = "button" class = "btn_back">←</button></a>
					<span>${name}님의 판매 상품 보기</span>
						<div class = "more_menu">
						<a href = "http://localhost:9000/daangn/product_more.do?id=${id}&pid=${pid}&rno=${rno}"><button type = "button" class = "btn_filter_onclick">전체</button></a>
						<a href = "http://localhost:9000/daangn/product_more_sale.do?id=${id}&pid=${pid}&rno=${rno}"><button type = "button" class = "btn_filter">거래중</button></a>
						<a href = "http://localhost:9000/daangn/product_more_saled.do?id=${id}&pid=${pid}&rno=${rno}"><button type = "button" class = "btn_filter">거래완료</button></a>
					</div>
				</div>
				<c:forEach var = "userlist" items = "${ulist}">
					<c:choose>
						<c:when test = "${userlist.saled eq 'N'}">
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
						</c:when>
						<c:otherwise>
							<ul class = "sold">
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
						</c:otherwise>
					</c:choose>	
				</c:forEach>
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