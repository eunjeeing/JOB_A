<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>신고 게시글 상세 페이지</title>
<style>

	#reporterInfor{
		width: 80%;
		height: 100%;
		border: 1px solid black;
		displagy : inline;
	}
	
</style>
</head>
<body class="vertical  dark  ">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />

		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<h2 class="mb-2 page-title">BOARD REPORT</h2>
						<div class="row">
							<!-- Striped rows -->
							<div class="col-md-12 my-4">
								<div class="card shadow">
									<div class="card-body">
										
										<!-- 상세 페이지 시작 -->
										<div id="reporterInfor">
											<div id="reporter">
												<h3>신고자</h3>
												<p>${reporterMemNick}</p>
											</div>
											
											<div id="reportReason">
												<h3>신고사유</h3>
												<p>${reportReason}</p>
											</div>
											<div>
												<h3>상태</h3>
																	<b>비활성화</b>
														<div class="custom-control custom-switch">
														<c:if test="${boardList.board_Status eq 'Y'}">
															<input type="checkbox" class="custom-control-input" 
																	id="${boardList.board_No}" name="statusY" checked>
															<label class="custom-control-label"
															 for="${boardList.board_No}"></label>
														</c:if>
														
														<c:if test="${boardList.board_Status eq 'N'}">
															<input type="checkbox" class="custom-control-input" 
																id="${boardList.board_No}" >
															<label class="custom-control-label"
																for="${boardList.board_No}"></label>
															</c:if>	 															
														</div>
															<b>활성화</b>
											</div>
										</div>
										
										<div>
											<table>
												<tr>
													<th>게시판</th>
														<td>${boardType}</td>
												</tr>
												<tr>
													<th>게시일</th>
													<td>${boardList.board_Date} </td>
												</tr>
												<tr>
													<th>게시글 작성자</th>
													<td>${appendantMemNick} </td>
												</tr>
											</table>
										</div>
										
										<div>
											<span>${boardList.board_Title}</span>
											<div>${boardList.board_Content}</div>
										</div>
										
										
									</div>
								</div>
							</div>
							<!-- simple table -->
						</div>
						<!-- end section -->

					</div>
					<!-- .col-12 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container-fluid -->


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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 
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
		
		// 활성화 ture 비활성화 false
		$(".custom-control-input").click(function(){
				var status = "${boardList.board_Status}";
				console.log("status"+ status);
				var test = $(".custom-control-input").is(":checked");
				if(status == "Y" && test == false){
						console.log("트루임");
						//비활성화(n)로 바꿔야함
						location.href="${pageContext.request.contextPath}/boardReportUpdate.do?boardNo=${boardList.board_No}&boardStatus=N"; 
					}else if(status == "N" && test == true){
						console.log("여기는 비활>활성화로");
						//활성화(Y)로 해야함
						location.href="${pageContext.request.contextPath}/boardReportUpdate.do?boardNo=${boardList.board_No}&boardStatus=Y"; 
						}
			});

		</script>

</body>
</html>