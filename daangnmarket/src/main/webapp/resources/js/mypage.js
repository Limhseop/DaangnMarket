$(document).ready(function(){
	
	//글 수정 버튼
	$("#introUpdate").click(function(){
		$("#introUpdate").css("display","none");
		$("#introBtn").css("display","inline-block");
		$(".introTextArea").attr("disabled",false);
		$(".introTextArea").focus();	
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
	
		
});