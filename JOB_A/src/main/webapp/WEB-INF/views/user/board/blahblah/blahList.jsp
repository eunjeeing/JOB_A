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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css" />
 --%>
<style>
/* .blah {
	background:
		url(${pageContext.request.contextPath}/resources/images/blah.jpg)
		no-repeat;
}

#top {
	-webkit-background-size: cover;
	background-size: cover;
	background-position: center center;
	text-align: center;
	padding-top: 130px;
	padding-bottom: 100px;
}

#top .header-thumb {
	background: #ffffff;
	border: 10px solid #f9f9f9;
	padding: 62px 20px 62px 20px;
}

.blah {
	padding: 32px 20px 32px 20px !important;
}

.blah {
	height: 42vh !important;
	min-height: 420px;
	padding-top: 120px !important;
}

 */
section {
	display: block;
	margin: 0;
	padding: 0;
	color: #222;
	font-size: 14px;
	font-family: "Roboto", "Noto Sans KR", AppleSDGothicNeo-Regular,
		"Malgun Gothic", "맑은 고딕", dotum, "돋움", sans-serif;
	line-height: 1.25em;
	word-wrap: break-word;
}

div {
	display: block;
}

.article-list {
	overflow: hidden;
	display: flex;
	-ms-display: flexbox;
	flex-wrap: wrap;
}

.article-list .article-list-pre {
	position: relative;
	width: 100%;
	margin: 0 20px;
	padding: 24px 0;
	border-bottom: 1px solid #eee;
}

.article-list .article-list-pre .tit {
	position: relative;
}

.article-list .article-list-pre h3 {
	margin-top: 2px;
}
</style>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />
				<!-- 
				<div id="top" class="blah">
					<div class="top-container">
						<div class="row">
							<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
								<div class="header-thumb">
									<h2>블라블라</h2>
								</div>
								</div>
							</div>
						</div>
					</div> -->
				<section class="container">
					<div class="wrapped">
						<div role="main" class="contents">
							<div class="wrap-category">
								<div class="topic"></div>
							</div>
							<div class="wrap-category-pc">
								<div
									class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"
									style="cursor: grab;">
									<span class="swiper-notification" aria-live="assertive"
										aria-atomic="true"></span>
								</div>
							</div>
							<div class="article-list">
								<div class="article-list-pre">
									<c:forEach items="${blahList}" var="blah">
										<div class="tit">
											<h3 class="hh">
												${blah.board_Title}
											</h3>
											<p class="pre-txt">
												${blah.board_Content}
											</p>
										</div>
										<c:if test="${b.fileCount>0}">
											<span class="attach-img"><img
													src="https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/31/2eaf643f5efbc3ecf8c27a7dbe48091b_crop.jpeg"></span>
										</c:if>
										<div class="sub">
											<p class="name">
												${blah.mem_Nick}
											</p>
											<div class="wrap-info">
												<i class="far fa-eye"></i>${blah.board_View }</a> &nbsp; <i
													class="far fa-comment"></i>8</a>
												<div class="info_fnc">
													<i class="blind"></i>${blah.board_Date}</a> &nbsp; &nbsp;
													&nbsp; &nbsp; &nbsp; &nbsp; <i class="far fa-bookmark"></i></a>
												</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>

					</div>

					<%-- 		<c:out value="${pageBar}" escapeXml="false" />
 --%>
				</section>
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
</body>
</html>