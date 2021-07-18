<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/header.css">
<link rel="stylesheet" href="css/product_css.css">
<link rel="stylesheet" href="css/commons.css">
<script src = "http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>\
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(function () {
	    $('#upload_img').click(function (e) {
	        e.preventDefault();
	        $('#input_file').click();
	    });
	});

	$(document).ready(function(){
		
		$("button[name=pricebutton]").click(function(){
			var id = $(this).attr("id");
			
			if(id == "filter"){	
				$(this).attr("id","filter_onclick");
				$(this).removeClass("btn_confrim");
				$(this).addClass("btn_cancle");
				
				alert($("#pchoice").val());
				
			}else if(id == "filter_onclick"){
				$(this).attr("id","filter");
				$(this).removeClass("btn_cancle");
				$(this).addClass("btn_confrim");
				
				alert($("#pchoice").val());
			}	
		
		});
		
		
		$("#confrim").click(function(){
			if($("#ptitle").val() == ""){
				alert("제목을 입력해주세요");
				$("#ptitle").focus();
				return false;
			}else if($("#category").val() == "choice"){
				alert("카테고리를 선택해주세요");
				$("#category").focus();
				return false;
			}else if($("#pcontent").val() == ""){
				alert("내용을 입력해주세요");
				$("#pcontent").focus();
				return false;
		 	}else if($("#price").val() == ""){
				alert("가격을 입력해주세요");
				$("#price").focus();
				return false; 
			}else{
				product_form.submit();
			}
			
		});
		
		
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<section class = "p_register">
		<div class = "content">
			<form name = "product_form" action = "product_register_proc.do" method = "post" enctype = "multipart/form-data">
				<input type = "hidden" name = "id" class = "id" value = "${sessionScope.svo.id}"><!-- 게시글 등록자 아이디  -->
				<ul>
					<li>
						<span>중고거래 글쓰기</span>
					</li>
					<li>
						<input type = "text" placeholder = "글 제목" class = "pro_title" id = "ptitle" name = "ptitle">
					</li>
					<li>
						<select id = "category" name = "category">
							<option value = "choice">카테고리 선택></option>
							<option value = "디지털기기">디지털기기</option>
							<option value = "생활가전">생활가전</option>
							<option value = "가구/인테리어">가구/인테리어</option>
							<option value = "유아동">유아동</option>
							<option value = "유아도서">유아도서</option>
							<option value = "생활/가공식품">생활/가공식품</option>
							<option value = "스포츠/레저">스포츠/레저</option>
							<option value = "여성잡화">여성잡화</option>
							<option value = "여성의류">여성의류</option>
							<option value = "남성패션/잡화">남성패션/잡화</option>
							<option value = "게임/취미">게임/취미</option>
							<option value = "뷰티/미용">뷰티/미용</option>
							<option value = "반려동물용품">반려동물용품</option>
							<option value = "도서/티켓/음반">도서/티켓/음반</option>
							<option value = "식물">식물</option>
							<option value = "기타 중고물품">기타 중고물품</option>
							<option value = "삽니다">삽니다</option>
						</select>
					</li>
					<li>
						<textarea placeholder = "물품에 대한 자세한 정보를 작성하면 판매확률이 올라가요!" class = "r_content" id = "pcontent" name = "pcontent"></textarea>
					</li>
					<li>
						<input type = "number" placeholder = "가격(필수사항)" id = "price" name = "price">
						<button type = "button" class = "btn_cancle" id = "filter" name = "pricebutton">가격제안 받기</button>
						<input type = "hidden" id = "pchoice" name = "pchoice" value = 0>
					</li>
					<li>
						<div class = "pic_icon" id = "picture">
							<!-- <input type = "file" name = "file1" id = "nfile"> -->
							<img src = "http://localhost:9000/daangn/pro_img/camera_icon.png" id = "upload_img">
							<!-- 사진 등록하면 카운트가 올라감 -->
							<span class = "pic_count">0/3</span>
							<!-- 사진업로드 -->
							<input type = "file" id="input_file" name = "pfile1" style = "display:none;">
<!-- 						<input type = "file" id="input_file" name = "file" multiple="multiple" style = "display:none;"> -->
						</div>
					</li>
					<li>	
						<!-- 사진 업로드 시 사진 미리보기가 보이도록 -->
						<span>사진 미리보기</span>
						<div class = "preview">
							<!-- <img src = "http://localhost:9000/daangn/pro_img/pro_img.jpg" width = "100px" height = "100px">
							<button type = "button">X</button> -->
						</div>
					</li>
					<li>
						<span id = "location" value = "${location}">${location} ▽ </span>
<%-- 						<span id = "location">${location} 근처 동네 49개 ▽</span> --%>
					</li>
					<li>
						<a href = "http://localhost:9000/daangn/product.do"><button type = "button" class = "btn_cancle">닫기</button></a>
						<button type = "button" class = "btn_confrim" id = "confrim">완료</button>
					</li>
				</ul>
			</form>
		</div>
	</section>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>