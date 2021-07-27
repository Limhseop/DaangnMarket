<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/admin.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/admin.css">
</head>
<script>
   $(document).ready(function(){
   
      $("#delete_btn").click(function(e){
         alert("정말로 삭제하시겠습니까?");
         
      });
      
      $("#member").click(function(e){
         
         $(".memberlist").css("display", "");
         $(".noticemanage").css("display", "none");
         $(".qanda").css("display", "none");
         $("#answertr").css("background-color","white");
         $("#noticetr").css("background-color","white");
         $("#membertr").css("background-color","#D9EDF7");
      });
      
      $("#notice").click(function(e){
         
         $(".memberlist").css("display", "none");
         $(".noticemanage").css("display", "");
         $(".qanda").css("display", "none");
         $("#membertr").css("background-color","white");
         $("#answertr").css("background-color","white");
         $("#noticetr").css("background-color","#D9EDF7");
      });
      
      $("#answer").click(function(e){
         
         $(".memberlist").css("display", "none");
         $(".noticemanage").css("display", "none");
         $(".qanda").css("display", "");
         $("#membertr").css("background-color","white");
         $("#noticetr").css("background-color","white");
         $("#answertr").css("background-color","#D9EDF7");
      });


   });
   
   
</script>

<body>
	<!-- Header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	<br><br>
	<div class="section">
		<div class="section1">
			<table class="table table-bordered table1" style="width:15%;">
	            <thead>
	               <tr>
	                  <th>메뉴</th>
	               </tr>
	            </thead>
	            <tbody>
	               <tr id="membertr" style="background-color:#D9EDF7">
	                  <td><button id= "member" class= "button" style="border:0; outline:0; background:none;">회원 관리</button></td>
	               </tr>
	               <tr id="noticetr">
	                  <td><button id= "notice" class= "button" style="border:0; outline:0; background:none;">공지사항 관리</button></td>
	               </tr>
	               <tr id="answertr">
	                  <td><button id = "answer" class= "button" style="border:0; outline:0; background:none;">문의사항</button></td>
	               </tr>
	            </tbody>
         	</table>

			<table class="table table-bordered memberlist" style="width:80%; display:none;">
	            <thead>
	               <tr>
	                  <th style="width:20%;">아이디</th>
	                  <th style="width:20%;">이름</th>
	                  <th style="width:30%;">가입일자</th>
	                  
	               </tr>
	            </thead>
	            <tbody>
	             <c:forEach items="${mlist}" var = "gmemberlist">
	               <tr>
	                  <td><c:out value="${gmemberlist.id}" /></td>
	                  <td><c:out value="${gmemberlist.name}" /></td>
	                  <td><c:out value="${gmemberlist.joindate}" /></td>
	            
	               </tr>
	            </c:forEach>
	            </tbody>
         	</table>

			
			<table class="table table-bordered noticemanage" style="width:80%; display:none;">
            <thead>
               <tr>
                  <th style="width:20%;">번호</th>
                  <th style="width:20%;">제목</th>
                  <th style="width:30%;">작성일자</th>
                  <th style="width:10%;">삭제</th>
                  <th style="width:10%;">수정</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${nlist}" var = "list">
               <tr>
                  <td><c:out value="${list.bno}" /></td>
                  <td><c:out value="${list.title}" /></td>
                  <td><c:out value="${list.ndate}" /></td>
                  <td><button id="delete_btn" onclick="location.href='admin_noticedelete_proc.do?bno=${list.bno}' ">삭제</button></td>
                  <td><button onclick="location.href='admin_noticeupdate.do?bno=${list.bno}' ">수정</button></td>
               </tr>
               </c:forEach>
            </tbody>
         </table>

			
			<table class="table table-bordered qanda" style="width:80%;">
				<thead>
					<tr>
						<th>제목</th>
						<th>아이디</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="question" items="${qlist}">
						<tr>
							<td><a href="http://localhost:9000/daangn/answer.do?qtitle=${question.qtitle}&qcontent=${question.qcontent}">${question.qtitle }</a></td>
							<td>${question.qid }</td>
							<td>${question.qcheck }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
</body>
</html>