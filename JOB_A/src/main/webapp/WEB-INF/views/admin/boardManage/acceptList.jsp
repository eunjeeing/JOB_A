<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리 | 합격후기</title>
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
	
	#accept {
		font-weight:800;
	}
</style>
</head>
<body class="vertical  dark">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />
		
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<h2 class="page-title">BOARD LIST</h2>
						<br />
						
						<!-- 탭 -->
						<div class="tab-div">
							<div class="tab"><p id="job">채용공고</p></div>
							<div class="tab"><p id="blahblah">블라블라</p></div>
							<div class="tab"><p id="blind">블라인드</p></div>
							<div class="tab"><p id="tomo">언틸 투모로우</p></div>
							<div class="tab"><p id="qna">Q&A</p></div>
							<div class="tab"><p id="accept">합격후기</p></div>
							<div class="tab"><p id="interview">면접후기</p></div>
							<div class="tab"><p id="mento">멘토&멘티</p></div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
									
										<table class="table table-bordered table-hover mb-0"
											align="center">
											<thead>
												<tr align="center">
													<th>번호</th>
													<th width="40%">제목</th>
													<th>작성자</th>
													<th>등록일</th>
													<th>조회수</th>
													<th>상태</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${acceptList }" var="accept">
													<tr align="center">
														<td>${accept.board_No}</td>
														<td>${accept.board_Title}</td>
														<td>${accept.mem_Nick}</td>
														<td>${accept.board_Date}</td>
														<td>${accept.board_View}</td>
														<td><c:if test="${accept.board_Status eq 'Y'}">
																<span class='badge badge-success'>정상</span>
															</c:if> <c:if test="${accept.board_Status eq 'N'}">
																<span class='badge badge-secondary'>삭제</span>
															</c:if> <c:if test="${accept.board_Status eq 'B'}">
																<span class='badge badge-danger'>블라인드</span>
															</c:if></td>
														<td>
															<div class="custom-control custom-switch">
															<!-- 체크박스 활성화 조건주기 -->
																<c:if test="${accept.board_Status eq 'Y'}">
																	<input type="checkbox" class="custom-control-input"
																		id="${accept.board_No}" checked>
																	<label class="custom-control-label"
																		for="${accept.board_No}"></label>
 																</c:if>
																<c:if
																	test="${accept.board_Status eq 'B'}">
																	<input type="checkbox" class="custom-control-input"
																		id="${accept.board_No}">
																	<label class="custom-control-label"
																		for="${accept.board_No}"></label>
																</c:if>
																<c:if
																	test="${accept.board_Status eq 'N'}">
																	<input type="checkbox" class="custom-control-input"
																		id="${accept.board_No}"  disabled="disabled">
																	<label class="custom-control-label"
																		for="${accept.board_No}"></label>
																</c:if>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<br>
										
										<!-- 페이징처리 -->
										<div align="center">
											<c:out value="${pageBar}" escapeXml="false" />
										</div>
										
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
		
		$("#job").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/jobList.do";
		});
		
		$("#blahblah").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/blahList.do";
		});
	
		$("#blind").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/blindList.do";
		});
	
		$("#tomo").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/tomoList.do";
		});
	
		$("#qna").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/qnaList.do";
		});
	
		$("#accept").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/acceptList.do";
		});
	
		$("#interview").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/interviewList.do";
		});
	
		$("#mento").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/mentoList.do";
		});
		
	});
</script>
</body>
</html>