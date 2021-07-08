<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/commons.css">
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/bootstrap.min.css">
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/daangn/js/bootstrap.min.js"></script>
<style>
	div.top_btn {
		text-align:right;
	}
	div.middle {
		border: 1px solid blue;
	}
	div textarea{
		width: 90%;
		height: 500px;
		margin: auto;
	}
</style>
</head>
<body>
	<form>
		<div class="content">
			<div class="top">
				<div class="top_btn" style= "border: 1px solid red;">
					<button type="button" id="complete" class="carrot_btn">완료</button>
				</div>
				<div>
					<select name="hometown">
						<option value="hometown">우리동네질문</option>
						<option value="lost">분실/실종센터</option>
						<option value="accident">동네사건사고</option>
						<option value="together">같이해요</option>
						<option value="plz">해주세요</option>
						<option value="restaurant">동네맛집</option>
						<option value="life">일상</option>
						<option value="news">동네소식</option>
						<option value="hobby">취미생활</option>
						<option value="cat">고양이</option>
						<option value="puppy">강아지</option>
						<option value="health">건강</option>
						<option value="lifebeing">살림</option>
						<option value="interior">인테리어</option>
						<option value="edu">교육/학원</option>
						<option value="picture">동네사진전</option>
						<option value="baby">출산/육아</option>
						<option value="other">기타</option>
					</select>
				</div>
			</div>
			<div class="middle">
				<textarea id="board_content" name="board_content" placeholder="궁금한 것을 물어보세요! 이웃이 친절하게 진짜 정보를 알려줄거에요."></textarea>
			</div>
			<div class="bottom">
				<input type="file" name="file" onchange="fileUpload(this)">
			</div>
		</div>
	</form>
</body>
</html>