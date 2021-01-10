<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 목록</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


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
						<h2 class="mb-2 page-title">관리자 리스트</h2>
						<div class="row my-4">
							<!-- Small table -->
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
										<!-- <div class="row" style="float: right">
											<select class="form-control custom-select" style="width: 25%"
												id="searchCondition" name="searchCondition">
												<option value="">-----</option>
												<option value="adminName">이름</option>
												<option value="adminNick">닉네임</option>
											</select>
											<div class="input-group"
												style="width: 60%; margin-left: 20px;">
												<input type="search" id="keyword" class="form-control"
													style="width: 70%">
												<button type="button" class="btn btn-primary"
													onclick="return search();">검색</button>
											</div>
										</div> -->
										<!-- table -->
										<table class="table datatables" id="dataTable-1">
											<thead>
												<tr>
													<th></th>
													<th>직급</th>
													<th>사번</th>
													<th>이름</th>
													<th>닉네임</th>
													<th>이메일</th>
													<th>연락처</th>
													<th>등록날짜</th>
													<c:if test="${member.gradeNo eq 0}">
														<th>Action</th>
													</c:if>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${adminList}" var="a">
													<tr>
														<td>
															<div class="custom-control custom-checkbox">
																<input type="checkbox" class="custom-control-input">
																<label class="custom-control-label"></label>
															</div>
														</td>
														<td>
															<c:if test="${a.gradeNo eq 1}">일반관리자</c:if>
														</td>
														<td><span>${a.adminId}</span></td>
														<th scope="col">${a.adminName}</th>
														<td><span>${a.adminNick}</span></td>
														<td>${a.adminEmail}</td>
														<td><span>${a.adminPhone}</span></td>
														<td><span>${a.enrollDate}</span></td>
														<c:if test="${member.gradeNo eq 0}">
															<td>
																<button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="text-muted sr-only">Action</span>
																</button>
																<div class="dropdown-menu dropdown-menu-right">
																	<a class="dropdown-item" href="#">Edit</a>
																	<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminDelete?adminNo=${a.adminNo}">Remove</a>
																	<a class="dropdown-item" href="#">Assign</a>
																</div>
															</td>
														</c:if>
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

	<script
		src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>

	
	<script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
	<!-- <script type="text/javascript">

		function search(){
			var searchKey = $("#keyword").val();
			var searchCdt = $("#searchCondition").val();
			
			if(searchKey == ""){
				Swal.fire({
	                title: "ʕ⁰̈●̫⁰̈ʔ..이러면 아모고토 검색할수가 없지",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else if(searchCdt == ""){
				Swal.fire({
	                title: "ʕʘ●̫ʘʔ..근데 뭘로 검색해?",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else {
				location.href="${pageContext.request.contextPath}/admin/Search?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();	
			}
			
		}
	</script> -->
</body>
</html>