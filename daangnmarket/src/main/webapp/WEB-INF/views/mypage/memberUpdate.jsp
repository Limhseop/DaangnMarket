<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#memberUpdate").click(function(){
			$("#memberUpdate").css("background-color","#0275d8");
			$("#memberUpdate").css("color","white");
			
			$(".inputText").attr("disabled",false);
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<br><br><br><br>
	<div class="section" style="margin:100px 0px;">
		
		<div class="container table-responsive" style="width:30%">
			<table class="table table-condensed">
			    <tbody>
			      <tr>
			        <td style="width:80px;">아이디</td>
			        <td><input type="text" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>이름</td>
			        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>성별</td>
			        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>이메일</td>
			        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>휴대폰</td>
			        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>주소</td>
			        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>상세주소</td>
			        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
			      </tr>
			      <tr>
			        <td>가입일</td>
			        <td><input type="text" disabled style="width:300px;"></td>
				  </tr> 		
			    </tbody>
	  		</table>
			    <button type="button" id="memberUpdate" class="btn" style="border:1px solid #333;margin-left:150px;">회원정보수정</button>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>