<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리 | 블라블라</title>

<style>
	.tab {
		display: inline-block;
		padding-right: 10px;
	}
	
	p {
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
	}
	
	#blahblah {
		font-weight:800;
	}
	
	.goBoard:hover{
		cursor:pointer;
	}
	
	.trtr:hover{
		background: #EAEAEA;
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
						<h2 class="page-title">BOARD LIST</h2>
						<br />
						
						<!-- 탭 -->
						<div class="tab-div">
							<div class="tab"><p id="job">채용공고</p></div>
							<div class="tab"><p id="blahblah">블라블라</p></div>
							<div class="tab"><p id="blind">블라인드</p></div>
							<div class="tab"><p id="tomo">언틸 투모로우</p></div>
							<div class="tab"><p id="qna">Q&A</p></div>
							<div class="tab"><p id="accept">합격후기</p></div>
							<div class="tab"><p id="interview">면접후기</p></div>
							<div class="tab"><p id="mento">멘토&멘티</p></div>
						</div>
						

						
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
											
										<!-- 테이블 -->
										<table class="table table-hover"
											align="center" id="dataTable-1">
											<thead>
												<tr align="center" role="row">
													<th>No.</th>
													<th width="40%">제목</th>
													<th>작성자</th>
													<th>등록일</th>
													<th width="8%">조회수</th>
													<th>상태</th>
													<th width="10%"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${blahList }" var="blah">
													<tr align="center" class="trtr">
														<td>${blah.board_No}</td>
														<td class="goBoard" id="${blah.board_No }">${blah.board_Title}</td>
														<td>${blah.mem_Nick}</td>
														<td>${blah.board_Date}</td>
														<td>${blah.board_View}</td>
														<td><c:if test="${blah.board_Status eq 'Y'}">
																<span class='badge badge-success'>정상</span>
															</c:if> <c:if test="${blah.board_Status eq 'B'}">
																<span class='badge badge-danger'>블라인드</span>
															</c:if>  <c:if test="${blah.board_Status eq 'N'}">
																<span class='badge badge-secondary'>삭제</span>
															</c:if> </td>
														<td>
																<c:if test="${blah.board_Status eq 'Y' }">
																	<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																		onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusB.do?board_No=${blah.board_No}&type_No=${blah.type_No }'">블라인드</button>
																</c:if>
																<c:if test="${blah.board_Status eq 'B' }">
																	<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																		onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusY.do?board_No=${blah.board_No}&type_No=${blah.type_No }'">활성화</button>
																</c:if>
																<c:if test="${blah.board_Status eq 'N'}">
																	<button class="btn mb-2 btn-light" disabled="disabled">활성화</button>
																</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<br>
										
									</div>
								</div>
							</div>
							<!-- Bordered table -->
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
	$(function(){
		
		$("#job").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/jobList.do";
		});
		
		$("#blahblah").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/blahList.do";
		});

		$("#blind").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/blindList.do";
		});

		$("#tomo").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/tomoList.do";
		});

		$("#qna").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/qnaList.do";
		});

		$("#accept").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/acceptList.do";
		});

		$("#interview").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/interviewList.do";
		});

		$("#mento").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/mentoList.do";
		});
		
	});
	
	$(function(){
		$(".goBoard").on("click", function(){
			var board_No = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="+ board_No;
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
</body>
</html>