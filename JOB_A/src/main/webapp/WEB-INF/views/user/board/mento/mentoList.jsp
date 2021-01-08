<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | MENTO</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/pic01.jpg)
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
						<h3 id="topbanner-text">멘토링</h3>
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
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mentoList.bo'"
					style="width: 50px;"><i class="fas fa-redo" style="margin: -9px;"></i></button>
					
					<c:if test="${ !empty member }" >
						<c:if test="${ member.gradeNo == 4 || member.gradeNo < 2 }">
							<button id="writeBtn" onclick="goMentoForm();">글쓰기</button>
						</c:if>
					</c:if>
				</div>

				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">

							<div class="article-list">
								<c:forEach items="${mentoList}" var="mento">
									<div class="article-list-pre">
										<div class="tit" id="${mento.board_no}">
											<p style="display: none;">${mento.board_no }</p>
											<h3 class="hh">${mento.board_title}</h3>
											<div class="pre-txt">${mento.board_content}</div>
										</div>
										<div class="sub">
											<p class="name" style="padding-top: 2em;">${mento.mem_nick}</p>
											<div class="wrap-info">
												<i class="far fa-eye" style="margin-right: 0;"></i> ${mento.board_view }
												<i class="far fa-comment" style="margin-right: 0; margin-left: 14px;"></i> ${mento.comm_Count }
												<div class="info_fnc">
													${mento.board_date} <i class="far fa-bookmark" id="bookmark"></i>
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
 	<c:if test="${ !empty member }" >
	<script>
		$(function() {
			$("div[class=tit]")
					.on(
							"click",
							function() {
								var board_No = $(this).attr("id");
								console.log("board_No=" + board_No);
								location.href = "${pageContext.request.contextPath}/board2/mentoView.bo?board_No="
										+ board_No;
							});
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
	<script>
		function goMentoForm() {
			location.href = "${pageContext.request.contextPath}/board2/mentoForm.bo";
		}

    	function search() {

    		var a = 'aa';
        	
			location.href="${pageContext.request.contextPath}/board2/searchMentoList.bo?keyword="+$('#search').val();

    	}
    	
    	function enterKey() {
    			if (event.keyCode==13){
    				location.href="${pageContext.request.contextPath}/board2/searchMentoList.bo?keyword="+$('#search').val();
    			}
    		}
	</script>			
</body>
</html>