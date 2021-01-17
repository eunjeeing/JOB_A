<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 | 멘토 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<style>
	.tab {
		display: inline-block;
		padding-right: 10px;
	}
	
	/* p {
		background: #80808026;
	    padding: 5px 8px 5px 8px;
	    color: black;
	    border-radius: 5px;
	}
	
	p:hover {
		background: black;
		color: white;
		cursor: pointer;
		padding: 20px 8px 5px 8px;
	} */
	
	#mento {
		font-weight:800;
	}
	
	.goBoard:hover{
		cursor:pointer;
	}
	
	.trtr:hover{
		background: #EAEAEA;
	}
	
	#buttonArea {
		float: right;
	}
	
/* 	p {
		background-color : lightgrey !important;
	}
	
	p:hover {
		background-color : lightgrey !important;
	} */
	
	
</style>
</head>
<body class="vertical  dark">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../../common/sidebar.jsp" />
		
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div>
							<h2 class="page-title">MENTO VIEW <button class="btn mb-2 btn-light" style="float:right; position:-30px;"onclick="history.go(-1);"> 뒤로가기</button></h2>
						</div>
						<br />
						
						<!-- 헤더 -->
						<div class="row top">
							<div class="col-md-12 top">
								<div class="card shadow top" style="height: auto;">
									<div class="card-body top">
										<table class="table table-hover table-borderless border-v">
											<thead>
												<tr align="center">
													<th>No.</th>
													<th>작성자</th>
													<th>등록일</th>
													<th>답변상태</th>
													<th>상태</th>
													<th>활성화여부</th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<th>${mento.board_no}</th>
													<th>${mento.mem_nick}</th>
													<th>${mento.board_date}</th>
													<th>
														<c:if test="${mento.comm_count > 0}">
															<span class='badge badge-success'>완료</span>
														</c:if>
														<c:if test="${mento.comm_count == 0}">
															<span class='badge badge-secondary'>미완료</span>
														</c:if>
													</th>
													<th>
														<c:if test="${mento.board_status eq 'Y'}">
															<span class='badge badge-success'>정상</span>
														</c:if> <c:if test="${mento.board_status eq 'B'}">
															<span class='badge badge-danger'>블라인드</span>
														</c:if>  <c:if test="${mento.board_status eq 'N'}">
															<span class='badge badge-secondary'>삭제</span>
														</c:if> 
													</th>
													<th>
														<c:if test="${mento.board_status eq 'Y' }">
															<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusB.do?board_No=${mento.board_no}&type_No=${mento.type_no}'">블라인드</button>
														</c:if>
														<c:if test="${mento.board_status eq 'B' }">
															<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusY.do?board_No=${mento.board_no}&type_No=${mento.type_no}'">활성화</button>
														</c:if>
														<c:if test="${mento.board_status eq 'N'}">
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
										<div id="buttonArea">
											<button class="btn mb-2 btn-primary" onclick="goUpdate(${mento.board_no});">수정</button>&nbsp;
											<button class="btn mb-2 btn-primary" onclick="deleteMento(${mento.board_no});">삭제</button>
										</div>
											
										<div class="basicInfo" style="margin-top:20px;">
											<h2 align="center"><!-- 제모오오오옥 -->${mento.board_title}</h2>
											<!-- <input type="text" id="simpleInput" class="form-control form-control-lg"/> -->
											<br /><hr />
											<div style="display:flex;">
												<!-- <textarea name="" id="" cols="30" rows="10">
												awefjkl;asdfjkl;asdfjkl;asdfjkl;asdfjkl;
												</textarea>>	 -->			
												<div  style="width:60%; margin:auto;">
													<!-- 내요요오오오오ㅗㅇㅇ -->${mento.board_content}
												</div>
								
											</div>
										</div>
										<br>
										
									</div>
								</div>
							</div>
							<!-- Bordered table -->
						</div>
						<br /><br />
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
										<div class="article-comments">
											<h3 style="font-weight: 500">답글 ${notice.comm_count }</h3>
											<div class="write_area">
												<div id="btn_add_comment" style="display: flex;">
													<div class="reply_area" style="width: 100%;">
														<form id="commentForm" method="post">
														<input type="hidden" id="mem_No" name="mem_No"
															value="${sessionScope.mem_No }" /> 
														<input type="hidden" name="comm_Ref" value="0" />
														<input type="hidden" name="comm_Level" value="1" />
														<textarea class="summernote" id="comm_Content" name="comm_Content" maxlength="500"
															placeholder="댓글을 남겨주세요." style="resize: none; width:95%; background-color : black; color:white;"></textarea>
														</form>
														
														<!-- 글자 수 -->
														<div class="byte" style="float:right; font-size:12px; color:darkgray;">
															<text id="commentByte">0</text><text id="slash"> / </text><text id="maxByte">500</text>
														</div>
			
														
													</div>
													<div class="reply_button" style="height:100%;">
														<button class="btn mb-2 btn-primary" id="insertComment" type="button" 
														style="font-weight: 300; font-size: 20px; width:150%; position:relative; left:-20px;">작성</button>
													</div>
												</div>
											</div>
											
											<c:forEach items="${commentList}" var="co">
												<c:if test="${co.comm_Level eq 1}">
												<div id="${co.comm_No }" class="wrap-comment comment-area">
													<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq notice.mem_no }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">작성자</text></c:if></p>
													<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="width:100%; overflow:auto; background-color: black; color:white;">${co.comm_Content }</textarea></p>
													<div class="wrap-info">
													
														<span class="date"> <i class="far fa-clock"></i>
														<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
														<!-- <a class="cmt" href="#" onclick="reComment(this);return false;"> <i class="far fa-comment"> </i> 대댓글 -->
														</a>
														<div class="info_fnc">
																<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
													      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
														  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
														  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
															<c:if test="${member.memNo eq co.mem_No}">
																<!-- <a href="#" onclick="updateComment(this);return false;">수정</a> -->
																<a href="#" class="updateConfirm" onclick="updateConfirm(this);" >수정완료</a>												
																<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&comm_No=${co.comm_No }'">삭제</a>
															</c:if>
															
															<%-- <c:if test="${member.memNo ne co.mem_No}">
															<span class="reportBtn_comment" id="reportBtn_comment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
																<!-- ----------------------- 댓글신고정보 by 은열 ------------------------------ -->
																<input type="hidden" class="board_comment_info" value="${co.comm_No }">
																<input type="hidden" class="board_comment_mem_no" value="${co.mem_No }">
																<input type="hidden" class="board_comment_reporter" value="${member }">
																<!-- ----------------------------------------------------- -->
															</c:if> --%>
														</div>
													</div>
												</div>
											</c:if>
												
											<!-- 대댓글일때 -->
											<%-- <c:if test="${co.comm_Level ne 1}">
												<div class="wrap-reply">
													<div id="${co.comm_No }" class="wrap-comment comment-area">
														<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq notice.mem_no }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">작성자</text></c:if></p>
														<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="width:100%;overflow:auto; background-color:black; color:white;">${co.comm_Content }</textarea></p>
														<div class="wrap-info">
														
														<span class="date"> <i class="far fa-clock"></i>
														<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
															<div class="info_fnc">
																	<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
														      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
															  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
															  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
																<c:if test="${member.memNo eq co.mem_No}">
																	<a href="#" onclick="updateComment(this);return false;">수정</a>
																	<a href="#" class="updateConfirm" onclick="updateConfirm(this);" style="display:none;" >수정완료</a>												
																	<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&comm_No=${co.comm_No }'">삭제</a>
																</c:if>
																<c:if test="${member.memNo ne co.mem_No}">
																<span class="reportBtn_cocomment" id="reportBtn_cocomment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
																<!-- ----------------------- 대댓글신고정보 by 은열 ------------------------------ -->
																<input type="hidden" class="board_cocomment_info" value="${co.comm_No }">
																<input type="hidden" class="board_cocomment_mem_no" value="${co.mem_No }">
																<input type="hidden" class="board_cocomment_reporter" value="${member }">
																<!-- ----------------------------------------------------- -->
																</c:if>	
															</div>
														</div>
													</div>
												</div>
											</c:if>	 --%>		
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
	function goUpdate(board_no) {
		location.href="${pageContext.request.contextPath}/admin/mentoUpdateForm.bo?board_no=" + board_no;
	}
	
	function deleteMento(board_no) {
		location.href="${pageContext.request.contextPath}/admin/deleteMento.bo?board_no=" + board_no;
	}
	
	$(function(){
		
		$("#notice").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/noticeList.bo";
		});
		
		$("#adminNotice").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/adminNotice.bo";
		});
	});
	
	$(function(){
		$(".goBoard").on("click", function(){
			var board_No = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/admin/mentoView.bo?board_no="+ board_No;
		});
	});

</script>
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
	<script src="${pageContext.request.contextPath}/resources/admin/js/apps.js"></script>
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

    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
</body>
</html>