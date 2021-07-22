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
	/*****
		팝업창 띄우기
	*****/
	
	function idPop(){
		window.open("findId.do","","width = 500, height = 500, top = 25, left = 800")
	}
	function passPop(){
		window.open("findPass.do","","width = 500, height = 500, top = 25, left = 800")
	}
	
$(document).ready(function(){
	$("#btn_id").click(function(){
		idPop();
	});
	$("#btn_pass").click(function(){
		passPop();
	});
});
	
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<section class="page">
	<div class = "content">
		<section class = "findInfo">
				<h1>아이디/비밀번호 찾기</h1>
				<span>등록된 휴대폰 번호로 아이디를 찾거나 비밀번호를 재설정할 수 있습니다.</span>
			<div class="buttons">
				<button type="button" class="carrot_btn" id="btn_id">아이디 찾기</button>	
				<button type="button" class="carrot_btn" id="btn_pass">비밀번호 재설정</button>	
			</div>	
		</section>
		
	</div>
	</section>

<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
	
	
</body>
</html>