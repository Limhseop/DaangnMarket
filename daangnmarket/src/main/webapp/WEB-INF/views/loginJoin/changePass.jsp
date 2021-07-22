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
		$("#pass").blur(function(){
			if($("#pass").val()==""){
				$("#div_check").text("비밀번호를 입력해 주세요.");
			}else{
				$("#div_check").text("");
			}
		});
		$("#pass_check").blur(function(){	//비밀번호 확인에서 포커스가 사라질 때
			if($("#pass_check").val()==""){
				$("#div_check").text("비밀번호 확인을 입력해 주세요.");
			}else if($("#pass").val()!=$("#pass_check").val()){	//값 다름
				$("#div_check").text("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			}else{
				$("#div_check").text("");
			}
		});
		
		$("#btn_submit").click(function(){
			if($("#pass").val()==""){
				$("#div_check").text("비밀번호를 입력해 주세요.");
			}else if($("#pass_check").val()==""){
				$("#div_check").text("비밀번호 확인을 입력해 주세요.");
			}else if($("#pass").val()!=$("#pass_check").val()){	//값 다름
				$("#div_check").text("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			}else{
				$("#div_check").text("");
				setNewPass.submit();
			}
		});
	});
</script>
</head>
<body>
<section class="findIdPass">
<h1 class="title">비밀번호 재설정</h1>
<form name="setNewPass" action="findPassResult.do" method="post" class="form_find">
	<input type="hidden" name="id" value="${id }">
	<div class="intro">비밀번호를 재설정해 주세요.</div>
	<div class="inputs">
		<input type="password" name="pass" id="pass" class="find_input" placeholder="새 비밀번호 입력">
		<input type="password" id="pass_check" class="find_input" placeholder="비밀번호 확인">
		<div class="div_check" id="div_check"></div>
	</div>
	<div class="button">
		<button type="button" class="carrot_btn" id="btn_submit">확인</button>
	</div>
</form>
</section>
</body>
</html>