<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 | 공지 작성</title>

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
						<h2 class="page-title">NOTICE WRITE</h2>
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
													<th>상태</th>
													<th>활성화여부</th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<th>asdf</th>
													<th>asdf</th>
													<th>asdf</th>
													<th>asdf</th>
													<th>asdf</th>
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
											<button class="btn mb-2 btn-primary">수정</button>&nbsp;
											<button class="btn mb-2 btn-primary">삭제</button>
										</div>
											
										<div class="basicInfo">
											<h2>제에에에모오오오옥</h2>
											<br /><hr />
											<div>
												awefjkl;asdfjkl;asdfjkl;asdfjkl;asdfjkl;
											</div>
										</div>
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
			location.href = "${pageContext.request.contextPath}/noticeView.bo?board_no="+ board_No;
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