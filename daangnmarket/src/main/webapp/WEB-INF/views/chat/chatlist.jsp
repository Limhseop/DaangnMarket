<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근채팅</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/commons.css">
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/chat.css">
</head>
<body>
<section class="page">
	<section class="chat">
		<div class="left_side">
			<div class="name_div">
			<h1>나남</h1>
			</div>
			<div class="second_div">
				<button type="button" class="unread_message" id="unread_message">안읽은 메시지만 보기</button>
			</div>
			<div class="chat_list_div">
				<ul class="chat_list_ul">
					<li class="chat_list_li">
						<div class="chat_list_li_div">
							<div class="chat_list_li_top">
								<span class="chat_profile"><img src="http://localhost:9000/daangn/resources/images/daangn_profile.jpg" class="img_profile"></span>
								<span class="chat_name">당근이</span>
								<span class="chat_list_date">송정동, 07월 11일</span>
							</div>
							<span class="chat_list_content">안녕하세요. 혹시 제품 아직 구...</span>
						</div>
						<img src="http://localhost:9000/daangn/resources/images/daangn_img.png" class="product_img">
					</li>
				</ul>
			</div>
		</div>
		<div class="right_side">
			<div class="name_div">
			<span class="chat_profile"><img src="http://localhost:9000/daangn/resources/images/daangn_profile.jpg" class="img_profile"></span>
			<h1>직거래꾼</h1>
			<span class="chat_temperature">36.5℃</span>
			</div>
			<div class="name_div">
			<img src="http://localhost:9000/daangn/resources/images/daangn_img.png" class="product_img">
				<div class="chat_item_div">
					<span class="title">PC게임패드 팝니다</span>
					<span class="price">15,000원</span>
				</div>
				<div class="sale_status">판매중</div>
			</div>
			<div class="chat_content_div">
				<div class="date">2020년 6월 13일</div>
				<div class="other_chatlog">
					<span class="profile"><img src="http://localhost:9000/daangn/resources/images/daangn_profile.jpg" class="img_profile"></span>
					<span class="word">125000원 가능하신가요?</span>
					<span class="date">오후 6:21</span>
				</div>
				<div class="my_chatlog">
					<span class="word">다른분에게 120000원에 구매하기로 했습니다 ㅠㅠ</span>
					<span class="date">오후 6:26</span>
				</div>
			</div>
			<form id="sendmessage_form" name="sendmessage_form" class="sendmessage_form">
				<div class="input_text_div">
				<div class="buttons_left">
					<button>그림</button>
					<button>이모티콘</button>
				</div>
				<div class="buttons_right">
					<span class="text_count">0/1000</span>
					<button type="button">전송</button>
				</div>
				<textarea id="text_message" name="text_message" class="text_message" placeholder="메시지를 입력해주세요"></textarea>
				</div>
			</form>
		</div>
	</section>
</section>
</body>
</html>