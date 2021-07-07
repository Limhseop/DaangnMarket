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
			alert(fileName);
		}
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