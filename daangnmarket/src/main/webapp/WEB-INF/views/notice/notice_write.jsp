<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>	
	 .table { text-align:center; margin:20px 15px; width:1150px; font-size:13px; }
	 .table, .table th, .table td { border:1px solid lightgray; border-collapse:collapse;}
 	 .table td { padding:10px 0 10px 20px; text-align:left; }
 	 .table input { width: 99%;  line-height: 41px; height: 41px;}
 	 .table #ntitle, .table textarea { border:1px solid lightgray; }
 	 .table th { background-color:rgb(237,237,237); vertical-align: middle; }
 	 .table textarea { width:99%; height:300px; }
 	 .table tr th { padding:5px 0 5px 0; }
 	 button.btn_style {
 	  background-color:rgb(56,57,78);
 	  color:white;
 	  border:1px solid lightgray;
 	  cursor:pointer;
      margin: 0 auto;
      width: 95px;
      height: 45px;
 	 }
 	 .btn_div{
 	     text-align: center;
 	     width: 114%;
 	 }
</style>
<script>
 	$(document).ready(function() {
 		
		$(".span1").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice.jsp");
		});
		
		$(".span2").click(function() {
			location.replace("http://localhost:9000/starbucks/admin/notice/admin_notice_write.jsp");
		}); 		
		
		$("#commit").click(function() {
			if ($("#ntitle").val() == "") {
				alert("제목을 입력해주세요");
				$("#ntitle").focus();
				return false;
			} else if ($("#ncontent").val() == "") {
				alert("내용을 입력해주세요");
				$("#ncontent").focus();
				return false;
			} else {
				notice_write.submit();
			}
		});
 	});
</script>
</head>
<body>
<!-- header -->
<jsp:include page = "../header.jsp"></jsp:include>

<!--  -->
<div class = "content">
	<div class="content_notice" id="content">
		
		<section>
			<div class="center">
			<form name="notice_write" action="admin_notice_write_process.jsp" method="post"  enctype="multipart/form-data">
				<table border=1 class="table" >
					<tr>
						<th>제목</th>
						<td><input type="text" name="ntitle" id ="ntitle"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea  name="ncontent"  overflow="auto"  id="ncontent"></textarea></td>
					</tr>
					<tr>
						<th>파일</th>
						<td><input type="file" name="nfile" ></td>
					</tr>					
				</table>
				<div class="btn_div">
				<button type="button"  class="btn_style" id="commit">작성완료</button>
				<button type="reset" class="btn_style">작성취소</button>
				</div>
			</form>
			</div>
		</section>
	</div>
</div>	
</body>
</html>