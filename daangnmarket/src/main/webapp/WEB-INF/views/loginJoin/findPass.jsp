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
<form name="findPass" action="#" method="post" class="form_find">
	<div class="notice">
	비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없습니다.<br>
	본인 확인을 통해 비밀번호를 재설정 하실 수 있습니다.<br>
	</div>
	<div class="intro">
	가입한 이름과 아이디를 입력해 주세요.
	</div>
	<div class="inputs">
		<input type="text" id="name" name="name" class="find_input" placeholder="이름">
		<input type="text" id="id" name="id" class="find_input" placeholder="아이디">
	</div>
	<div class="button">
		<a href="findPassHp.do"><button type="button" class="carrot_btn" id="btn_find">다음</button></a>
	</div>
</form>
</section>
</body>
</html>