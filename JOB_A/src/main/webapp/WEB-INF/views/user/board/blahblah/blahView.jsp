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
#wrapped {
	border: 1px solid pink;
}
.article-view-head {
    position: relative;
    z-index: 10;
    padding: 25px 20px 19px;
}
.name {
    margin-top: 16px;
    font-size: 16px;
    line-height: 16px;
}
.article-view-head .wrap-info {
    margin-top: 16px;
}
.wrap-info {
    position: relative;
    margin-top: 15px;
    margin-bottom: 15px;
    font-size: 14px;
}
.wrap-info a, .wrap-info span {
    margin-right: 14px;
    color: #94969b;
    vertical-align: top;
}
.article-view-head .wrap-info .info_fnc {
    top: -2px;
}
.wrap-info .info_fnc {
    position: absolute;
    top: 0;
    right: 0;
}
.article-view-contents {
    margin: 10px 20px;
    border-top: 1px solid #eee;
}
.article-view-contents .contents-txt {
    margin-top: 24px;
    line-height: 1.6em;
    font-size: 17px;
}
.article-comments {
    margin: 10px 20px;
    padding: 23px 0 24px;
    border-top: 1px solid #eee;
}
#head {
	margin: 14px 14px 14px 14px;
}
#report {
	margin-right: 0;
	font-size: 20px;	
}
#book {
	margin-left: 14px;
	font-size: 20px;
	margin-right: 0;
	
}
.wrap-info .rebo {
	color: black !important;
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

				<!-- View -->
				<section class="container">
					<div class="wrapped" id="wrapped">
						<div role="main" class="contents">
							<div class="acticle-view-head" id="head">
								<h2>${board2.board_Title }</h2>
								<p class="name">
									${board2.mem_Nick }
								</p>
								<div class="wrap-info">
									<span class="date">
										<i class="far fa-clock"> ${board2.board_Date }</i>
									</span>
									<span class="pv">
										<i class="far fa-eye"> ${board2.board_View }</i>
									</span>
									<span class="cmt">
										<i class="far fa-comment"> ${board2.comm_Count }</i>
									</span>
									<div class="info_fnc">
									<span class="rebo">
										<i class="fas fa-exclamation-triangle" id="report"></i> 신고
									</span>
									<span class="rebo">
										<i class="far fa-bookmark" id="book"> </i> 스크랩
									</span>
									</div>
								</div>
							</div>
							<div class="article-view-contents">
								<p id="contentArea" class="contents-txt">
									${board2.board_Content }
								</p>
<%-- 								<div class="article_info">
									<div class="info">
										<i class="far fa-comment">${board2.comm_Count }</i>
									</div>
									<div class="info_fnc">
									</div>
								</div> --%>
							</div>
							
							<!-- 댓글 -->
							<div class="article-comments">
								<h3>댓글 ${board2.comm_Count }</h3>
								<div class="write_area">
									<div id="btn_add_comment">
										<div class="reply_area">
											<textarea placeholder="댓글을 남겨주세요."></textarea>
											<button>등록</button>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</section>
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
</body>
</html>