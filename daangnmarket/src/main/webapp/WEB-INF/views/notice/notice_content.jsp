<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/notice_content.css">
</head>
<body>
<!-- header -->
<jsp:include page = "../header.jsp"></jsp:include>

<!-- content -->
<div class= "relative">
	<div class="content">
	
			
			
			<!-- 제목과 날짜 부분 -->
				<div class= "title_wrap">
					 <h4 class= "title_text">${vo.title}</h4>
					 <span class= "title_date">${vo.ndate}</span>
				</div>
			<!-- 공지사항의 내용 -->
				<div class= "content_text">
					<div class= "notice_view">
						${vo.content}
						
					</div>
					
				</div>
				
<div class="wrap_btn">
				 	<a href="notice.do" class="btn_list">목록</a>
					</div>

	</div>
</div>





<!-- footer -->
<jsp:include page = "../footer.jsp"></jsp:include>


</body>
</html>