<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
	$("#btn_find").click(function(){
		if($("#id").val()==""){
			$("#id_check").text("아이디를 입력해주세요");
		}else{
			findPass.submit();
		}
	});
	
});
</script>
</head>
<body>
<section class="findIdPass">
<h1 class="title">비밀번호 재설정</h1>
<form name="findPass" action="findPassHp.do" method="post" class="form_find">
	<div class="notice">
	비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없습니다.<br>
	본인 확인을 통해 비밀번호를 재설정 하실 수 있습니다.<br>
	</div>
	<div class="intro">
	가입한 아이디를 입력해 주세요.
	</div>
	<div class="inputs">
		<input type="text" id="id" name="id" class="find_input" placeholder="아이디">
		<div class="div_check" id="id_check"></div>
	</div>
	<c:if test="${result.equals('fail') }">
		<div class="notice_div">
			<span class="notice_message">일치하는 아이디가 없습니다.</span>
		</div>
	</c:if>
	<div class="button">
		<button type="button" class="carrot_btn" id="btn_find">다음</button>
	</div>
</form>
</section>
</body>
</html>