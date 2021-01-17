<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>신고 게시글 상세 페이지</title>
<style>
	/* 상단 */
	#reporterInfor{
		width: 100%;
		min-height: 120px;
		border-style : hidden;
		margin-top:15px;
		box-shadow: 5px 5px 5px 5px lightgrey;
	}

	#reporter, #reportReason, #toggle, #status{
		padding-top: 30px;
		padding-left: 10px;
		padding-bottom: 30px;
		float: left;
		
	}
	
	#reporter {
		width: 40%;
		padding-left: 15px;
	}
	#reportReason{
		width: 30%;
		padding-left: 15px;
	}
	#toggle, #status{
		width: 15%;
		text-align: center;
		
	}
	#Big, #sangtae{
		color: #6c757d;
	}

	.data{
		font-size: 15px;
		margin-bottom: 0;
	}
	
	/* 게시글 정보 테이블 */
	#boardTable{
		width: 100%;
		height: 100%;
		padding-left: 10px;
		font-size: 14px;
		letter-spacing: 1.5px;
		display: inline-block;
		margin-top: 50px;
	}
	
	.title{
		padding-right: 15px;
		font-weight: bolder;
	}
	
	.content{
		padding-left: 15px;
		border-left: 1px solid #ddd;
	}
	
	/* 해당 게시글 상세 내용 */
	#TitleAndcontent{
		margin-top: 30px;
		padding-left: 10px;
		letter-spacing: 1.5px;
	}
	#board_Title{
		font-weight: bold;
		font-size: 20px;
	}
	
	#board_Content{
		padding-top : 15px;
		min-height: 250px;
	}
	
	/*확인버튼 : 뒤로가기*/
	#goBack{
		width: 200px;
		height: 35px;
		border: none;
		border-radius: 5px;
		margin: 50px 60% 0 40%; 
		cursor: pointer;
		color: #6c757d;
		letter-spacing: 2px;
		
	}
	
	#goback:hover{
		background: gray;
	}
	
</style>
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
						<h2 class="mb-2 page-title">BOARD REPORT</h2>
						<div class="row">
							<!-- Striped rows -->
							<div class="col-md-12 my-4">
								<div class="card shadow">
									<div class="card-body">
										
										<!-- 상세 페이지 시작 -->
										<div id="reporterInfor">
											<div id="reporter">
												<h3 id="Big">신고자</h3>
												<b class="data">${reporterMemNick}</b>
												
												<b class="data">											
													<c:forEach items="${DetailList}" var="list" varStatus="status">
															, ${DetailMemberList[status.index].memNick }
													</c:forEach>
												</b>
											</div>
											
											<div id="reportReason">
												<h3 id="Big">신고사유</h3>
												<b class="data">${reportReason}</b>
												
												<b class="data">
													<c:forEach items="${DetailList}" var="list" varStatus="status">
															, ${list.reportReason }
													</c:forEach>											
												</b>
											</div>
											
											<div id="status">
												<h3 id="sangtae">상태</h3>
												<div>
													<c:if test="${boardList.board_Status eq 'Y'}">
														<span class='badge badge-success'>정상</span>
													</c:if> 
													<c:if test="${boardList.board_Status eq 'B'}">
														<span class='badge badge-danger'>블라인드</span>
													</c:if> 
												</div>
											</div>
											
											<div id="toggle">
												<h3 id="Big">상태 변경</h3>
														<div class="custom-control custom-switch" id="YBtn">
														<c:if test="${boardList.board_Status eq 'Y'}">
															<input type="checkbox" class="custom-control-input" 
																	id="${boardList.board_No}" name="statusY" checked>
															<label class="custom-control-label"
															 for="${boardList.board_No}"></label>
														</c:if>
														
														<c:if test="${boardList.board_Status eq 'B'}">
															<input type="checkbox" class="custom-control-input" 
																id="${boardList.board_No}" >
															<label class="custom-control-label"
																for="${boardList.board_No}"></label>
															</c:if>	 															
														</div>

											</div>
										</div>
										
										<!-- 게시글 정보 -->
										<div id="boardTable">
											<table>
												<tr>
													<th class="title">게시판</th>
														<td class="content">${boardType}</td>
												</tr>
												<tr>
													<th class="title">게시일</th>
													<td class="content">${boardList.board_Date} </td>
												</tr>
												<tr>
													<th class="title">작성자</th>
													<td class="content">${appendantMemNick} </td>
												</tr>
											</table>
										</div>
										
										<!-- 해당 게시글 상세 내용 -->
										<div id="TitleAndcontent">
											<span id="board_Title">${boardList.board_Title}</span>
											<div id="board_Content">${boardList.board_Content}</div>
										</div>
									
										<div>
											<input type="button" id="goBack"
											 onclick="location.href='${pageContext.request.contextPath}/boardReportList.do'"
											 value="확인">
										</div>
										
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 
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
		
		// 활성화 ture 비활성화 false
		$(".custom-control-input").click(function(){
			
				var status = "${boardList.board_Status}";
				console.log("status"+ status);
				
				var test = $(".custom-control-input").is(":checked");
				if(status == "Y" && test == false){

					var toggle = confirm("블라인드 처리 하시겠습니까?");
						if(toggle == true){
							
							console.log("트루임");
							//비활성화(B)로 바꿔야함
							location.href="${pageContext.request.contextPath}/boardReportUpdate.do?boardNo=${boardList.board_No}&boardStatus=B"; 
						}
						else if(toggle == false){
							$(".custom-control-input").prop("checked", true);
						}
						
					}else if(status == "B" && test == true){
						
						var toggle = confirm("활성화 하시겠습니까?");
						if(toggle == true){
							
							console.log("여기는 비활>활성화로");
							//활성화(Y)로 해야함
							location.href="${pageContext.request.contextPath}/boardReportUpdate.do?boardNo=${boardList.board_No}&boardStatus=Y"; 
							
						}
						else if(toggle == false){
							$(".custom-control-input").prop("checked", false);
						}
						}
			});

		</script>

</body>
</html>