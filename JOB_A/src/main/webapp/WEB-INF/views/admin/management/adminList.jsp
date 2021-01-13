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
																<div class="dropdown">
									                                <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									                                  <span class="text-muted sr-only">Action</span>
									                                </button>
									                                <div class="dropdown-menu dropdown-menu-right">
									                                  <a class="dropdown-item" data-toggle="modal" data-target="#moveDe" href="#">직급 변경</a>
																	 <a class="dropdown-item" data-toggle="modal" data-target="#delete" href="#">관리자 삭제</a>

									                                </div>
									                        	</div>
									                        	<input type="hidden" id="adminNo" value="${a.adminNo}">
															</td>
															<div class="modal fade" id="moveDe" tabindex="-1" role="dialog"  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																<div class="modal-dialog modal-dialog-centered" role="document">
																	<!--Content-->
																	<div class="modal-content">
																		<div class="modal-header text-center">
																			<h5 class="modal-title w-100 font-weight-bold py-2">
																				<strong><span>직급 변경</span></strong>
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
																						<select name="gradeNo" class="form-control select2" >
																							<option value="" disabled selected>직급 변경</option>
																							<option value="1">일반 관리자</option>
																							<option value="5">인사 담당자</option>
																						</select>
																						<input type="hidden" name="adminId" value="${a.adminId}">
																						<input type="hidden" name="adminPw" value="${a.adminPw}">
																						<input type="hidden" name="adminNick" value="${a.adminNick}">
																						<input type="hidden" name="adminPhone" value="${a.adminPhone}">
																					</div>
																				</div>	
																			</div>
																			<div class="modal-footer">
																				<button type="submit" class="btn-save btn btn-primary">변경</button>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
															<div class="modal fade" id="delete" tabindex="-1" role="dialog"  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																<div class="modal-dialog modal-dialog-centered" role="document">
																	<!--Content-->
																	<div class="modal-content">
																		<div class="modal-header text-center">
																			<h5 class="modal-title w-100 font-weight-bold py-2">
																				<strong>관리자 삭제 ( ◜◡＾)っ✂</strong>
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
																						 ${a.adminName} 사원을 관리자 목록에서 삭제하시겠습니까?
																						<input type="hidden" name="adminId" value="${a.adminNo}">
																					</div>
																				</div>	
																			</div>
																			<div class="modal-footer">
																				<button type="submit" class="btn-save btn btn-primary">삭제</button>
																				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
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

	<script>
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