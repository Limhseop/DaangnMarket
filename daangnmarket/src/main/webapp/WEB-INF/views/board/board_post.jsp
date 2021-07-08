<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근마켓</title>
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/commons.css">
<link rel="stylesheet"
	href="http://localhost:9000/daangn/resources/css/bootstrap.min.css">
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/daangn/js/bootstrap.min.js"></script>
<style>
div.townlife_choice {
	width: auto;
	background-color: lightgray;
	display: inline-block;
}

div.comment {
	border: 1px solid lightgray;
}

div#profile_info {
	display: inline-block;
}

div.nickname {
	font-weight: bold;
}

span.nickname {
	font-weight: bold;
}

div.profile_picture {
	margin: 0; width : 50px;
	height: 50px;
	display: inline-block;
	border: 1px solid black;
	width: 50px;
}

div.writer_content {
	width: 100%;
	height: 300px;
	border: 1px solid lightgray;
}

div.comment_write {
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="content">
		<div class="top mt-3 mb-3">
			<div class="townlife_choice">우리동네질문</div>
			<span style="float: right;">
				<button type="button" class="carrot_btn" style="height: 30px;">수정하기</button>
				<button type="button" class="carrot_btn" style="height: 30px;">삭제하기</button>
			</span>
		</div>
		<div id=writer_profile class="input-group mb-2">
			<div class="profile_picture input-group-prepend"
				style="background-image: url(); background-size: 100%; background-repeat: no-repeat;">이미지</div>
			<div id="profile_info" class="ml-2">
				<div class="nickname">닉네임</div>
				<div>봉천동 ㆍ 1초 전</div>
			</div>
		</div>
		<div class="writer_content">글내용</div>
		<div class="comment">
			<div class="comment_write">
				<input type="text" style="width: 95%;">
				<button type="button" class="carrot_btn" style="height: 30px;">작성</button>
			</div>
			<div class="input-group">
				<div class="input-group-prepend">
					<div class="input-group-text">
						<input type="radio" value="old" name="old">등록순&nbsp; <input
							type="radio" value="latest" name="latest" checked>최신순
					</div>
				</div>
			</div>
			<div>
				<div id=personal_comment class="mt-3">
					<div id=commenter_profile class="input-group">
						<div class="profile_picture input-group-prepend"
							style="background-image: url(); background-size: 100%; background-repeat: no-repeat;">프로필
							사진</div>
						<div id="profile_info" class="ml-2">
							<div>
								<span class="nickname">닉네임</span> <span>작성자</span>
							</div>
							<div>봉천동 ㆍ 1초전</div>
						</div>
					</div>
					<div>댓글~~~~</div>
					<button type="button" class="carrot_btn" style="height: 30px;">좋아요</button>
					<button type="button" class="carrot_btn" style="height: 30px;">신고하기</button>
					<button type="button" class="carrot_btn" style="height: 30px;">삭제하기</button>
				</div>
				<div id=personal_comment class="mt-3">
					<div id=commenter_profile class="input-group">
						<div class="profile_picture input-group-prepend"
							style="background-image: url(); background-size: 100%; background-repeat: no-repeat;">프로필
							사진</div>
						<div id="profile_info" class="ml-2">
							<div>
								<span class="nickname">닉네임</span> <span>작성자</span>
							</div>
							<div>봉천동 ㆍ 1초전</div>
						</div>
					</div>
					<div>댓글~~~~</div>
					<button type="button" class="carrot_btn" style="height: 30px;">좋아요</button>
					<button type="button" class="carrot_btn" style="height: 30px;">신고하기</button>
					<button type="button" class="carrot_btn" style="height: 30px;">삭제하기</button>
				</div>
				<div id=personal_comment class="mt-3">
					<div id=commenter_profile class="input-group">
						<div class="profile_picture input-group-prepend"
							style="background-image: url(); background-size: 100%; background-repeat: no-repeat;">프로필
							사진</div>
						<div id="profile_info" class="ml-2">
							<div>
								<span class="nickname">닉네임</span> <span>작성자</span>
							</div>
							<div>봉천동 ㆍ 1초전</div>
						</div>
					</div>
					<div>댓글~~~~</div>
					<button type="button" class="carrot_btn" style="height: 30px;">좋아요</button>
					<button type="button" class="carrot_btn" style="height: 30px;">신고하기</button>
					<button type="button" class="carrot_btn" style="height: 30px;">삭제하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>