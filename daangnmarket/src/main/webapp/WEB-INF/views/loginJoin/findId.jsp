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
<h1 class="title">아이디 찾기</h1>
<form name="findId" action="#" method="post" class="form_find">
	<div class="intro">회원정보에 등록한 이름과 휴대전화 번호를 입력해 주세요.</div>
	<div class="inputs">
		<input type="text" id="name" name="name" class="find_input" placeholder="이름">
		<input type="text" id="hp" name="hp" class="find_input" placeholder="등록한 휴대폰 번호">
	</div>
	<div class="button">
		<a href="findIdResult.do"><button type="button" class="carrot_btn" id="btn_find">아이디 찾기</button></a>
	</div>
</form>
</section>
</body>
</html>