<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>신고 댓글 리스트</title>
<style>
	.commentContent:hover{
		background: #EAEAEA;
	}
	#commentContent:hover{
		cursor: pointer;
	
	}
	#commentContent:focus{
		outline: none;
	}
	#commentContent{
		width: 100%;
		height: auto;
		border: none;
		background: transparent;
		
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
						<h2 class="mb-2 page-title">COMMENT REPORT</h2>
						<div class="row">
							<!-- Striped rows -->
							<div class="col-md-12 my-4">
								<div class="card shadow">
									<div class="card-body">
										
										<!-- table -->
										<table class="table table-hover datatables" align="center" id="dataTable-1">
											<thead>
												<tr align="center" role="row" >
													<th>No.</th>
													<th>댓글번호</th>
													<th>댓글내용</th>
													<th>댓글 작성자</th> <!-- 피신고자 : memNo2 -->
													<th>신고사유</th>
													<th>신고자</th> <!-- memNo -->
													<th>신고일</th>
													<th>신고횟수</th>
													<th>상태</th>
												</tr>
									
											</thead>
											<tbody>
												<c:forEach items="${reportList}" var="m" varStatus="status"> 
													<tr align="center" class="commentContent" onclick="location.href='${pageContext.request.contextPath}/commentReportDetail.do?commentNo=${m.commNo}&reportReason=${m.reportReason}&appendantMemNick=${appendantList[status.index].memNick}&reporterMemNick=${reporterList[status.index].memNick}';" value="${commentList[status.index].comm_Content }">
														<td>${status.index+1}</td>
														<td>${commentList[status.index].comm_No}</td>
														<td> 
															<input type="text" maxlength="200" id="commentContent" readonly="readonly" value="${commentList[status.index].comm_Content}"/>
														</td>
														<td>${appendantList[status.index].memNick}</td>
														<td>${m.reportReason }</td>
														<td>${reporterList[status.index].memNick}<span class="people2">&nbsp;외&nbsp;<span class="people">${commentList[status.index].comm_ReportNum-1}</span>&nbsp;명</span></td>
														<td>${m.reportDate}</td>
														<td>${commentList[status.index].comm_ReportNum}</td>
													
															<td><c:if test="${commentList[status.index].comm_Status eq 'Y'}">
																<span class='badge badge-success'>정상</span>
															</c:if> <c:if test="${commentList[status.index].comm_Status eq 'B'}">
																<span class='badge badge-danger'>블라인드</span>
															</c:if> </td>
							
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
	<script>
      	window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-56159088-1');

		// 리스트에서 외 몇명 구현
		$(function(){
			var test = $(".people").length;
			var num = $(".people").text();
			console.log("num: "+num);
			console.log("Test"+test);
			for(var i=0; i<test; i++){
					var num2 = num[i];
					console.log("num:"+num2);
					if(num2 == 0){
						$(".people2").eq(i).hide();
						console.log("zzzzz");
					}else{
						$(".people").eq(i).show();
						}
						
				}
			});
	</script>
	
	<script>
/*
		// 활성화 true 비활성화 false
			var $comment = $(".custom-control-input").on('click', function(){
				
			var idx = $comment.index(this);
			console.log(idx);
			
			var status = $('.checkStatus:eq('+idx+')').val();
			console.log("status 상태는 ?"+ status);
			var commentNo = $('.commentNo:eq('+idx+')').val();
			console.log("commentNo:"+commentNo);
			var test = $(".custom-control-input:eq("+idx+")").is(":checked");
			console.log("test:"+test);
			
			if(status == "Y" ){
					console.log("트루임");
					//비활성화(B)로 바꿔야함
					location.href="${pageContext.request.contextPath}/commentReportUpdate.do?commentStatus=B&commentNo="+commentNo; 
					
				}else if(status == "B" ){
					console.log("여기는 비활>활성화로");
					//활성화(Y)로 해야함
					location.href="${pageContext.request.contextPath}/commentReportUpdate.do?commentStatus=Y&commentNo="+commentNo; 
					}
		});
*/
/*
		   // 해당 게시글로 이동
			function boardView(boardType, boardNo){
				// 해당 게시글로 넘어갈 때 컨펌창 
				var result = confirm("해당 게시글로 넘어가시겠습니까?");
				
				console.log("boardType : " + boardType + ", boardNo:" + boardNo);
				
				if(result){

			       switch(boardType) {
			         case 1:
			            location.href = "${pageContext.request.contextPath}/notice.bo?board_no="+ boardNo;
			            break;

			         case 2:
			            location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No="+ boardNo;
			            break;
			               
			         case 4:
			            location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="+ boardNo;
			            break;
			         
			         case 5:
			            location.href = "${pageContext.request.contextPath}/board2/blindSelectOne.do?board_No="+ boardNo;
			            break;

			         case 6:
			            location.href = "${pageContext.request.contextPath}/selectOneTomorrow.bo?board_no="+ boardNo;
			            break;

			         case 7:
			            location.href = "${pageContext.request.contextPath}/board2/qnaSelectOne.do?board_No="+ boardNo;
			            break;   

			         case 8:
			            location.href = "${pageContext.request.contextPath}/selectOneMento.bo?board_no="+ boardNo;
			            break;
			            
			         case 9:
			            location.href = "${pageContext.request.contextPath}/selectOneInterview.bo?board_no="+ boardNo;
			            break;

			         case 10:
			            location.href = "${pageContext.request.contextPath}/selectOneAccept.bo?board_no="+ boardNo;
			            break;
			         }
					} else{
				
						}

				}
				
				*/
    </script>

</body>
</html>