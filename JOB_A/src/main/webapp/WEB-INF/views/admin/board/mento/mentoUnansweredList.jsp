<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리 | 멘토&멘티</title>

<style>
	.tab {
		display: inline-block;
		padding-right: 10px;
	}
	
	#mento {
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
		<c:import url="../../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../../common/sidebar.jsp" />
		
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<h2 class="page-title">MENTO UNANSWERED LIST</h2>
						<br />
						
						<!-- 탭 -->
						<div class="tab-div">
							<div class="tab"><p id="total" class="btn mb-2 btn-outline-primary">전체</p></div>
							<div class="tab"><p id="answered" class="btn mb-2 btn-outline-primary">답변완료</p></div>
							<div class="tab"><p id="unanswered" class="btn mb-2 btn-primary">답변미완료</p></div>
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
													<th width="8%">답변상태</th>
													<th>상태</th>
													<th width="10%"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${mentoUnansweredList }" var="mento">
													<tr align="center" class="trtr">
														<td>${mento.board_no}</td>
														<td class="goBoard" id="${mento.board_no }">${mento.board_title}</td>
														<td>${mento.mem_nick}</td>
														<td>${mento.board_date}</td>
														<td>${mento.board_view}</td>
														<th>
														<c:if test="${mento.comm_count > 0}">
															<span class='badge badge-success'>완료</span>
														</c:if>
														<c:if test="${mento.comm_count == 0}">
															<span class='badge badge-secondary'>미완료</span>
														</c:if>
														</th>
														<td><c:if test="${mento.board_status eq 'Y'}">
																<span class='badge badge-success'>정상</span>
															</c:if> <c:if test="${mento.board_status eq 'B'}">
																<span class='badge badge-danger'>블라인드</span>
															</c:if>  <c:if test="${mento.board_status eq 'N'}">
																<span class='badge badge-secondary'>삭제</span>
															</c:if> </td>
														<td>
																<c:if test="${mento.board_status eq 'Y' }">
																	<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																		onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusB.do?board_No=${mento.board_no}&type_No=${mento.type_no }'">블라인드</button>
																</c:if>
																<c:if test="${mento.board_status eq 'B' }">
																	<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																		onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusY.do?board_No=${mento.board_no}&type_No=${mento.type_no }'">활성화</button>
																</c:if>
																<c:if test="${mento.board_status eq 'N'}">
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
		
		$("#total").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/mentoTotalList.bo";
		});
		
		$("#answered").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/mentoAnsweredList.bo";
		});

		$("#unanswered").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/mentoUnansweredList.bo";
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

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<!-- <script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
	<script>
      	window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-56159088-1');

    </script> -->
</body>
</html>