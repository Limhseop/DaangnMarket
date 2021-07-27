<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근채팅</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/commons.css">
<link rel="stylesheet" href="http://localhost:9000/daangn/resources/css/chat.css">
<script src="http://localhost:9000/daangn/resources/js/jquery-3.6.0.min.js"></script>
<script>
	function load_chat_ajax(cid){
		$.ajax({
			url:"load_chat_ajax.do?cid="+cid,
			success: function(result){
				var jdata = JSON.parse(result);
			}
		})
	}
	function submit_func(){
		if($("#text_message").val().trim()==""){
			alert("전송할 메시지를 입력해주세요.")
			$("#text_message").val("");
			$("#text_message").focus();
		}else{
			sendmessage_form.submit();
		}
	}
	
	$(document).ready(function(){
		<c:if test="${status eq 'select'}">
		<c:set var="index" value="-1" />
		<c:if test="${chat_list.size()!=0}">
			<c:forEach var="i" begin="0" end="${chat_list.size()-1}">
				<c:if test="${chat_list.get(i).getCid()==vo_setting.getCid()}">
					<c:set var="index" value="${i}" />
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${index != -1}">
		$("#chat_list_ul").find("li[value='${index}']").css({"background-color":"gray"});
		
		</c:if>
	</c:if>
	
	$("#text_message").focus();
	
	
	$("#chat_list_ul").find("li").click(function(){
		var index1 = $(this).index();
		<c:if test="${chat_list.size()!=0}"> 
			var ccid= ${chat_list.get(index1).getCid()};
			//var cid = <c:out value="${chat_list.get(index1).getCid()}"/>;
		</c:if>
			location.href="http://localhost:9000/daangn/chat_getlog.do?cid="+ccid+"&myid=${myid}";
		});
		
		$("#send_btn").click(function(){
			submit_func();
		});
		
		$("#text_message").on("keyup", function(key){
			if(key.keyCode==13){
				submit_func();
				$("#text_message").val("");
			}
		});
		
		$("#chat_content_div").scrollTop(document.getElementById("chat_content_div").scrollHeight);
		
		
	});
	


</script>
</head>
<body>
<section class="all">
	<section class="chat">
		<div class="top">
			<img src="http://localhost:9000/daangn/resources/images/logo.svg">
		</div>
		<div class="left_side">
			<div class="name_div">
			<h1>${mvo.getName() }</h1>
			</div>
			<div class="second_div">
			</div>
			<div class="chat_list_div">
				<ul class="chat_list_ul" id="chat_list_ul">
				
				<c:forEach var="cvo" items="${chat_list }">
					<c:if test="${ cvo.getLog() != null}">
						<c:choose>
						<c:when test="${cvo.getSender() eq myid }">
							<li class="chat_list_li" id="chat_list_li">
								<div class="chat_list_li_div">
									<div class="chat_list_li_top">
										<span class="chat_profile"><img src="http://localhost:9000/daangn/profileimage/${cvo.getReceiver_image() }" class="img_profile"></span>
										<span class="chat_name">${cvo.getReceiver_name() }</span>
										<span class="chat_list_date">${cvo.getP_location() }, ${cvo.getCdate() }</span>
									</div>
									<span class="chat_list_content">${cvo.getLog() }</span>
								</div>
								<c:if test="${cvo.getPsfile() != null }">
									<img src="http://localhost:9000/daangn/pro_upload/${cvo.getPsfile()}" class="product_img">
								</c:if>
							</li>
						</c:when>
						<c:otherwise>
							<li class="chat_list_li" id="chat_list_li">
								<div class="chat_list_li_div">
									<div class="chat_list_li_top">
										<span class="chat_profile"><img src="http://localhost:9000/daangn/profileimage/${cvo.getSender_image() }" class="img_profile"></span>
										<span class="chat_name">${cvo.getSender_name() }</span>
										<span class="chat_list_date">${cvo.getP_location() }, ${cvo.getCdate() }</span>
									</div>
										<span class="chat_list_content">${cvo.getLog() }</span>
								</div>
								<c:if test="${cvo.getPsfile()!=null }">
									<img src="http://localhost:9000/daangn/pro_upload/${cvo.getPsfile()}" class="product_img">
								</c:if>
							</li>
						</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="right_side">
			<c:choose>
				<c:when test="${status eq 'load'}">
					<div class="right_all_div">
						<img src="http://localhost:9000/daangn/resources/images/chat_bubble.png" class="chat_bubble_img">
						<span class="announce">채팅할 상대를 선택해주세요.</span>
					</div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${myid eq vo_setting.getSender() }">
							<div class="name_div">
							<span class="chat_profile"><img src="http://localhost:9000/daangn/profileimage/${vo_setting.getReceiver_image() }" class="img_profile"></span>
							<h1>${vo_setting.getReceiver_name() }</h1>
							<span class="chat_temperature">36.5℃</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="name_div">
							<span class="chat_profile"><img src="http://localhost:9000/daangn/profileimage/${vo_setting.getSender_image() }" class="img_profile"></span>
							<h1>${vo_setting.getSender_name() }</h1>
							<span class="chat_temperature">36.5℃</span>
							</div>
						</c:otherwise>
					</c:choose>
						<div class="name_div">
						<c:if test="${vo_setting.getPsfile() != null}">
						<img src="http://localhost:9000/daangn/pro_upload/${vo_setting.getPsfile()}" class="product_img">
						</c:if>
							<div class="chat_item_div">
								<span class="title">${vo_setting.getPtitle() }</span>
								<span class="price">${vo_setting.getPrice() }원</span>
							</div>
							<c:choose>
								<c:when test="${vo_setting.getSaled() eq 'N' }">
									<div class="sale_status">판매중</div>
								</c:when>
								<c:otherwise>
									<div class="sale_status">판매완료</div>
								</c:otherwise>
							</c:choose>									
						</div>
						<div class="chat_content_div" id="chat_content_div">
							<c:if test="${log_list != null }">
								<c:set var="date" scope="page" value="0" />
								<c:forEach var="clog" items="${log_list }">
									<c:if test="${date ne clog.getCday()}">
										<div class="date">${clog.getCday() }</div>
										<c:set var="date" scope="page" value="${clog.getCday()}" />
									</c:if>
									<c:choose>
										<c:when test="${clog.getSender() eq myid }">
											<div class="my_chatlog_bg">
												<div class="my_chatlog">
													<span class="word">${clog.getLog()}</span>
													<span class="date">${clog.getCtime() }</span>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="other_chatlog">
											<span class="profile"><img src="http://localhost:9000/daangn/profileimage/${clog.getSender_image() }" class="img_profile"></span>
											<span class="word">${clog.getLog()}</span>
											<span class="date">${clog.getCtime() }</span>
										</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</div>
						<form id="sendmessage_form" action="make_newchat.do" method="GET" name="sendmessage_form" class="sendmessage_form">
						<input type="hidden" value="${vo_setting.getSender() }" name="sender">
						<input type="hidden" value="${vo_setting.getReceiver() }" name="receiver">
						<input type="hidden" value="${vo_setting.getPid() }" name="pid">
							<div class="input_text_div">
							<div class="buttons_right">
								<span class="text_count">0/1000</span>
								<button type="button" id="send_btn">전송</button>
							</div>
							<textarea id="text_message" name="log" class="text_message" placeholder="메시지를 입력해주세요"></textarea>
							</div>
						</form>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</section>
</body>
</html>