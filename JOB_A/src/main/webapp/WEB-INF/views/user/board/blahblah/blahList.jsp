<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 블라블라</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/blah.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

.tit:hover {
	cursor:pointer;
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
						<h3 id="topbanner-text">블라블라</h3>
					</div>
				</div>
				
				<!-- search / write area -->
				<div id="utilBox">
					<div id="searchBox">
						<input type="search" id="search" placeholder="검색내용을 입력해주세요."
							onKeyDown="enterKey();" />
					</div>
					<button type="button" id="searchBtn" onclick="search()">검색
					</button>
					<button id="writeBtn">글쓰기</button>
				</div>
				
				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">

							<div class="article-list">
								<c:forEach items="${blahList}" var="blah">
									<div class="article-list-pre">
										<div class="tit" id="${blah.board_No}">
										<p style="display:none;">${blah.board_No }</p>
											<h3 class="hh">${blah.board_Title}</h3>
											<p class="pre-txt">${blah.board_Content}</p>
										</div>
										<%-- 										<c:if test="${b.fileCount>0}">
 --%>
										<span class="attach-img"><img
											src="https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/31/2eaf643f5efbc3ecf8c27a7dbe48091b_crop.jpeg"></span>
										<%-- 										</c:if>
 --%>
										<div class="sub">
											<p class="name">${blah.mem_Nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye"> ${blah.board_View }</i> <i
													class="far fa-comment"> ${blah.comm_Count }</i>
												<div class="info_fnc">
													${blah.board_Date} <i class="far fa-bookmark" id="bookmark"></i>
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
<script>
$(function(){
	$("div[class=tit]").on("click",function(){
		var board_No = $(this).attr("id");
		console.log("board_No="+board_No);
		location.href = "${pageContext.request.contextPath}/board2/blahView.bo?no="+board_No;
	});
});
</script>
</body>
</html>