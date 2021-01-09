<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수정</title>
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
										<strong class="card-title">관리자 수정</strong>
									</div>
									<div class="card-body">
										<form action="${pageContext.request.contextPath }/admin/adminUpdate" method="post">
											<div class="form-group row">
												<label for="adminId" class="col-sm-3 col-form-label">사번</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="adminId"
														name="adminId" value="${admin.adminId}" readonly="readonly">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminPw" class="col-sm-3 col-form-label">비밀번호</label>
												<div class="col-sm-9">
													<input type="password" class="form-control" id="adminPw"
														name="adminPw" size="20" required>
												</div>
											</div>
											<div class="form-group row">
												<label for="adminPw2" class="col-sm-3 col-form-label">비밀번호 확인</label>
												<div class="col-sm-9">
													<input type="password" class="form-control" id="adminPw2" size="20" required>
												</div>
											</div>
											<div class="form-group row">
												<label for="adminName" class="col-sm-3 col-form-label">이름</label>
												<div class="col-sm-9">
													<input class="form-control" id="adminName" type="text"
														name="adminName" value="${admin.adminName}" readonly="readonly">
												</div>
											</div>
											<div class="form-group row">
												<label for="adminNick" class="col-sm-3 col-form-label">닉네임</label>
												<div class="col-sm-9">
													<input class="form-control" id="adminNick" type="text"
														name="adminNick" value="${admin.adminNick}" readonly="readonly">
												</div>
											</div>
											<fieldset class="form-group">
												<div class="row">
													<label for="adminPhone"
														class="col-form-label col-sm-3 pt-0">연락처</label>
													<div class="col-sm-9">
														<input class="form-control input-phoneus" id="adminPhone" 
															name="adminPhone" maxlength="14" value="${admin.adminPhone}" required>
													</div>
												</div>
											</fieldset>
											<div class="form-group row">
												<label for="adminEmail" class="col-sm-3 col-form-label">이메일</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="adminEmail"
														name="adminEmail" value="${admin.adminEmail}" readonly="readonly">
												</div>
											</div>
											<div>
												<input type="hidden" name="gradeNo" value="1" />
											</div>
											
											<div class="form-group mb-2">
												<button type="submit" class="btn btn-primary">수정</button>
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
		

		$('.input-phoneus').mask('000-0000-0000');
	</script>
</body>
</html>