<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/mypage.css">
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/daangn/js/mypage.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"/>
	<!-- content -->
	<div class="section">
		<div class="section1">
			<div class="userImage"><img src="profileimage/${vo.imagepath }" onerror="this.src='profileimage/logo.png'" class="profileImage" >
			<form id="uploadForm" name="formData" action="profileImageChange.do" enctype="multipart/form-data" method="post">
				<input type="file" id="profileImage" name="file" style="display:none">
			</form>
			</div>
			<label class="profileImageChange" for="profileImage">프로필 이미지 변경</label>
			<div class="userProfile">
				<br><br>
				<strong class="userName">${vo.name}</strong><button type="button" value="회원정보변경" class="memberUpdate" data-toggle="modal" data-target="#myModal">회원정보변경</button><br><br>
				<span class="joinDate">상점오픈일    </span><span>${vo.joindate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="sale">상품판매    </span><span>  ${vo.sale}회</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="purchase">상품구매    </span><span>  ${vo.purchase}회</span>
			</div>
			<div class="intro">
				<textarea rows="6" cols="50" class="introTextArea" id="introduce" disabled>${vo.introduce}</textarea>
				<input type="button" value="확인" class="introBtn" id="introBtn" >
				<input type="button" value="소개글 수정" class="introUpdate" id="introUpdate" >
			</div>
		</div>
		<br><br><br>
		<div class="section2">
			<div>
				<span class="section2_li" id="li_1" style="width:100%;text-align:center;">상품</span>
				<!-- <ul class="section2_ul"> -->
					<!-- <li class="section2_li" id="li_2">상점문의</li>
					<li class="section2_li" id="li_3">찜</li>
					<li class="section2_li" id="li_4">상점후기</li> -->
				<!-- </ul> -->
			</div>
			<div>
				<br><br>
				<div class="line"></div><br>
				<!-- <span>등록된 상품이 없습니다</span> -->
				<div class="product">
				<ul>
					<c:forEach var="product" items="${pvo}">
							<li style="display:inline-block; margin:15px;">
								<img src="${product.psfile }" class="productImage"><br>
								<p class="productName">${product.ptitle}</p><br>
								<p class="productPrice">${product.price }</p><br>
								<p class="productDate">${product.pdate}</p><br>
							</li>
					</c:forEach>
				</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
  		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		    
		    <!-- Modal content-->
		    <div class="modal-content">
		        <div class="modal-header"  style="background-color:#FbF7F2">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">회원 정보 변경</h4>
		        </div>
		        <div class="modal-body">
		          <table class="table table-condensed">
			    	<tbody>
				      <tr>
				        <td class="col-md-4">아이디</td>
				        <td><input type="text" disabled style="width:300px;" id="id" value="${vo.id }"></td>
				      </tr>
				      <tr>
				        <td>이름</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;" id="name" value="${vo.name }"></td>
				      </tr>
				      <tr>
				        <td>이메일</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;" id="email" value="${vo.email}"></td>
				      </tr>
				      <tr>
				        <td>휴대폰</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;" id="phone" value="${vo.phone }"></td>
				      </tr>
				      <tr>
				        <td>주소</td>
				        <td><input type="text" disabled style="width:300px;" id="addr" value="${vo.addr }"></td>
				      </tr>
				        <td>가입일</td>
				        <td><input type="text" disabled style="width:300px;" id="joindate" value="${vo.joindate }"></td>
					  </tr> 		
			    </tbody>
	  		</table>
		        </div>
		        <div class="modal-footer">
		  		  <button type="button" id="memberUpdate" class="btn btn-primary pull-left" style="border:1px solid #333;margin-left:200px;">변경하기</button>
			  	  <button type="button" id="memberUpdate_submit" class="btn btn-primary pull-left" style="border:1px solid #333;margin-left:200px;display:none;">변경하기</button>
		          <button type="button" class="btn btn-danger pull-left"data-dismiss="modal">닫기</button>
		        </div>
		    </div>
		      
		</div>
  </div>
  
</div>
	
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"/>
	
</body>
</html>