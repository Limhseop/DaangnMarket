<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근마켓</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/commons.css">
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/loginJoin.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.6.0.min.js"></script>
<script>
	function setCookie(cname, cvalue, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate()+exdays);
		var expires = "expires="+exdate.toUTCString();
		document.cookie = cname+"="+cvalue+";"+expires+";";
	}
	
	function getCookie(cname){
		var name = cname+"=";
		var cookieData = document.cookie;
		var start=cookieData.indexOf(name);
		var cValue="";
		if(start!=-1){
			start+= name.length;
			var end=cookieData.indexOf(';',start);
			if(end==-1) end=cookieData.length;
			cValue=cookieData.substring(start,end);
		}
		
		return cValue;
	}

	$(document).ready(function(){
		var id=getCookie("id");
		if(id!=""){	//아이디 저장이 된 경우
			$("#id").val(id);
			$("#pass").focus();
			$("#saveID").prop("checked",true);
		}else{
			$("#id").focus();
		}
		
		$("#login_btn").click(function(){
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
			}else if($("#pass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
			}else{
				if($("#saveID").is(':checked')){	//아이디 저장 여부
					setCookie("id",$("#id").val(),30);
				}else{
					setCookie("id","",30);
				}
				login_form.submit();
			}
		});
	});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- content -->
<section class="page">
	<div id="content" class="content">
		<div class="title">
			<img src="http://localhost:9000/daangn/resources/images/logo.svg">
		</div>
		<form name="login_form" action="login_check.do" method="post" id="login_form" class="login_form">
			<div id="input" class="input">
				<input type="text" id="id" name="id" class="input" placeholder="아이디를 입력하세요.">
				<input type="password" id="pass" name="pass" class="input" placeholder="비밀번호를 입력하세요.">
			</div>
			<c:if test="${result.equals('fail') }">
				<div class="notice_div">
				<span class="notice_message">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</span>
				</div>
			</c:if>
			<div id="besides" class="besides">
				<span class="first">
				<input type="checkbox" id="saveID" class="saveID" name="saveID" value="saveID">
				<label for="saveID">아이디 저장</label>
				</span>
				<span class="second">
				<a href="findInfo.do">아이디/비밀번호 찾기</a>
				</span>	
			</div>
			<div id="buttons" class="buttons">
				<button type="button" id="login_btn" class="carrot_btn">로그인</button>
				<a href="join.do"><button type="button" id="join_btn" class="carrot_btn">회원가입</button></a>
			</div>
		</form>
	</div>
</section>
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>