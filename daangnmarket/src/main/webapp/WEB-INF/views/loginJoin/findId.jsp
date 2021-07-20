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
		if($("#phone").val()==""){
			$("#phone_check").text("휴대폰 번호를 입력해주세요");
		}else{
			findId.submit();
		}
	});
	
});
</script>
</head>
<body>
<section class="findIdPass">
<h1 class="title">아이디 찾기</h1>
<form name="findId" action="findIdResult.do" method="post" class="form_find">
	<div class="intro">회원정보에 등록한 휴대전화 번호를 입력해 주세요.</div>
	<div class="inputs">
		<input type="text" id="phone" name="phone" class="find_input" placeholder="등록한 휴대폰 번호">
		<div class="div_check" id="phone_check"></div>
	</div>
	<c:if test="${result.equals('fail') }">
		<div class="notice_div">
			<span class="notice_message">해당 번호의 아이디가 없습니다.</span>
		</div>
	</c:if>
	<div class="button">
		<button type="button" class="carrot_btn" id="btn_find">아이디 찾기</button>
	</div>
</form>
</section>
</body>
</html>