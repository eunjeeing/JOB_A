<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>등업 리스트</title>
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
						<h2 class="page-title">등업 리스트</h2>
						<div class="row">
							<div class="col-md-12 my-4">
								<div class="card shadow">
									<div class="card-body">

										<!-- table -->
										<table class="table table-hover datatables" id="dataTable-1">
											<thead>
												<tr role="row">
													<th>No.</th>
													<th>제목</th>
													<th>작성자</th>
													<th>등록일</th>
													<th>활동내역으로 이동</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${gradeList}" var="g">
													<tr >
														<td  id="boardNo" >
															${g.board_No}
														</td>
														<td style="cursor: pointer;" onclick="boardDetail(${g.board_No})">${g.board_Title}</td>
														<td>${g.mem_Nick}</td>
														<td>${g.board_Date}</td>
														<td>
															<a style="text-decoration: none;" href="${pageContext.request.contextPath}/user/userDetail?memNo=${g.mem_No}">&nbsp;<span style="color: #6c757d" class="fe fe-file-text fe-24 mr-2"></span></a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
	function boardDetail(boardNo) {
			var popUrl = "${pageContext.request.contextPath}/user/selectBoardDetail?boardNo=" + boardNo;
			var popOption = "width=700, height=600, resizable=no, scrollbars=no, status=no;";

			window.open(popUrl, "", popOption);
		}
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
    
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
</body>
</html>