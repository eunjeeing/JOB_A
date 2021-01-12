<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 블라인드</title>
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
	-webkit-line-clamp: 2;
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
						<h3 id="topbanner-text">블라인드</h3>
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
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/board2/selectBlindList.do'"
					style="width: 50px;"><i class="fas fa-redo" style="margin: -9px;"></i></button>
					
					<c:if test="${ member.gradeNo == 0 || member.gradeNo == 1 || member.gradeNo == 3 || member.gradeNo == 4 }" >
						<button id="writeBtn" onclick="goblindForm();">글쓰기</button>
					</c:if>
				</div>

				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">

							<div class="article-list">
								<c:forEach items="${selectBlindList}" var="blind">
									<div class="article-list-pre">
										<div class="tit" id="${blind.board_No}">
											<p style="display: none;">${blind.board_No }</p>
											<h3 class="hh">${blind.board_Title}</h3>
											<div class="pre-txt">${blind.board_Content}</div>
										</div>
										<div class="sub">
											<p class="name" style="padding-top: 2em;">익명</p>
											<div class="wrap-info">
												<i class="far fa-eye" style="margin-right: 0;"></i> ${blind.board_View }
												<i class="far fa-comment" style="margin-right: 0; margin-left: 14px;"></i> ${blind.comm_Count }
												<div class="info_fnc">
													<span class="date"> 
														<i class="far fa-clock"></i> ${blind.board_Date}
													</span>
													<c:if test="${!empty bookmarkList}">
														<c:set var="bCnt" value="0"/>
														<c:forEach items="${bookmarkList}" var="bookmark">
															<c:if test="${bookmark.board_no == blind.board_No}">
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
<%-- 									<c:if test="{b.fileCount>0}">
										<div class="article-list-pre attach-img-pre">
											<div class="tit" id="${blind.board_No}">
												<p style="display: none;">${blind.board_No }</p>
												<h3 class="hh">${blind.board_Title}</h3>
												<div class="pre-txt">${blind.board_Content}</div>
												<span class="attach-img"> <img src="#">
												</span>
											</div>
											<div class="sub">
												<p class="name">익명</p>
												<div class="wrap-info">
													<i class="far fa-eye"> ${blind.board_View }</i> <i
														class="far fa-comment"> ${blind.comm_Count }</i>
													<div class="info_fnc">
														${blind.board_Date} <i class="far fa-bookmark"
															id="bookmark"></i>
													</div>
												</div>
											</div>
										</div>
									</c:if> --%>
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
	<c:choose>
		<c:when test="${ empty member }">
		<script>
				$(function() {
				$("div[class=tit]")
						.on(
								"click",function() {
									window.alert("로그인 후 이용해주세요");
								});
				});
		</script>
		</c:when>
		<c:when test="${ member.gradeNo == 2 || member.gradeNo == 5 }">
		<script>
				$(function() {
				$("div[class=tit]")
						.on(
								"click",function() {
									window.alert("우수회원 이상 이용 가능합니다.");
								});
				});
		</script>
		</c:when>
		<c:otherwise>
		<script>
			$(function() {
				$("div[class=tit]")
						.on(
								"click",
								function() {
									var board_No = $(this).attr("id");
									console.log("board_No=" + board_No);
									location.href = "${pageContext.request.contextPath}/board2/blindSelectOne.do?board_No="
											+ board_No;
								});
			});
		</script>
		</c:otherwise>
	</c:choose>
	<script>
		function goblindForm() {
			location.href = "${pageContext.request.contextPath}/board2/blindForm.do";
		}

    	function search() {
			location.href="${pageContext.request.contextPath}/board2/searchBlindList.do?keyword="+$('#search').val();

    	}
    	
    	function enterKey() {
    			if (event.keyCode==13){
    				location.href="${pageContext.request.contextPath}/board2/searchBlindList.do?keyword="+$('#search').val();
    			}
    		}
	</script>
	    	<!-- Scripts -->
    	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>