<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="http://localhost:9000/daangn/css/notice.css">
<script src="http://localhost:9000/daangn/js/jquery-3.6.0.min.js"></script>
</head>
<script>
    $(function() {
    $("#li_1").on("click", function(){ 
        $("#li_1").css("border", "1px solid #333");
        $("#li_1").css("border-bottom", "none");
        $("#li_2").css("border", "none");
        $("#li_2").css("border-bottom", "1px solid #333");
        $("#li_3").css("border", "none");
        $("#li_3").css("border-bottom", "1px solid #333");

    });
    $("#li_2").click(function(){
        $("#li_2").css("border", "1px solid #333");
        $("#li_2").css("border-bottom", "none");
        $("#li_1").css("border", "none");
        $("#li_1").css("border-bottom", "1px solid #333");
        $("#li_3").css("border", "none");
        $("#li_3").css("border-bottom", "1px solid #333");
    });
    $("#li_3").click(function(){
        $("#li_3").css("border", "1px solid #333");
        $("#li_3").css("border-bottom", "none");
        $("#li_1").css("border", "none");
        $("#li_1").css("border-bottom", "1px solid #333");
        $("#li_2").css("border", "none");
        $("#li_2").css("border-bottom", "1px solid #333");
    });
});

</script>
<body>
	<!-- Header -->
	<jsp:include page ="../header.jsp"></jsp:include>
	<div class="content">
       <div>
           <section>
                <div class="main">
                    <nav class="notice_nav">
                        <ul>
                            <li id="li_1"><a>공지사항</a></li>
                            <li id="li_2"><a>운영정책</a></li>
                            <li id="li_3"><a>자주묻는 질문</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="notice">
                    <ul class="notice_list">
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1>[공지] 초소형 카메라 거래 시 제재 정책 강화 안내</h1>
                                        <time class= "time">2021/06/22</time>
                                    </div>
                                    <span class="arrow_down"> </span>
                                </button>
                            </article>
                        </li>
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1>[공지] 초소형 카메라 거래 시 제재 정책 강화 안내</h1>
                                        <time class= "time">2021/06/22</time>
                                    </div>
                                    <span class="arrow_down"> </span>
                                </button>
                            </article>
                        </li>
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1>[공지] 초소형 카메라 거래 시 제재 정책 강화 안내</h1>
                                        <time class= "time">2021/06/22</time>
                                    </div>
                                    <span class="arrow_down"> </span>
                                </button>
                            </article>
                        </li>
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1>[공지] 초소형 카메라 거래 시 제재 정책 강화 안내</h1>
                                        <time class= "time">2021/06/22</time>
                                    </div>
                                    <span class="arrow_down"> </span>
                                </button>
                            </article>
                        </li>
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1>[공지] 초소형 카메라 거래 시 제재 정책 강화 안내</h1>
                                        <time class= "time">2021/06/22</time>
                                    </div>
                                    <span class="arrow_down"> </span>
                                </button>
                            </article>
                        </li>
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1>[공지] 초소형 카메라 거래 시 제재 정책 강화 안내</h1>
                                        <time class= "time">2021/06/22</time>
                                    </div>
                                    <span class="arrow_down"> </span>
                                </button>
                            </article>
                        </li>
                        
                    </ul>
                </div>
           </section>
       </div>
    </div>
	
	
	
	<!-- Footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
	
</body>
</html>