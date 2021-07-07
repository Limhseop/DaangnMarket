<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근마켓</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/loginJoin.css">
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/commons.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<body>
<section class="findIdPass">
<h1 class="title">비밀번호 찾기</h1>
<form name="setNewPass" action="#" method="post" class="form_find">
	<div class="intro">비밀번호를 재설정해 주세요.</div>
	<div class="inputs">
		<input type="password" name="pass" id="pass" class="find_input" placeholder="새 비밀번호 입력">
		<input type="password" name="pass" id="pass" class="find_input" placeholder="비밀번호 확인">
	</div>
	<div class="button">
		<a href="findPassResult.do"><button type="button" class="carrot_btn" id="btn_login">확인</button></a>
	</div>
</form>
</section>
</body>
</html>