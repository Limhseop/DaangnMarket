$(document).ready(function(){
	
	//글 수정 버튼
	$("#introUpdate").click(function(){
		$("#introUpdate").css("display","none");
		$("#introBtn").css("display","inline-block");
		$(".introTextArea").attr("disabled",false);
		$(".introTextArea").focus();	
	});
	//글 수정 확인 버튼
	$("#introBtn").click(function(){
		$("#introBtn").css("display","none");
		$("#introUpdate").css("display","inline-block");
		$(".introTextArea").attr("disabled",true);
	});
	//프로필 이미지 변경 hover
	$(".userImage").hover(function(){
		$(".profileImageChange").css("display","inline-block");
	},function(){
		$(".profileImageChange").css("display","none");
	});
	
	//프로필 이미지 변경
	$('.profileImage').click(function (e) {
		e.preventDefault();
		$('#profileImage').click();
	});
	
	$("#profileImage").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$(".profileImage").attr("src",e.target.result);
			};
			
			reader.readAsDataURL(this.files[0]);
			var fileValue = $("#profileImage").val().split("\\");
			var fileName = fileValue[fileValue.length-1];
			var form = $("#uploadForm")[0];
			var formData = new FormData(form);
			
			$.ajax({
				url : "http://localhost:9000/daangn/profileImageChange.do",
				type : "POST",
				data : formData ,
				contentType : false,
				processData : false,
				success : function(data){
					alert("이미지 변경 완료");
				},
				error: function (request, status, error){
					var msg = "ERROR : " + request.status + "<br>"
					msg += + "내용 : " + request.responseText + "<br>" + error;
					console.log(msg);
					alert(msg);
				}

			});
			//$("#uploadForm").submit();
			
		}
	});
	
	//자기소개 수정
	$("#introBtn").click(function(){
		var intro = $("#introduce").val();
		
		$.ajax({
			url : "http://localhost:9000/daangn/introUpdate.do",
			type : "POST",
			data : {"intro":intro},
			success : function(data){
				alert("변경 완료");
			},
			error: function (request, status, error){
					var msg = "ERROR : " + request.status + "<br>"
					msg += + "내용 : " + request.responseText + "<br>" + error;
					console.log(msg);
					alert(msg);
			}
		});
	});
	
	//회원정보 변경
	$("#memberUpdate_submit").click(function(){
		var id = $("#id").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var addr = $("#addr").val();
		var joindate = $("#joindate").val();
		
		$.ajax({
			url : "http://localhost:9000/daangn/memberUpdate.do",
			type : "POST",
			data : {"id" : id, "name" : name, "email" : email, "phone" : phone, "addr" : addr, "joindate" : joindate},
			success : function(data){
				alert("변경 완료");
			},
			error: function (request, status, error){
					var msg = "ERROR : " + request.status + "<br>"
					msg += + "내용 : " + request.responseText + "<br>" + error;
					console.log(msg);
					alert(msg);
			}
		
		});
		
	});
	
	
	
	// 상품,상점문의,찜,상점후기 테두리 변경
	$("#li_1").click(function(){
		$("#li_1").css("border","1px solid #333");
		$("#li_1").css("border-bottom","none");
		$("#li_2").css("border","none");
		$("#li_2").css("border-bottom","1px solid #333");
		$("#li_3").css("border","none");
		$("#li_3").css("border-bottom","1px solid #333");
		$("#li_4").css("border","none");
		$("#li_4").css("border-bottom","1px solid #333");
	});

	$("#li_2").click(function(){
		$("#li_2").css("border","1px solid #333");
		$("#li_2").css("border-bottom","none");
		$("#li_1").css("border","none");
		$("#li_1").css("border-bottom","1px solid #333");
		$("#li_3").css("border","none");
		$("#li_3").css("border-bottom","1px solid #333");
		$("#li_4").css("border","none");
		$("#li_4").css("border-bottom","1px solid #333");
	});

	$("#li_3").click(function(){
		$("#li_3").css("border","1px solid #333");
		$("#li_3").css("border-bottom","none");
		$("#li_1").css("border","none");
		$("#li_1").css("border-bottom","1px solid #333");
		$("#li_2").css("border","none");
		$("#li_2").css("border-bottom","1px solid #333");
		$("#li_4").css("border","none");
		$("#li_4").css("border-bottom","1px solid #333");
	});

	$("#li_4").click(function(){
		$("#li_4").css("border","1px solid #333");
		$("#li_4").css("border-bottom","none");
		$("#li_1").css("border","none");
		$("#li_1").css("border-bottom","1px solid #333");
		$("#li_2").css("border","none");
		$("#li_2").css("border-bottom","1px solid #333");
		$("#li_3").css("border","none");
		$("#li_3").css("border-bottom","1px solid #333");
	});
	
	//회원 정보 변경하기 버튼
	$("#memberUpdate").click(function(){
			$("#memberUpdate").css("display","none");
			$("#memberUpdate_submit").css("display","");
			
			
			$(".inputText").attr("disabled",false);
	});
	
		
});