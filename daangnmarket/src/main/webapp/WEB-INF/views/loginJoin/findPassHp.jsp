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
	var num;
	var certify_done=-1;
	
	function ajax_phone(phone){	//핸드폰 번호가 일치하는지 알아보는 ajax
		$.ajax({
			url:"phone_num_check_ajax.do?id=${id}&phone="+phone,
			success: function(result){
				var jdata = JSON.parse(result);
				if(jdata.result=="success"){
					$("#certify").show();
					ajax_certify(phone);	//인증번호 전송
				}else{
					$("#phone_check").text("휴대폰 번호가 일치하지 않습니다.");
					$("#phone_check").focus();
				}
			}
		});
	}
	
	function ajax_certify(phone){	//핸드폰 인증 ajax
    	$.ajax({
    		url:"phone_check_ajax.do?phone="+phone,
    		success: function(result){
    			//실행결과에 따른 처리
    			var jdata = JSON.parse(result);
    			if(jdata.result=="success"){
    				num = jdata.number;
    				certify_done++;
    			}else{
    				alert("오류가 발생했습니다. 다시 시도해 주세요.");
    				$("#certify").hide();
    			}
    		}
    	});
    }
	
	
	$(document).ready(function(){
		$("#btn_hp").click(function(){		//인증번호 전송 버튼 누를시
			if($("#phone").val()==""){
				$("#phone_check").text("휴대폰 번호를 입력하세요");
				$("#phone_check").focus();
			}else{
				$("#phone_check").text("");
				if(certify_done==-1){
					ajax_phone($("#phone").val());
				}else{
					var r = confirm("이전에 전송했던 인증번호는 무효화됩니다. 다시 전송하시겠습니까?");
					if(r==true){
						ajax_phone($("#phone").val());
					}
				}
			}
		});
		
		$("#btn_certify").click(function(){			//확인 버튼 누를시
			if($("#certify_num").val()==""){
				$("#certify_result").text("인증번호를 입력해 주세요.");
			}else if($("#certify_num").val()!=num){	//인증번호 불일치
				$("#certify_result").text("인증번호가 일치하지 않습니다. 다시 입력해 주세요.");
				$("#certify_num").focus();
			}else{		//인증번호 일치
				$("#certify_result").text("인증번호가 일치합니다.").css({"color":"blue"});
				$("#btn_hp").prop("disabled",true);
				$("#btn_certify").prop("disabled",true);
				$("#btn_submit").attr("class","carrot_btn").prop("disabled",false);
			}
		});
		
		$("#btn_submit").click(function(){		//비밀번호 재설정 버튼 누를시
			findPass.submit();
		});
		
	});
</script>
</head>
<body>
<section class="findIdPass">
<h1 class="title">비밀번호 재설정</h1>
<form name="findPass" action="changePass.do" method="post" class="form_findPass">
	<input type="hidden" name="id" value="${id }">
	<div class="notice">
	비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없습니다.<br>
	본인 확인을 통해 비밀번호를 재설정 하실 수 있습니다.<br>
	</div>
	<div class="intro">
	회원정보에 등록한 휴대전화 번호를 입력한 후, 본인 인증을 진행해 주세요.
	</div>
	<div class="inputs">
		<input type="text" id="phone" name="phone" class="input_short" placeholder="등록한 휴대폰 번호">
		<button type="button" id="btn_hp" name="btn_hp" class="carrot_btn">인증번호 전송</button>
		<div class="div_check" id="phone_check"></div>
		<div class="certify" id="certify">
			<span class="small_text">입력하신 번호로 인증번호가 발송되었습니다.</span>
			<input type="text" id="certify_num" name="certify_num" class="input_short" placeholder="인증번호 입력">
			<button type="button" id="btn_certify" name="btn_certify" class="carrot_btn">확인</button>
			<span class="certify_result" id="certify_result"></span>
		</div>
	</div>
	<div class="button">
		<button type="button" class="btn_submit" id="btn_submit" disabled>비밀번호 재설정</button>
	</div>
</form>
</section>
</body>
</html>