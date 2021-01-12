<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>회원 리스트</title>
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
						<h2 class="mb-2 page-title">회원 리스트</h2>
						<div class="row">
							<!-- Striped rows -->
							<div class="col-md-12 my-4">
								<div class="card shadow">
									<div class="card-body">
										
										<!-- table -->
										<table class="table table-hover datatables" id="dataTable-1">
											<thead>
												<tr role="row">
													<th>회원 번호</th>
													<th>등급</th>
													<th>아이디</th>
													<th>닉네임</th>
													<th>이메일</th>
													<th>생년월일</th>
													<th>가입일</th>
													<th>상태</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${memberList}" var="m">
													<tr>
														<td>${m.memNo}</td>
														<td><c:if test="${m.gradeNo eq 2}">일반회원</c:if>
															<c:if test="${m.gradeNo eq 3}">우수회원</c:if>
															<c:if test="${m.gradeNo eq 4}">최우수회원</c:if> 
															<c:if test="${m.gradeNo eq 5}">인사담당자</c:if></td>
														<td>${m.memId}</td>
														<td>${m.memNick}</td>
														<td>${m.memEmail}</td>
														<td>${m.memBirth}</td>
														<td>${m.memDate}</td>
														<td><c:if test="${m.memState eq 0}">
																<span class='badge badge-success'>클린회원</span></c:if> 
															<c:if test="${m.memState eq 1}">
																<span class='badge badge-warning'>블랙리스트</span></c:if> 
															<c:if test="${m.memState eq 2}">
																<span class='badge badge-danger'>블라인드</span></c:if>
														</td>
														<td>
															<a class="" href="${pageContext.request.contextPath}/user/userDetail?memNo=${m.memNo}">활동내역</a>
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

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-56159088-1');


      	function(toggle(e)) {
			console.log(e.checked)
      	}
    </script>

<!-- 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript">

		function search(){
			var searchKey = $("#search").val();
			var searchCon = $("#inlineFormCustomSelectPref").val();
			
			if(searchKey == ""){
				Swal.fire({
	                title: "ʕ⁰̈●̫⁰̈ʔ..이러면 아모고토 검색할수가 없지",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else if(searchCon == ""){
				Swal.fire({
	                title: "ʕʘ●̫ʘʔ..근데 뭘로 검색해?",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else {
				location.href="${pageContext.request.contextPath}/user/userSearch?condition="+$('#inlineFormCustomSelectPref').val()+"&keyword="+$('#search').val();	
			}
			
		}
	</script> -->
</body>
</html>