<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	
	$("#category").change(function(){
		if($(this).val() == "choice"){
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
			<section class = "content_search2">
			
				<!-- 내 근처 위치를 잡아서 필터링/DB에 저장된 주소에 따라 필터링/체크박스에 따라 필터링  -->
				<form name = "search_form" action = "http://localhost:9000/daangn/product_search_proc.do" method = "post">
					<select class = "pro_select" id = "category" name = "category">
						<option value = "choice">선택</option>
						<option value = "state">지역</option>
						<option value = "product">물품</option>
					</select>
					<input type = "text" class = "search" placeholder = "동네이름, 물품명 등을 검색해보세요!" id = "search" name = "search">
					<button type = "button" class = "carrot_btn" id = "search_button">검색</button>
				</form>
				
				<div class = "message">
					<span>전국민이 이용하는 당근마켓!</span>
					<span>물품을 검색하시고 우리동네에서 거래하세요</span>
				</div>
				<div class = "pro_button">
					<a href = "http://localhost:9000/daangn/product_register.do?id=${sessionScope.svo.id}"><button type = "button" class = "btn_confrim">중고거래 올리기</button></a>
				</div>
			</section>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>