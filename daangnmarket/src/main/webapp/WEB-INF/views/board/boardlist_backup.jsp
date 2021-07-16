<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.spring.dao.BoardDAO, com.spring.vo.BoardVO, java.util.*"%>
<%
	BoardDAO dao = new BoardDAO();
	
	//페이징 처리 - startCount, endCount 구하기
	int startCount = 0;
	int endCount = 0;
	int pageSize = 10; //한페이지당 게시물 수
	int reqPage = 1; //요청페이지	
	int pageCount = 1; //전체 페이지 수
	int dbCount = dao.execTotalCount(); //DB에서 가져온 전체 행수
	
	ArrayList<BoardVO> list = dao.getList(startCount, endCount);
%>
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
	href="http://localhost:9000/daangn/resources/css/bootstrap.min.css">
<!-- 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 -->
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/daangn/js/bootstrap.min.js"></script>
<style>
div.bottom {
	text-align: right;
	display: block;
	width: 100%;
}
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
				<thead>
					<tr>
						<th scope="col">카테고리</th>
						<th scope="col">내용</th>
						<th scope="col">ID</th>
						<th scope="col">동네</th>
						<th scope="col">올라온시간</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (BoardVO vo : list) {
					%>
					<tr>
						<td><%=vo.getCategory()%></td>
						<td><%=vo.getContent()%></td>
						<td><%=vo.getId()%></td>
						<td><%=vo.getTown()%></td>
						<td><%=vo.getWdate()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<div class="bottom">
			<button type="button" id="wrtie_btn" class="carrot_btn">글쓰기</button>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>