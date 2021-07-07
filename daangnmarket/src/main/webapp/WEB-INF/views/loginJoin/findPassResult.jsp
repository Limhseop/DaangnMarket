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
	$(document).ready(function(){
		$("#btn_login").click(function(){
			window.opener.location.replace("login.do");
			window.close();
		});
	});
</script>
</head>
<body>
<section class="findIdPass">
<h1 class="title">아이디 찾기</h1>
<form name="findIdPass" action="#" method="post" class="form_find">
	<div class="intro">입력하신 정보와 일치하는 아이디는 다음과 같습니다.</div>
	<div class="result">
		<span class="intro">김*희님의 아이디는 <span class="id">sadie1**</span>입니다.</span>
	</div>
	<div class="button_two">
		<button type="button" class="carrot_btn" id="btn_login">로그인</button>
	</div>
</form>
</section>
</body>
</html>