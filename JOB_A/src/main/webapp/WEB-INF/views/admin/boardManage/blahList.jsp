<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리 | 블라블라</title>
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
	
	#blahblah {
		font-weight:800;
	}
	
	#utilBox {
		width : 100%;
		height : 50px;
		margin-top : 20px;
	}
	
	#searchBox {
		width : 35%;
		height : 100%;
		float : left;
		margin-right : 10px;
	}
	
	.goBoard:hover{
		cursor:pointer;
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
										<!-- 검색 -->
					  					<div id="utilBox">
											<div id="searchBox">
												<input type="search" class="form-control" id="search" placeholder="검색내용을 입력해주세요."
													style="height:37px;" onKeyDown="enterKey();" />
											</div>
											<button type="button" class="btn mb-2 btn-light" id="searchBtn" onclick="search()"
											style="width: 50px;"><span class="fe fe-24 fe-search" style="margin: -9px; font-size: 20px;"></span></button>
											<button type="button" class="btn mb-2 btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/blahList.do'"
											style="width: 50px;"><span class="fe fe-24 fe-rotate-cw" style="margin: -9px; font-size: 20px;"></span></button>
										</div>
											
										<!-- 테이블 -->
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
													<th>활성화</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${blahList }" var="blah">
													<tr align="center">
														<td>${blah.board_No}</td>
														<td class="goBoard" id="${job.board_No }">${blah.board_Title}</td>
														<td>${blah.mem_Nick}</td>
														<td>${blah.board_Date}</td>
														<td>${blah.board_View}</td>
														<td><c:if test="${blah.board_Status eq 'Y'}">
																<span class='badge badge-success'>정상</span>
															</c:if> <c:if test="${blah.board_Status eq 'N'}">
																<span class='badge badge-secondary'>삭제</span>
															</c:if> <c:if test="${blah.board_Status eq 'B'}">
																<span class='badge badge-danger'>블라인드</span>
															</c:if></td>
														<td>
															<div class="custom-control custom-switch">
															<!-- 체크박스 활성화 조건주기 -->
																<c:if test="${blah.board_Status eq 'Y'}">
																	<input type="checkbox" class="custom-control-input"
																		id="${blah.board_No}" name="statusY" checked>
																	<label class="custom-control-label"
																		for="${blah.board_No}"></label>
 																</c:if>
																<c:if
																	test="${blah.board_Status eq 'B'}">
																	<input type="checkbox" class="custom-control-input"
																		id="${blah.board_No}" name="statusB">
																	<label class="custom-control-label"
																		for="${blah.board_No}"></label>
																</c:if>
																<c:if
																	test="${blah.board_Status eq 'N'}">
																	<input type="checkbox" class="custom-control-input"
																		id="${blah.board_No}" disabled="disabled">
																	<label class="custom-control-label"
																		for="${blah.board_No}"></label>
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

 	function search() {
		location.href="${pageContext.request.contextPath}/admin/searchJobList.do?keyword="+$('#search').val();

	}
	
	function enterKey() {
			if (event.keyCode==13){
				location.href="${pageContext.request.contextPath}/admin/searchJobList.do?keyword="+$('#search').val();
			}
		
		}

	$(function(){
		$(".goBoard").on("click", function(){
			var board_No = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="+ board_No;
		});
	});

	// 체크박스 
/*     $(document).ready(function(){
    	   $(".custom-control-input").change(function(){	   
    	       if($(".custom-control-input").is(":checked")){
     	          location.href = "${pageContext.request.contextPath}/admin/updateStatusBlind.do?board_No=" + board_No;
				   var board_No = $(this).attr("id");
				   alert("체크박스 선택!");				  
    	      }else{
    	          alert("체크박스 체크 해제!");
    	     }
       });
  	}); */

  	$(document).ready(function(){
  		$("input:checkbox[name='statusB']").prop("checked", false);

  		$("input:checkbox[name='statusY']").prop("checked", true);

	});
  	
  	$(document).ready(function(){
  	    $(".custom-control-input").change(function(){
  	        if($(".custom-control-input").is(":checked")){
  	            alert("체크박스 체크했음!");
  	        }else{
  	            alert("체크박스 체크 해제!");
  	        }
  	    });
  	});
	
</script>
</body>
</html>