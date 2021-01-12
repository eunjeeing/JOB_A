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
										<table class="table table-hover datatables" id="dataTable-1">
											<thead>
												<tr>
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
															<c:if test="${a.gradeNo eq 1}">일반 관리자</c:if>
															<c:if test="${a.gradeNo eq 5}">인사 담당자</c:if>
														</td>
														<td><span>${a.adminId}</span></td>
														<th scope="col">${a.adminName}</th>
														<td><span>${a.adminNick}</span></td>
														<td>${a.adminEmail}</td>
														<td><span>${a.adminPhone}</span></td>
														<td><span>${a.enrollDate}</span></td>
														<c:if test="${member.gradeNo eq 0}">
															<td>
																<input type="hidden" id="adminListId" value="${a.adminId}">
																<div class="dropdown">
									                                <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									                                  <span class="text-muted sr-only">Action</span>
									                                </button>
									                                <div class="dropdown-menu dropdown-menu-right">
									                                  <a class="dropdown-item" data-toggle="modal" data-target="#moveDe" href="#">부서 이동</a>
																	  <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminDelete?adminNo=${a.adminNo}">관리자 삭제</a>
									                                </div>
									                              </div>
																<button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="text-muted sr-only">Action</span>
																</button>
																<div class="dropdown-menu dropdown-menu-right">
																	<a class="dropdown-item" href="#">Edit</a>
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
							
							<div class="modal fade" id="moveDe" tabindex="-1" role="dialog"  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<!--Content-->
							<div class="modal-content">
								<div class="modal-header text-center">
									<h5 class="modal-title w-100 font-weight-bold py-2">
										<strong><span>부서 이동</span></strong>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<!--Body-->
	   							<form id="changeGrade" action="${pageContext.request.contextPath}/admin/adminUpdate" method="post">
									<div class="modal-body">
										<div class="row">
											<div class="col">
												<select name="gradeNo" class="mdb-select md-form colorful-select dropdown-danger" >
													<option value="" disabled selected>부서 선택</option>
													<option value="1">일반 관리자</option>
													<option value="5">인사 담당자</option>
												</select>
												<input type="hidden" name="adminId" value="">
											</div>
										</div>	
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn-save btn btn-primary btn-sm">변경</button>
									</div>
								</form>
							</div>
						</div>
					</div>
						</div>
						
						<div class="modal fade" id="grade" tabindex="-1" role="dialog"  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<!--Content-->
							<div class="modal-content">
								<div class="modal-header text-center">
									<h5 class="modal-title w-100 font-weight-bold py-2">
										<strong><span>등급 변경하기</span></strong>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<!--Body-->
	   							<form id="changeGrade" action="${pageContext.request.contextPath }/user/changeGrade" method="post">
									<div class="modal-body">
										<div class="row">
											<div class="col">
												<select name="gradeNo" class="mdb-select md-form colorful-select dropdown-danger" >
													<option value="" disabled selected>등급 선택</option>
													<option value="2">일반 회원</option>
													<option value="3">우수 회원</option>
													<option value="4">최우수 회원</option>
												</select>
												<input type="hidden" name="memNo" value="${user[0].memNo }">
											</div>
										</div>	
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn-save btn btn-primary btn-sm">변경</button>
									</div>
								</form>
							</div>
						</div>
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