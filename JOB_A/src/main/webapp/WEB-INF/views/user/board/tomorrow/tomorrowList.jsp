<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 투모로우</title>
 	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
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
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	box-sizing: border-box;
	max-height: 40px;
	max-width: 100px;
	font-size: 17px;
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
</style>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />

				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">투모로우</h3>
					</div>
				</div>

				<!-- search / write area -->
				<div id="utilBox">
					<div id="searchBox">
						<input type="search" id="search" placeholder="검색내용을 입력해주세요."
							onKeyDown="enterKey();" />
					</div>
					<button type="button" id="searchBtn" onclick="search()"
					style="width: 50px;"><i class="fas fa-search" style="margin: -9px;"></i>
					</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/tomorrowList.bo'"
					style="width: 50px;"><i class="fas fa-redo" style="margin: -9px;"></i></button>
					
					<c:if test="${ !empty member }" >
						<c:if test="${ member.gradeNo >= 4 || member.gradeNo < 2 }">
							<button id="writeBtn" onclick="goTomorrowForm();">글쓰기</button>
						</c:if>
					</c:if>
				</div>

				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">

							<div class="article-list">
								<c:forEach items="${tomorrowList}" var="tomorrow">
									<div class="article-list-pre" onclick="selectOne(${tomorrow.board_no});">
										<div class="tit" id="${tomorrow.board_no}">
											<p style="display: none;">${tomorrow.board_no }</p>
											<h3 class="hh">${tomorrow.board_title}</h3>
											<div class="pre-txt">${tomorrow.board_content}</div>
										</div>
										<div class="sub">
											<p class="name" style="padding-top: 2em;">${tomorrow.mem_nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye" style="margin-right: 0;"></i> ${tomorrow.board_view }
												<i class="far fa-comment" style="margin-right: 0; margin-left: 14px;"></i> ${tomorrow.comm_count }
												<div class="info_fnc">
													<span class="date"> 
														<i class="far fa-clock"></i> ${tomorrow.board_date}
													</span>
													<c:if test="${!empty bookmarkList}">
														<c:set var="bCnt" value="0"/>
														<c:forEach items="${bookmarkList}" var="bookmark">
															<c:if test="${bookmark.board_no == tomorrow.board_no}">
																<i class="fas fa-bookmark" id="bookmark"></i>
																<c:set var="bCnt" value="${bCnt + 1}"/>
															</c:if>
														</c:forEach>
														<c:if test="${bCnt eq 0}">
															<i class="far fa-bookmark" id="bookmark"></i>
														</c:if>
													</c:if>
													<c:if test="${empty bookmarkList}">
														<i class="far fa-bookmark" id="bookmark"></i>
													</c:if>
												</div>
											</div>
										</div>
									</div>
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
		<c:import url="../../common/sideBar.jsp" />
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script>
	function selectOne(boardNo) {
		var gradeNo = '${sessionScope.member.gradeNo}';
		console.log("gradeNo : " + gradeNo);
		if (gradeNo.length != 0) {
	     	if (gradeNo == '5') {
	     		alert("일반 이상 회원만 접근할 수 있습니다.");
	     	} else {
    			location.href = "${pageContext.request.contextPath}/selectOneTomorrow.bo?board_no="+ boardNo;
			}
		} else {
			alert("로그인 후 이용가능합니다.");
		}

	}
		function goTomorrowForm() {
			location.href = "${pageContext.request.contextPath}/tomorrowWrite.bo";
		}

    	function search() {

    		var a = 'aa';
        	
			location.href="${pageContext.request.contextPath}/searchTomorrowList.bo?keyword="+$('#search').val();

    	}
    	
    	function enterKey() {
    			if (event.keyCode==13){
    				location.href="${pageContext.request.contextPath}/searchTomorrowList.bo?keyword="+$('#search').val();
    			}
    		}
	</script>			
</body>
</html>