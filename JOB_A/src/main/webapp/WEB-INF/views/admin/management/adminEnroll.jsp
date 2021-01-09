<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록</title>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
<body class="vertical  dark  ">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />
		<section>
			<main role="main" class="main-content">
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-12">
							<div class="card-deck">
								<div class="card shadow mb-4">
									<div class="card-header">
										<strong class="card-title">관리자 등록</strong>
									</div>
									<div class="card-body">
										<form action="${pageContext.request.contextPath }/admin/adminEnroll" method="post">
											<div class="form-group row">
												<label for="adminId" class="col-sm-3 col-form-label">사번</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="adminId"
														name="adminId" onkeyup="enroll(this.value)">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminPw" class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-9">
													<input type="password" class="form-control" id="adminPw"
														name="adminPw" placeholder="초기 비밀번호는 사번으로 설정됩니다">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminName" class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-9">
													<input class="form-control" id="adminName" type="text"
														name="adminName">
												</div>
											</div>
											<fieldset class="form-group">
												<div class="row">
													<label for="adminPhone"
														class="col-form-label col-sm-3 pt-0">연락처</label>
													<div class="col-sm-9">
														<input class="form-control input-phoneus" id="adminPhone" name="adminPhone" maxlength="14" required>
													</div>
												</div>
											</fieldset>
											<div class="form-group row">
												<label for="adminEmail" class="col-sm-3 col-form-label">이메일</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="adminEmail"
														name="adminEmail" placeholder="사번이 아이디로 사용됩니다">@job-jo8a.com
												</div>
											</div>
											<div>
												<input type="hidden" name="gradeNo" value="1" />
											</div>
											
											<div class="form-group mb-2">
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</section>
	</div>

	<script>
		// 같은값 입력받기
		function enroll(val) {
			document.getElementById('adminPw').value = val;
			document.getElementById('adminEmail').value = val;
		}

		$('.input-phoneus').mask('000-0000-0000');
	</script>
</body>
</html>