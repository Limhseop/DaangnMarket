<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/commons.css">
<link rel="shortcut icon" type= "image/x-icon" href="http://localhost:9000/daangn/images/daangn_x-icon.png" >
<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	    margin: 0;
	    padding: 0;
	    border: 0;
	    font-size: 100%;
	    vertical-align: baseline;
	    background: transparent;
	}	
#header{
		position:fixed;
		top:0; left:0; right:0;
		width:100%;
		z-index:999;
		background: rgb(251,247,242);
		padding-bottom : 25px;
		padding-top: 15px;
}
.header_list{
	width: 80%;
	margin: 0 auto;
}

ul{
	line-style: none;
}
.header_list > ul > li{
	display: inline-block;
	float: right;
}
.category > li{
	display: inline-block;
	float: right;
	text-decoration:none;
}
.logo_img{
	margin-top: 26px;
    width: 120px;
}
body{
	padding-top: 130px;
}
</style>
</head>
<body>	
	<header id="header">
		
			<div class ="header_list">
				<ul>
					<li class="admin"><a href ="http://localhost:9000/daangn/admin.do" style="margin-right: 55px; text-decoration:none; color: black">Admin</a><div></div></li>
					<li class="admin"><a href ="http://localhost:9000/daangn/mypage.do?id=jihwan" style="margin-right: 55px; text-decoration:none; color: black">My Page</a><div></div></li>
					<li class="admin"><a href ="http://localhost:9000/daangn/login.do"style="margin-right: 55px; text-decoration:none; color: black">Sign In</a><div></div></li>
				</ul>
				
				<div class= "logo">
					<a href="http://localhost:9000/daangn/index.do"><img  class= "logo_img" src="http://localhost:9000/daangn/images/logo.svg"></a>
					<nav>
						<ul class= "category">
							<li><div><a href= "http://localhost:9000/daangn/service_center.do" style="margin-right: 55px; font-size: 20px; text-decoration:none; color: black">고객센터</a></div></li>
							<li><div><a href= "" style="margin-right: 55px; font-size: 20px; text-decoration:none; color: black">채팅</a></div></li>
							<li><div><a href= "http://localhost:9000/daangn/notice.do" style="margin-right: 55px; font-size: 20px; text-decoration:none; color: black">공지사항</a></div></li>
							<li><div><a href= "http://localhost:9000/daangn/boardlist.do" style="margin-right: 55px; font-size: 20px; text-decoration:none; color: black">게시판</a></div></li>
							<li><div><a href= "http://localhost:9000/daangn/product.do" style="margin-right: 55px; font-size: 20px; text-decoration:none; color: black">상품</a></div></li>
						</ul>
					
					</nav>
				</div>
			</div>
		
	</header>
</body>
</html>