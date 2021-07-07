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
		$("#btn_hp").click(function(){
			$("#certify").show();
		});
		$("#btn_certify").click(function(){
			$("#certify_result").text("인증번호가 일치합니다.").css({"color":"blue"});
			$("#btn_submit").attr("class","carrot_btn").prop("disabled",false);
		});
	});
</script>
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
	회원정보에 등록한 휴대전화 번호를 입력한 후, 본인 인증을 진행해 주세요.
	</div>
	<div class="inputs">
		<input type="text" id="hp" name="hp" class="input_short" placeholder="등록한 휴대폰 번호">
		<button type="button" id="btn_hp" name="btn_hp" class="carrot_btn">인증번호 전송</button>
		<div class="certify" id="certify">
			<span class="small_text">입력하신 번호로 인증번호가 발송되었습니다.</span>
			<input type="text" id="certify_num" name="certify_num" class="input_short" placeholder="인증번호 입력">
			<button type="button" id="btn_certify" name="btn_certify" class="carrot_btn">확인</button>
			<span class="certify_result" id="certify_result"></span>
		</div>
	</div>
	<div class="button">
		<a href="changePass.do"><button type="button" class="btn_submit" id="btn_submit" disabled>비밀번호 찾기</button></a>
	</div>
</form>
</section>
</body>
</html>