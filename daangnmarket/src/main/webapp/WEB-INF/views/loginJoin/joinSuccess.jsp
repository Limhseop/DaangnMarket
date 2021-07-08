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
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<section class="page">
	<div class = "content">
		<section class = "joinSuccess">
				<h1>회원가입 성공</h1>
			<div>	
				<span>당근마켓 회원이 되신 걸 환영합니다.</span><br>
				<span>로그인 하시고 당근마켓을 둘러보세요!</span>
			</div>	
			<div>
				<a href = "http://localhost:9000/daangn/index.do"><button type = "button" class = "gray_btn">홈으로</button></a>
				<a href = "login.do"><button type = "button" class = "carrot_btn">로그인하기</button></a>
			</div>
		</section>
		
	</div>
	</section>

<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
	

</body>
</html>