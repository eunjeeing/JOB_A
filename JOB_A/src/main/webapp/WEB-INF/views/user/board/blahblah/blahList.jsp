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
.blah {
    background: url(${pageContext.request.contextPath}/resources/images/blah.jpg) no-repeat;
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
								<div class="article-list ">
									<div class="article-list-pre attach-img-pre">
										<c:forEach items="${list}" var="board">
											<div class="tit">
												<h3 class="">
													<a href="#" class="">${board.board_Title} <!---->
													</a>
												</h3>
												<p class="pre-txt">
													<a href="#" class="">${board.board_Content}</a>
												</p>
												<span class="attach-img"><a href="#" class=""><img
														src="https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/31/2eaf643f5efbc3ecf8c27a7dbe48091b_crop.jpeg">
														<!----> </a></span>
												<!---->
											</div>
											<div class="sub">
												<p class="name">
													<!---->
													<a href="#" class="">${board.mem_Nick}</a>
												</p>
												<div class="wrap-info">
													<a href="#" class="pv"><i class="blind">조회수</i>${board.board_View }</a>
													<a class="like"><i class="blind">좋아요</i>4</a> <a href="#"
														class="cmt"><i class="blind">댓글</i>8</a>
													<div class="info_fnc">
														<a href="#" class="past"><i class="blind">작성시간</i>${board.board_Date}</a>
														<a class="mark"><i class="blind">북마크</i></a>
													</div>
										</c:forEach>

									</div>
								</div>
							</div>
							<c:out value="${pageBar}" escapeXml="false" />

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