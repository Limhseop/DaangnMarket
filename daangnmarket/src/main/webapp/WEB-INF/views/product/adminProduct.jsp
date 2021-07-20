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
	$("#search_button").click(function(){
		if($("#category").val != "choice"){
			if($("#search").val() == ""){
				alert("검색 데이터를 입력해주세요");
				return false;
			}else{
				search_form.submit();
			}
		}else{
			search_form.submit();
		}
	});	
	
	$("#re_search").click(function(){
		$("#search").focus();
	});
	
	$("#category").change(function(){
		if($(this).val() == "total"){
			$("#search").val("");
		}
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
				<form name = "search_form" action = "http://localhost:9000/daangn/product_search_proc.do" method = "post">
					<select class = "pro_select" id = "category" name = "category">
						<option value = "choice">선택</option>
						<option value = "state">지역</option>
						<option value = "product">물품</option>
					</select>
					<input type = "text" class = "search" placeholder = "동네이름, 물품명 등을 검색해보세요!" id = "search" name = "search">
					<button type = "button" class = "carrot_btn" id = "search_button">검색</button>
					<a href = "http://localhost:9000/daangn/product_register.do?id=${sessionScope.svo.id}"><button type = "button" class = "btn_confrim">삭제하기</button></a>
				</form>
				<div class = "message">
					<span>${search}를 검색하고 있어요!</span><!-- 검색하면 검색한 지역명 보이도록 -->
					<span>다른 검색 내용을 찾으셨나요?</span>
				</div>
				<!-- <span>추천  잠실 냉장고 분당 유모차 자전거 키즈카페 강남 명품가방 홍대 쇼파</span> -->
				<!-- 물품을 검색하면 관련 추천 검색어가 뜨도록 -->
			</section>
			<c:choose>
			<c:when test = "${!empty list}">
				<!-- 검색 결과 보여주는 리스트 -->
				<div class = "content">
				<div style = "text-align:left; width:90%; margin:auto;">
				<c:forEach var = "plist" items = "${list}">
					<ul>
						<li><input type = "checkbox" name = "ptotal" id = "all" value = "all"></li>
					</ul>
					<ul style = "display:block;">
						<!-- ??? 저기 value 왜 값이 안 적혀 있는지 -->
						<li><input type = "checkbox" name = "ptotal" id = "part" value = ""></li>
						<c:choose>
							<c:when test = "${plist.psfile ne null}">
								<li><img src = "http://localhost:9000/daangn/pro_upload/${plist.psfile}" class = "item"></li><!-- 사진 -->
							</c:when>
							<c:otherwise>
								<li><img src = "http://localhost:9000/daangn/pro_img/noimage.png" class = "item"></li><!-- 사진 -->
							</c:otherwise>
						</c:choose>
						<li><a href = "product_content.do?pid=${plist.pid}&rno=${plist.rno}"><span class = "prod_t">${plist.ptitle}</span></a></li><!-- 이름 -->
						<li>${plist.location}</li><!-- 주소 -->S
						<li>${plist.report}원</li><!-- 신고횟수 -->
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
			</c:when>
			<c:otherwise>
				<section class = "no_data"><!-- 검색 결과가 없을때 띄우는 창 -->
					<div class = "content_nodata">
						<p>'${search}'에 대한 검색 결과가 없어요.<br>
						검색어를 다시 확인해주세요!</p>
						<span id = "re_search">다시 검색하기</span>
					</div>
				</section>
		</c:otherwise>
		</c:choose>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>