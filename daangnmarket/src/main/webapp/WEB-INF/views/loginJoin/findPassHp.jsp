<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근마켓</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/loginJoin.css">
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/commons.css">
</head>
<body>
<section class="findIdPass">
<h1 class="title">비밀번호 찾기</h1>
<form name="findPass" action="#" method="post" class="form_findPass">
	<div class="notice">
	비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없습니다.<br>
	본인 확인을 통해 비밀번호를 재설정 하실 수 있습니다.<br>
	</div>
	<div class="intro">
	회원정보에 등록한 이름과 휴대전화 번호를 입력한 후, 본인 인증을 진행해 주세요.
	</div>
	<div class="inputs">
		<input type="text" id="name" name="name" class="find_input" placeholder="이름">
		<input type="text" id="hp" name="hp" class="input_hp" placeholder="등록한 휴대폰 번호">
		<button type="button" id="btn_hp" name="btn_hp" class="carrot_btn">인증번호 전송</button>
	</div>
	<div class="button">
		<a href="findPassResult.do"><button type="button" class="carrot_btn" id="btn_find">비밀번호 찾기</button></a>
	</div>
</form>
</section>
</body>
</html>