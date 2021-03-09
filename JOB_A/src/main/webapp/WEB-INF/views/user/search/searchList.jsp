<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
		rel="stylesheet">
<title>JOB_A | 검색 결과</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/com.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

.tit:hover {
	cursor: pointer;
}

p {
	padding-right: 20px !important;
	margin: 0 !important;
}

.wrap-info {
	position: relative;
	margin-top: 8px;
	font-size: 15px;
	color: gray;
}

.article-list .article-list-pre .pre-txt {
	display: -webkit-box;
	overflow: hidden;
	line-height: 1.33em;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	box-sizing: border-box;
	max-height: 40px;
	font-size: 17px;
	line-height: 1.43em;
	word-break: break-word;
}

.article-list .article-list-pre.attach-img-pre h3 {
	padding-right: 130px !important;
}

.article-list .article-list-pre.attach-img-pre .pre-txt {
	padding-right: 130px !important;
}

.attach-img {
	position: relative;
	display: inline-block;
	margin-top: 54px;
	margin-right: 24px;
}

#nonListArea {
		height : 300px;
		width : 10%;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
#nonListArea>div{
	display: inline-block;
}

#nonListArea>div>p{
	font-size : 35px;
}
.infoMsg>p{
	font-size: 20px;
	padding-left: 15px;
}
</style>
</head>
<body class="is-preload">
	<!-- 사용 스크립트 선언 -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		
 

	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<c:import url="../common/header.jsp" />
				
				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">전체 검색</h3>
					</div>
				</div>
				
				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">
							<div class="infoMsg" >
							<c:if test="${not empty searchList}">
								<p>
									 ${totalContents} 개의 게시글이 있어요!
								</p>
							</div>
							</c:if>
							 <c:if test="${empty searchList}">
							<div id="nonListArea">
								<div>
								<p> ₊·*◟(⌯ˇ ɞ ˇ⌯)◜‧*<br>검색된 결과가 없네 <br>✧*｡٩(ˊᗜˋ*)و✧*｡ </p>
								</div>
							</div>
							</c:if> 
							<div class="article-list">
								<c:forEach items="${searchList}" var="search">
									<c:choose>
										<c:when test="${search.type_No == 5}">
										<div class="article-list-pre" >
											<div class="tit" id="${search.board_No}">
												<p >${search.type_Name } 게시판</p>
												<input class="tno" type="hidden" value="${search.type_No}"/>
												<h3 class="hh">${search.board_Title}</h3>
												<div class="pre-txt">${search.board_Content}</div>
											</div>
											<div class="sub">
												<div class="wrap-info">
													<i class="far fa-eye"> ${search.board_View }</i> <i
														class="far fa-comment"> ${search.comm_Count }</i>
													<div class="info_fnc">
														${search.board_Date} <i class="far fa-bookmark" id="bookmark"></i>
													</div>
												</div>
											</div>
										</div>
										</c:when>
										<c:otherwise>
											<div class="article-list-pre" >
										<div class="tit" id="${search.board_No}">
											<p >${search.type_Name } 게시판</p>
											<input class="tno" type="hidden" value="${search.type_No}"/>
											<h3 class="hh">${search.board_Title}</h3>
											<div class="pre-txt">${search.board_Content}</div>
										</div>
										<div class="sub">".gitignore"
											<p class="name" style="padding-top: 2em;">${search.mem_Nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye"> ${search.board_View }</i> <i
													class="far fa-comment"> ${search.comm_Count }</i>
												<div class="info_fnc">
												
													${search.board_Date} <i class="far fa-bookmark" id="bookmark"></i>
												</div>
											</div>
										</div>
									</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
					<br /> <br />
					<center>
						<c:out value="${pageBar}" escapeXml="false" />
					</center>

				</section>
				
			</div>
		</div>
		<c:import url="../common/sideBar.jsp" />
	</div>
	<c:if test="${ !empty member }" >
	<script>
	$(".tit").on("click",function() {
        var board_No = $(this).attr("id");
		 var tno = $(this).find('.tno').val();
        console.log(board_No + "/" + tno);
        var gradeNo = '${sessionScope.member.gradeNo}';
        
        switch(tno) {
        case '1':
           location.href = "${pageContext.request.contextPath}/notice.bo?board_no="+ board_No;
           break;

        case '2':
           location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No="+ board_No;
           break;
              
        case '4':
	        if ( gradeNo == '5') {
		        	alert("접근할 수 없는 레벨이네요!");										        	
		        	break;
		    }else{
	           location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="+ board_No;
	           break;
		    }
        case '5':
        	if (gradeNo == '2' || member.gradeNo == '5') {
	        	alert("접근할 수 없는 레벨이네요!");
	        	break;
	        }else{
           location.href = "${pageContext.request.contextPath}/board2/blindSelectOne.do?board_No="+ board_No;
           break;
	        }

        case '6':
           location.href = "${pageContext.request.contextPath}/selectOneTomorrow.bo?board_no="+ board_No;
           break;

        case '7':
           location.href = "${pageContext.request.contextPath}/board2/qnaSelectOne.do?board_No="+ board_No;
           break;   

        case '8':
	       	if ( gradeNo == '2' || gradeNo == '3' || gradeNo == '5') {
	        	alert("접근할 수 없는 레벨이네요!");										        	
	        	break;
	        }else{ 
	           location.href = "${pageContext.request.contextPath}/selectOneMento.bo?board_no="+ board_No;
	           break;
	        }
        case '9':
       	if (gradeNo == '2' || gradeNo == '5') {
	       	alert("접근할 수 없는 레벨이네요!");
	       	break;
       	}else{
	         location.href = "${pageContext.request.contextPath}/selectOneInterview.bo?board_no="+ board_No;
	         break;
        }
        case'10':
   		if (gradeNo == '2' || gradeNo == '5') {
		       	alert("접근할 수 없는 레벨이네요!");
		       	break;
	      	}else{
		        location.href = "${pageContext.request.contextPath}/selectOneAccept.bo?board_no="+ board_No;
		        break;
      		}
        }
 });
	</script>
	</c:if>
	<c:if test="${ empty member }">
	<script>
			$(function() {
			$("div[class=tit]")
					.on(
							"click",function() {
								window.alert("로그인 후 이용해주세요");
							});
			});
	</script>
	</c:if>
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script type="text/javascript">
		// Menu.sidebar 오류때문에 넣음
        var $menu = $('#menu'),
           $menu_openers = $menu.children('ul').find('.opener');
  
        // Openers.
           $menu_openers.each(function() {
  
              var $this = $(this);
  
              $this.on('click', function(event) {
  
                 // Prevent default.
                    event.preventDefault();
  
                 // Toggle.
                    $menu_openers.not($this).removeClass('active');
                    $this.toggleClass('active');
  
                 // Trigger resize (sidebar lock).
                    $window.triggerHandler('resize.sidebar-lock');
  
              });
  
           });
	</script>
</body>
</html>