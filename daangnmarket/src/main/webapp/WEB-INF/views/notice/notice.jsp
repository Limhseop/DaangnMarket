<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
    
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
$(document).ready(function(){
		
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: ${dbcount} ,	// total pages	
		    page: ${rpage} ,		// initial page		
		    pageSize: ${pagesize},			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/daangn/board_list.do?rpage="+e.page);         
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
                    <c:forEach items="${list}" var = "list">
                        <li>
                            <article>
                                <button class = "notice_btn">
                                    <div class = "noti">
                                        <h1><c:out value="${list.title}" /></h1>
                                        <time class= "time"><c:out value="${list.ndate}" /></time>
                                    </div>
                                </button>
                            </article>
                        </li> 
                        </c:forEach>
                    </ul>
                </div>
           </section>
       </div>
    </div>
	
	
	
	<!-- Footer -->
	<jsp:include page ="../footer.jsp"></jsp:include>
	
</body>
</html>