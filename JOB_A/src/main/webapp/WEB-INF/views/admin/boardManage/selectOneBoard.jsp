<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리 | 게시글 상세</title>

<style>
	.goBoard:hover{
		cursor:pointer;
	}
	
	.trtr:hover{
		background: #EAEAEA;
	}
	
	#buttonArea {
		float: right;
	}

	.article-view-head {
	position: relative;
	z-index: 10;
	padding: 25px 20px 19px;
}

.name {
	margin-top: 16px !important;
	font-size: 16px;
	line-height: 16px;
}

p {
	padding-right: 20px !important;
	margin: 0 !important;
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
.wrap-info a {
	border-bottom: 0px;
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

#book {
	margin-left: 14px;
	font-size: 20px;
	margin-right: 0;
}

.wrap-info .rebo {
	color: black !important;
}

.article-comments .wrap-comment {
	padding: 8px 20px 15px;
	border-bottom: 1px solid #eee;
}

.article-comments .wrap-comment .name {
	margin-top: 9px;
	color: #94969b;
	font-size: 13px;
	line-height: 1.33em;
}

.article-comments .wrap-comment .cmt-txt {
	margin-top: 4px;
	font-size: 14px;
	line-height: 1.43em;
}

.article-comments .wrap-comment .wrap-info {
	margin-top: 10px;
}

.cmt-txt {
	margin: 0;
}

#comm_Con2 {
	margin: 0;
	border: none;
	resize: none;
}

#close-icon:hover {
	cursor:pointer;
}

/* #comm_Con2:focus {
	border: none;
    box-shadow: 0 0 0 0; 
} */
.wrap-info i {
    margin-right: 0;
}

/* 대댓글 스타일 */
.article-comments .wrap-reply {
    margin-top: -1px;
    border-top: 1px solid #eee;
   /*  background-color: #f8f8f8; */
}

.article-comments .wrap-reply .wrap-comment {
    padding: 8px 20px 15px 70px;
}

</style>
</head>
<body class="vertical  dark">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />
		
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div>
							<h2 class="page-title">BOARD LIST<button class="btn mb-2 btn-light" style="float:right; position:-30px;"onclick="history.go(-1);"> 뒤로가기</button></h2>
						</div>
						<br />
						
						<!-- 헤더 -->
						<div class="row top">
							<div class="col-md-12 top">
								<div class="card shadow top" style="height: auto;">
									<div class="card-body top">
										<table class="table table-hover">
											<thead>
												<tr align="center">
													<th>No.</th>
													<th>작성자</th>
													<th>등록일</th>
													<th>조회수</th>
													<th>상태</th>
													<th>상태변경</th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<th>${board2.board_No}</th>
													<th>${board2.mem_Nick}</th>
													<th>${board2.board_Date}</th>
													<th>${board2.board_View }</th>
													<th>
														<c:if test="${board2.board_Status eq 'Y'}">
															<span class='badge badge-success'>정상</span>
														</c:if> <c:if test="${board2.board_Status eq 'B'}">
															<span class='badge badge-danger'>블라인드</span>
														</c:if>  <c:if test="${board2.board_Status eq 'N'}">
															<span class='badge badge-secondary'>삭제</span>
														</c:if> 
													</th>
													<th>
														<c:if test="${board2.board_Status eq 'Y' }">
															<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusB.do?board_No=${board2.board_No}&type_No=${board2.type_No}'">블라인드</button>
														</c:if>
														<c:if test="${board2.board_Status eq 'B' }">
															<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusY.do?board_No=${board2.board_No}&type_No=${board2.type_No}'">활성화</button>
														</c:if>
														<c:if test="${board2.board_Status eq 'N'}">
															<button class="btn mb-2 btn-light" disabled="disabled">활성화</button>
														</c:if>
													</th>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
						<br /><br />

						
						<!-- 본문 -->
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">

											
										<div class="basicInfo" style="margin-top:20px;">
											<h2>${board2.board_Title}</h2>
											<br /><hr />
											<div style="display:flex;">
												<div>
													${board2.board_Content}
												</div>
								
											</div>
										</div>
										<br>
										
									</div>
								</div>
							</div>
						</div>
						<br /><br />
 						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
										<div class="article-comments">
											<h4 style="font-weight: 500">댓글 ${board2.comm_Count }</h4>
											
											
											<c:forEach items="${commentList}" var="co">
												<c:if test="${co.comm_Level eq 1}">
												<div id="${co.comm_No }" class="wrap-comment comment-area">
													<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq notice.mem_no }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">작성자</text></c:if></p>
													<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="width:100%; overflow:auto;">${co.comm_Content }</textarea></p>
													<div class="wrap-info" style="display:flex;">
													
														<span class="date"> <i class="far fa-clock"></i>
														<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
														<p><c:if test="${co.comm_Status eq 'Y'}">
																<span class='badge badge-success' style="color:black;">정상</span>
															</c:if> <c:if test="${co.comm_Status eq 'B' }">
																<span class='badge badge-danger' style="color:white;">블라인드</span>
															</c:if>  <c:if test="${co.comm_Status eq 'N'}">
																<span class='badge badge-secondary' style="color:white;">삭제</span>
															</c:if></p>
														<div class="info_fnc">
																<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
													      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
														  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
														  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
														</div>
													</div>
												</div>
											</c:if>
												
											<!-- 대댓글일때 -->
											<c:if test="${co.comm_Level ne 1}">
												<div class="wrap-reply">
													<div id="${co.comm_No }" class="wrap-comment comment-area">
														<p class="name">${co.mem_Nick }</p>
														<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="width:100%;overflow:auto;">${co.comm_Content }</textarea></p>
														<div class="wrap-info" style="display:flex;">
														
														<span class="date"> <i class="far fa-clock"></i>
														<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
															<p><c:if test="${co.comm_Status eq 'Y'}">
																<span class='badge badge-success' style="color:black;">정상</span>
															</c:if> <c:if test="${co.comm_Status eq 'B'}">
																<span class='badge badge-danger' style="color:white;">블라인드</span>
															</c:if>  <c:if test="${co.comm_Status eq 'N'}">
																<span class='badge badge-secondary' style="color:white;">삭제</span>
															</c:if></p>
															<div class="info_fnc">
																	<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
														      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
															  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
															  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
															</div>
														</div>
													</div>
												</div>
											</c:if>			
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div> 
						
					</div>
				</div>

			</div>
			<!-- end section -->
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->
	<script>
      $('#dataTable-1').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
    </script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
	<script>
      	window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-56159088-1');

    </script>
</body>
</html>