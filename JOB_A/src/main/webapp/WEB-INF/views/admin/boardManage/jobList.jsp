<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리 | 채용공고</title>

<style>
	.tab {
		display: inline-block;
		padding-right: 10px;
	}
	
	
	#job {
		font-weight:800;
	}
	
	#utilBox {
		width : 100%;
		height : 50px;
		margin-top : 20px;
		margin-bottom: 10px;
	}
	
	#searchBox {
		width : 35%;
		height : 100%;
		float : left;
		margin-right : 10px;
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
							<div class="tab"><p id="job" class="btn mb-2 btn-primary">채용공고</p></div>
							<div class="tab"><p id="blahblah" class="btn mb-2 btn-primary">블라블라</p></div>
							<div class="tab"><p id="blind" class="btn mb-2 btn-primary">블라인드</p></div>
							<div class="tab"><p id="tomo" class="btn mb-2 btn-primary">언틸 투모로우</p></div>
							<div class="tab"><p id="qna" class="btn mb-2 btn-primary">레벨업</p></div>
							<div class="tab"><p id="accept" class="btn mb-2 btn-primary">합격후기</p></div>
							<div class="tab"><p id="interview" class="btn mb-2 btn-primary">면접후기</p></div>
							<div class="tab"><p id="mento" class="btn mb-2 btn-primary">멘토&멘티</p></div>
						</div>
						

						
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
										<!-- 검색 -->
<%-- 					  					<div id="utilBox">
											<div id="searchBox">
												<input type="search" class="form-control" id="search" placeholder="검색내용을 입력해주세요."
													style="height:37px;" onKeyDown="enterKey();" />
											</div>
											<button type="button" class="btn mb-2 btn-light" id="searchBtn" onclick="search()"
											style="width: 50px;"><span class="fe fe-24 fe-search" style="margin: -9px; font-size: 20px;"></span></button>
											<button type="button" class="btn mb-2 btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/jobList.do'"
											style="width: 50px;"><span class="fe fe-24 fe-rotate-cw" style="margin: -9px; font-size: 20px;"></span></button>
										</div> --%>
											
										<!-- 테이블 -->
										<table class="table table-hover"
											align="center" id="dataTable-1">
											<thead>
												<tr align="center" role="row">
													<th>No.</th>
													<th>직무</th>
													<th width="40%">제목</th>
													<th>작성자</th>
													<th>등록일</th>
													<th width="8%">조회수</th>
													<th>상태</th>
													<th width="10%"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${jobList }" var="job">
													<tr align="center" class="trtr">
														<td>${job.board_No}</td>
														<td>${job.category_Name }</td>
														<td class="goBoard" id="${job.board_No }">${job.board_Title}</td>
														<td>${job.mem_Nick}</td>
														<td>${job.board_Date}</td>
														<td>${job.board_View}</td>
														<td><c:if test="${job.board_Status eq 'Y'}">
																<span class='badge badge-success'>정상</span>
															</c:if> <c:if test="${job.board_Status eq 'B'}">
																<span class='badge badge-danger'>블라인드</span>
															</c:if>  <c:if test="${job.board_Status eq 'N'}">
																<span class='badge badge-secondary'>삭제</span>
															</c:if> </td>
														<td>
																<c:if test="${job.board_Status eq 'Y' }">
																	<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																		onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusB.do?board_No=${job.board_No}&type_No=${job.type_No }'">블라인드</button>
																</c:if>
																<c:if test="${job.board_Status eq 'B' }">
																	<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																		onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusY.do?board_No=${job.board_No}&type_No=${job.type_No }'">활성화</button>
																</c:if>
																<c:if test="${job.board_Status eq 'N'}">
																	<button class="btn mb-2 btn-light" disabled="disabled">활성화</button>
																</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<br>
										
<%-- 										<!-- 페이징처리 -->
										<div align="center">
											<c:out value="${pageBar}" escapeXml="false" />
										</div> --%>
										
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
/* 
 	function search() {
		location.href="${pageContext.request.contextPath}/admin/searchJobList.do?keyword="+$('#search').val();

	}
	
	function enterKey() {
			if (event.keyCode==13){
				location.href="${pageContext.request.contextPath}/admin/searchJobList.do?keyword="+$('#search').val();
			}
		
		} */
	
	$(function(){
		$(".goBoard").on("click", function(){
			var board_No = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No="+ board_No;
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