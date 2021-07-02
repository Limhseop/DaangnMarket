<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근마켓</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/sehee/loginJoin.css">
</head>
<body>
<div id="content" class="content">
<form name="login_form" action="#" method="post" id="login_form" class="login_form">
<div id="input" class="input">
	<input type="text" id="id" name="id" class="input" placeholder="아이디를 입력하세요.">
	<input type="password" id="pass" name="pass" class="input" placeholder="비밀번호를 입력하세요.">
</div>
<div id="besides" class="besides">
	<span class="first">
	<input type="checkbox" id="saveID" class="saveID" name="saveID" value="saveID">
	<label for="saveID">아이디 저장</label>
	</span>
	<span class="second">
	<a href="">아이디/비밀번호 찾기</a>
	</span>	
</div>
<div id="buttons" class="buttons">
	<button type="button" id="login_btn" class="carrot_btn">로그인</button>
	<button type="button" id="join_btn" class="carrot_btn">회원가입</button>
</div>
</form>
</div>
</body>
</html>