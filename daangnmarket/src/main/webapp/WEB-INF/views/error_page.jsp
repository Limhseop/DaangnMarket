<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.content{
	font-family:"맑은고딕";
	width:1000px;
	margin:auto;
	margin-top:150px; 
	
}

div.title{
	border-bottom:2px solid rgb(255, 124, 152);
	text-align:center;
	font-size:19px;
	font-weight:blod;
	color:#333;
	padding-bottom:35px;
}

.btn_cancle, .btn_confrim, .btn_confrim2{
	padding:5px 20px;
	margin: 0 5px;
	background-color:white;
	border:1px solid rgb(128, 128, 161);
	border-radius:4px;
	color: gray;
	font-size:15px;
}
.btn_confrim{
	background-color:gray;
	color:white;
}
.btn_confrim2{
	background-color:lightgray;
	color:gray;
}

div.error{
	text-align:center;
}
div.error div img{
	width:30%;
}

div.error_content{
	margin-bottom:25px;
}

div.error_content span:first-child, div.error_content span:nth-child(2){
	/*color:rgb(148, 135, 128);*/
	color:rgb(128, 128, 161);
	font-size: 20px;
	font-weight:600;
	
}

div.error_content p{
	color:rgb(148, 135, 128);
	font-size:15px;
}

div.error_content span:first-child{
	color:tomato;
}

div.error_content span:last-child{
	color:rgb(128, 128, 161);
	font-size:17px;
	
}

</style>
</head>
<body>
	<div class = "content">
		<div class = "error">
			<div>
				<img src = "http://localhost:9000/daangn/images/logo.svg">
			</div>
			<div class = "error_content">
				<span>죄송합니다.</span>
				<span>요청하신 페이지를 찾을 수 없습니다.</span>
				<p>
					요청하신 페이지를 찾을 수가 없습니다. <br>
					찾으시려는 페이지는 주소를 잘못 입력하였거나 <br>
					페이지 주소의 변경 또는 삭제 등의 이유로 페이지를 찾을수 없습니다.<br>
				</p>
				<span>입력하신 페이지의 주소와 경로가 정확한지 한번 더 확인 후 이용하시기 바랍니다.</span>
			</div>
			<div>
				<a href = "http://localhost:9000/daangn/index.do"><button type = "button" class = "btn_confrim">홈으로 돌아가기</button></a>
			</div>
		</div>
	</div>	
</body>
</html>