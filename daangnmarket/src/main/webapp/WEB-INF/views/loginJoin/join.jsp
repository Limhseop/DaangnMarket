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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var joinCheck=0;
	var phoneCheck=0;
	var phoneCertifyCheck=0;
	var num;
	
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    function ajax_phone(phone){	//핸드폰 인증 ajax
    	$.ajax({
    		url:"phone_check_ajax.do?phone="+phone,
    		success: function(result){
    			//실행결과에 따른 처리
    			var jdata = JSON.parse(result);
    			if(jdata.result=="success"){
    				$("#phone_keynum").prop("disabled",false);
    				$("#certify_check").text("인증번호가 발송되었습니다. 인증번호를 입력해 주세요.");
    				num = jdata.number;
    				phoneCheck=1;
    			}else{
    				$("#certify_check").text("오류가 발생했습니다. 다시 시도해 주세요.");
    				phoneCheck=0;
    			}
    		}
    	});
    }
    
    function ajax_id(id){	//아이디 중복체크 ajax
    	$.ajax({
    		url:"id_check_ajax.do?id="+id,
    		success: function(result){
    			//실행결과에 따른 처리
    			if(result=="true"){	//아이디 중복
    				$("#id_check").text("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
    				joinCheck=0;
    			}else{
    				joinCheck=1;
    			}
    		}
    	});
    }
    
    $(document).ready(function(){
    	$("#id").blur(function(){	//아이디에서 포커스가 사라질 때(아이디 중복체크), 만약 아무것도 없을 경우 아이디를 입력해주세요 메시지
    		if($("#id").val()==""){	//아이디가 없을 때
    			$("#id_check").text("아이디를 입력해주세요.");
    		}else{
    			$("#id_check").text("");
    			var id=$("#id").val();
    			ajax_id(id);
    		}
    	});
    	
    	$("#pass").blur(function(){		//비밀번호에서 포커스가 사라질 때 체크(비밀번호 없을 때, 비밀번호 확인과 다를 때)
    		if($("#pass").val()==""){	//비밀번호가 없을 때
    			$("#pass_check").text("비밀번호를 입력해주세요.");
    		}else{
    			$("#pass_check").text("");
    			if($("#pass_confirm").val()!=""){	//비밀번호 확인이 채워져있을 때
    				if($("#pass").val()!=$("#pass_confirm").val()){ //두 값이 다를때
    		    		$("#pass_confirm_check").text("비밀번호가 일치하지 않습니다.");
    		    	}else{
    		    		$("#pass_confirm_check").text("");
    		    	}
    			}
    		}
    	});
    	
    	$("#pass_confirm").blur(function(){	//비밀번호 확인에서 포커스가 사라질 때 체크
    		if($("#pass_confirm").val()==""){
    			$("#pass_confirm_check").text("비밀번호 확인을 입력해주세요.");
    		}else{
    			$("#pass_confirm_check").text("");
    			if($("#pass").val()!=""){	//비밀번호 확인이 채워져있을 때
    				if($("#pass").val()!=$("#pass_confirm").val()){ //두 값이 다를때
    		    		$("#pass_confirm_check").text("비밀번호가 일치하지 않습니다.");
    		    	}else{
    		    		$("#pass_confirm_check").text("");
    		    	}
    			}
    		}
    	});
    	
    	$("#name").blur(function(){	//이름 체크
    		if($("#name").val()==""){
    			$("#name_check").text("이름을 입력해주세요.");
    		}else{
    			$("#name_check").text("");
    		}
    	});
    	
    	$("#certify_phone").click(function(){	//핸드폰 인증
    		if($("#phone").val()==""){
    			$("#certify_check").text("핸드폰 번호를 입력해주세요.");
    		}else{
    			$("#certify_check").text("");
    			var phone = $("#phone").val();
    			ajax_phone(phone);
    		}
    	});
    	
    	$("#phone_keynum").blur(function(){	//핸드폰 인증번호에서 포커스가 사라질 때 체크
    		if($("#phone_keynum").val()!=""){	//인증번호에 뭔갈 적었을 때
    			if(num!=$("#phone_keynum").val()){	//인증번호 틀림
    				$("#certify_check").text("인증번호가 일치하지 않습니다. 다시 시도해 주세요.");
    			}else{	//인증번호 맞음
    				$("#certify_check").css({"color":"blue"});
    				$("#certify_check").text("인증 완료");
    				$("#phone_keynum").prop("disabled",true);
    				phoneCertifyCheck = 1;
    			}
    		}
    	});
    	
    	$("#addr_btn").click(function(){	//주소 검색 버튼 클릭했을 때
    		sample4_execDaumPostcode();
    	});
    	
    	
    	$("#submit_btn").click(function(){	//가입하기 버튼을 클릭했을 때. 아이디 중복여부, 비밀번호 일치여부도 체크해야함
    		if($("#id").val()==""){	//아이디가 없을 때
    			$("#id_check").text("아이디를 입력해주세요.");
    			$("#id").focus();
    		}else{	//아이디가 있을 때, 중복이 되는지 체크
    			$("#id_check").text("");
    			var id=$("#id").val();
    			ajax_id(id);
    			if(joinCheck==1){	//아이디가 중복되지 않음
    				if($("#pass").val()==""){	//비밀번호가 없을 때
    	    			$("#pass_check").text("비밀번호를 입력해주세요.");
    				}else if($("#pass_confirm").val()==""){
    	    			$("#pass_confirm_check").text("비밀번호 확인을 입력해주세요.");
    				}else{	//비밀번호와 비밀번호 확인 입력이 되었을 때, 같은지 확인
    					if($("#pass").val()!=$("#pass_confirm").val()){ //두 값이 다를때
        		    		$("#pass_confirm_check").text("비밀번호가 일치하지 않습니다.");
        		    	}else{	//두 값이 같음
        		    		$("#pass_confirm_check").text("");
        		    		if($("#name").val()==""){
        		    			$("#name_check").text("이름을 입력해주세요.");
        		    		}else{
        		    			$("#name_check").text("");
        		    			if(phoneCheck==0){	//핸드폰 인증번호 전송 안한 상태
        		    				$("#certify_check").text("핸드폰 인증을 진행해 주세요.");
        		    			}else{	//핸드폰 인증번호 전송한 상태
        		    				$("#certify_check").text("");
        		    				if($("#phone_keynum").val()==""){	//인증번호 입력하지 않음
	        		    				$("#certify_check").text("인증번호를 입력해 주세요.");
        		    				}else{	//인증번호 입력한 상태
	        		    				if(phoneCertifyCheck==0){	//핸드폰 인증 완료하지 않은 상태
		        		    				$("#certify_check").text("인증번호가 일치하지 않습니다. 다시 시도해 주세요.");
	        		    				}else{	//핸드폰 인증 완료
		        		    				$("#certify_check").text("");
	        		    					if($("#postcode").val()==""){	//주소 없음
	        		    						$("#address_detail_check").text("우편번호 찾기를 진행해 주세요.");
	        		    					}else{
	        		    						if($("#detailAddress").val()==""){	//상세주소 없음
	        		    							$("#address_detail_check").text("상세주소를 입력해 주세요.");
	        		    						}else{
	        		    							join_form.submit();	//회원가입 db 진행
	        		    						}
	        		    					}
	        		    				}
        		    				}
        		    			}
        		    		}
        		    	}
    				}
    			}
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
<div class="content">
	<div class="title">
		<h1>회원가입</h1>
	</div>
	<form name="join_form" action="join_proc.do" method="post" class="join_form" id="join_form">
		<div class="top">
			<input type="text" class="input" id="id" name="id" placeholder="아이디">
			<div class="div_check" id="id_check"></div>
			<div class="password">
				<input type="password" class="input" id="pass" name="pass" placeholder="비밀번호">
				<div class="div_check" id="pass_check"></div>
				<input type="password" class="input" id="pass_confirm" placeholder="비밀번호 확인">
				<div class="div_check" id="pass_confirm_check"></div>
			</div>
			<input type="text" id="name" class="input" name="name" placeholder="이름">
				<div class="div_check" id="name_check"></div>
			<input type="text" id="email" class="input" name="email" placeholder="이메일 주소">
			<div id="phone_line" class="phone_line">
				<input type="text" id="phone" class="input_phone" name="phone" placeholder="휴대폰 번호">
				<button type="button" id="certify_phone" class="carrot_btn">인증하기</button>
				<div class="div_check" id="phone_check"></div>
				<input type="text" id="phone_keynum" class="input" placeholder="인증번호 입력" disabled>
				<div class="div_check" id="certify_check"></div>
			</div>
			<div id="addr_line" class="addr_line">
				<input type="text" id="postcode" placeholder="우편번호" class="input_post" name="addr_post">
				<input type="button" id="addr_btn" value="우편번호 찾기" class="carrot_btn"><br>
				<div class="div_check" id="address_check"></div>
				<input type="text" id="roadAddress" placeholder="도로명주소" class="input_road" name="addr_road">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="hidden" id="jibunAddress" name="addr_jibun">
				<input type="text" id="detailAddress" placeholder="상세주소" class="input_detail" name="addr_detail">
				<div class="div_check" id="address_detail_check"></div>
			</div>
		</div>
 		<div id="buttons" class="buttons">
			<button type="button" id="submit_btn" class="carrot_btn">가입하기</button>
		</div>
	</form>
</div>
</section>

<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>