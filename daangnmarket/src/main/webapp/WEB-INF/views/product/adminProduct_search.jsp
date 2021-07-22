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
	
	
	//전체 선택 & 전체 해제
	$("#all").click(function(){
		var all_check = $("#all").is(":checked");
		
		if(all_check){
			/* true이면 모두 선택 */
			$("input[type = checkbox]").prop("checked", true);
			/* prop는 속성을 바꾸기 위한 것 */
		}else{
			/* false면 모두 해제 */
			$("input[type = checkbox]").prop("checked", false);
		}
	});
	
	//선택삭제 버튼 처리
	$("#btn_delete").click(function(){
		var choice = confirm("정말로 삭제하시겠습니까?");
		/* alert(choice); */
		if(choice){
			//삭제 진행 : 여러개를 담는 그릇(배열)
			var chkList = new Array();
			/* $(선택자).each(function(인덱스 변수){}); */
			$("input[type=checkbox]:checked").each(function(i){
				//체크된 값 중에서 all을 제외하고 배열에 담는다.	인덱스 변수 i(이름 변경 가능)
				//alert($(this).val());
				if($(this).val() != "all"){
					chkList[i] = $(this).val();
				}
				
				});
			
			$(location).attr("href","adminproduct_select_delete_proc.do?chkList="+chkList);
																		// chkList는 자바 스크립트에서 만든 객체이기 때문에 ""밖에 적는다.
		}else{
			
			$("input[type = checkbox]").prop("checked", false);
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
				<form name = "search_form" action = "http://localhost:9000/daangn/adminproduct_search_proc.do" method = "post">
					<select class = "pro_select" id = "category" name = "category">
						<option value = "choice">선택</option>
						<option value = "state">지역</option>
						<option value = "product">물품</option>
					</select>
					<input type = "text" class = "search" placeholder = "동네이름, 물품명 등을 검색해보세요!" id = "search" name = "search">
					<button type = "button" class = "carrot_btn" id = "search_button">검색</button>
					<button type = "button" class = "btn_confrim" id = "btn_delete">삭제하기</button>
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
					<ul>
						<li style = "float:left;"><input type = "checkbox" name = "ptotal" id = "all" value = "all">전체 선택/해제</li>
					</ul>
				<c:forEach var = "plist" items = "${list}">
					<ul style = "display:block; width:95%; height:200px; border:1px solid rgb(233, 236, 239); border-radius:5px; margin-bottom: 10px;">
						<li style = "margin-bottom:10px;"><input type = "checkbox" name = "ptotal" id = "part" value = "${plist.pid}"></li>
						<c:choose>
							<c:when test = "${plist.psfile ne null}">
								<li style = "display: inline-block;"><img src = "http://localhost:9000/daangn/pro_upload/${plist.psfile}" class = "item"></li><!-- 사진 -->
							</c:when>
							<c:otherwise>
								<li style = "display: inline-block;"><img src = "http://localhost:9000/daangn/pro_img/noimage.png" class = "item"></li><!-- 사진 -->
							</c:otherwise>
						</c:choose>
						<div style = "display: inline-block; margin-left:20px; position:relative; bottom:35px;">
							<c:choose>
								<c:when test = "${plist.saled eq 'N' }">
									<li style = "color:blue; font-weight:bold; font-size:20px; margin-bottom:5px;">판매중</li>
								</c:when>
								<c:otherwise>
									<li style = "color:red; font-weight:bold; font-size:20px; margin-bottom:5px;">판매완료</li>
								</c:otherwise>
							</c:choose>
							<li><a href = "product_content.do?pid=${plist.pid}&rno=${plist.rno}"><span class = "prod_t">${plist.ptitle}</span></a></li><!-- 이름 -->
							<li>${plist.location}</li><!-- 주소 -->
							<li>${plist.price}원</li><!-- 가격 -->
							<li style = "color:blue; font-weight:bold;">관심 횟수 : ${plist.favorite }번</li><br>
							<li style = "color:tomato; font-weight:bold; float:left;">신고횟수 : ${plist.report}번</li><!-- 신고횟수 -->
						</div>
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