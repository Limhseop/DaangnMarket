<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="userImage"><img src="images/img_profile_male.png" class="profileImage">
			<input type="file" id="profileImage" style="display:none"></div>
			<label class="profileImageChange" for="profileImage">프로필 이미지 변경</label>
			<div class="userProfile">
				<br><br>
				<strong class="userName">이름 출력</strong><button type="button" value="회원정보변경" class="memberUpdate" data-toggle="modal" data-target="#myModal">회원정보변경</button><br><br>
				<span class="joinDate">상점오픈일    </span><span>  2021-06-29</span>
				<span class="sale">상품판매    </span><span>  1회</span>
				<span class="purchase">상품구매    </span><span>  1회</span>
			</div>
			<div class="intro">
				<textarea rows="6" cols="50" class="introTextArea" disabled></textarea>
				<input type="button" value="확인" class="introBtn" id="introBtn" >
				<input type="button" value="소개글 수정" class="introUpdate" id="introUpdate" >
			</div>
		</div>
		
		<div class="section2">
			<div>
				<ul class="section2_ul">
					<li class="section2_li" id="li_1">상품</li>
					<li class="section2_li" id="li_2">상점문의</li>
					<li class="section2_li" id="li_3">찜</li>
					<li class="section2_li" id="li_4">상점후기</li>
				</ul>
			</div>
			<br>
			
			<div>
				<span>상품  </span><span>0</span>
				<br><br>
				<div class="line"></div><br>
				<!-- <span>등록된 상품이 없습니다</span> -->
				<div class="product">
					<div>
						<img src="images/img_profile_male.png" class="productImage"><br>
						<p class="productName">상품 글제목</p><br>
						<p class="productPrice">금액</p><br>
						<p class="productDate">등록시간</p><br>
					</div>
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
				        <td><input type="text" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>이름</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>성별</td>               
				        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>이메일</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>휴대폰</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>주소</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>상세주소</td>
				        <td><input type="text" class="inputText" disabled style="width:300px;"></td>
				      </tr>
				      <tr>
				        <td>가입일</td>
				        <td><input type="text" disabled style="width:300px;"></td>
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