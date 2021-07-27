<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.spring.vo.BoardVO.*, com.spring.dao.BoardDAO.*, java.util.*, com.spring.commons.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 -->
<title>당근마켓</title>
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/commons.css">
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/am-pagination.css">
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/bootstrap.min.css">
<!-- 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 -->
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/daangn/js/am-pagination.js"></script>
<script src="http://localhost:9000/daangn/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#buttons").click(function(){
		alert("버튼들 클릭됨");
	});
	
	/* var pager = jQuery('#ampaginationsm').pagination({
	
	    maxSize: 7,	    		// max page size
	    totals: ${dbCount},	// total pages	
	    page: ${rpage},		// initial page		
	    pageSize: ${pageSize},			// max number items per page
	
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/mycgv/board_list.do?rpage="+e.page);         
    }); */
	
	});
</script>
<style>
div.bottom {
	text-align: right;
	display: block;
	width: 100%;
}
/* div.bottom a {
	font-color: #212529;
}
div.bottom a:hover {
	 text-decoration: none;
} */
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="content">
		<div class="top mt-3">
			<div class="buttons" id="buttons">
				<button type="button" id="together_btn" class="carrot_btn">같이해요</button>
				<button type="button" id="hometown_btn" class="carrot_btn">우리동네질문</button>
				<button type="button" id="plz_btn" class="carrot_btn">해주세요</button>
				<button type="button" id="restaurant_btn" class="carrot_btn">동네맛집</button>
				<button type="button" id="life_btn" class="carrot_btn">일상</button>
				<button type="button" id="lost_btn" class="carrot_btn">분실/실종센터</button>
				<button type="button" id="accident_btn" class="carrot_btn">동네사건사고</button>
				<button type="button" id="hobby_btn" class="carrot_btn">취미생활</button>
				<button type="button" id="cat_btn" class="carrot_btn">고양이</button>
				<button type="button" id="interior_btn" class="carrot_btn">인테리어</button>
				<button type="button" id="edu_btn" class="carrot_btn">교육/학원</button>
				<button type="button" id="picture_btn" class="carrot_btn">동네사진전</button>
				<button type="button" id="baby_btn" class="carrot_btn">출산/육아</button>
				<button type="button" id="other_btn" class="carrot_btn">기타</button>
				<button type="button" id="lifebeing_btn" class="carrot_btn">살림</button>
				<button type="button" id="health_btn" class="carrot_btn">건강</button>
				<button type="button" id="puppy_btn" class="carrot_btn">강아지</button>
				<button type="button" id="news_btn" class="carrot_btn">동네소식</button>
			</div>
		</div>
		<div>
			<table class="table mt-3">
				<tr>
					<th scope="col">카테고리</th>
					<th scope="col">내용</th>
					<th scope="col">ID</th>
					<th scope="col">동네</th>
					<th scope="col">날짜</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.category }</td>
						<td><a href="board_post.do?no=${vo.no }" style="color:orange;text-decoration:none;">${vo.content }</a></td>
						<td>${vo.id }</td>
						<td>${vo.town }</td>
						<td>${vo.wdate }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan=4><div id="ampaginationsm"></div></td>
				</tr>
			</table>
		</div>
		<div class="bottom">
			<a href="board_add.do"><button type="button" id="wrtie_btn"
					class="carrot_btn">글쓰기</button></a>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>