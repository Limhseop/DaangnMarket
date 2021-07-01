<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/practice/member.css">
</head>
<body>
<div class="content">
	<form name="join_form" class="join_form" id="join_form">
		<input type="text" class="input" id="id" placeholder="아이디">
		<div class="div_check" id="id_check"></div>
		<input type="password" class="input" id="pass" placeholder="비밀번호">
		<input type="password" class="input" id="pass" placeholder="비밀번호 확인">
		<div class="div_check" id="pass_check"></div>
		<input type="text" id="name" class="input" placeholder="이름">
		<input type="text" id="email" class="input" placeholder="이메일 주소">
		<span id="line">
		<input type="text" id="phone" class="input_phone" placeholder="휴대폰 번호">
			<button type="button" id="certify">인증하기</button>
		</span>
 		<div id="buttons" class="buttons">
			<button type="button" id="submit_btn" class="carrot">제출하기</button>
		</div>
	</form>
</div>
</body>
</html>