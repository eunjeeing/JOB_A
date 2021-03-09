<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>활동 내역</title>
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
              <h2 class="page-title">활동 내역</h2>
              <div class="row">
              	<div class="col-md-12 my-4">
                  <div class="card shadow">
                    <div class="card-body">
                      <table class="table table-sm">
                        <thead>
                          <tr>
                          	<th>회원 번호</th>
							<th>아이디</th>
							<th>닉네임</th>
                            <th>등급</th>
							<th>상태</th>
							<th>상태 변경</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${user}" var="m">
                          <tr>
                            <td>${m.memNo}</td>
                            <td>${m.memId}</td>
							<td>${m.memNick}</td>
							<td><c:if test="${m.gradeNo eq 2}">일반회원</c:if>
								<c:if test="${m.gradeNo eq 3}">우수회원</c:if>
								<c:if test="${m.gradeNo eq 4}">최우수회원</c:if> 
								<c:if test="${m.gradeNo eq 5}">인사담당자</c:if>
							</td>
							<td><c:if test="${m.memState eq 0}">
									<span class='badge badge-success'>클린회원</span></c:if> 
								<c:if test="${m.memState eq 1}">
									<span class='badge badge-warning'>블랙리스트</span></c:if> 
								<c:if test="${m.memState eq 2}">
									<span class='badge badge-danger'>블라인드</span></c:if>
							</td>
							<td>
								<div class="dropdown">
                                <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <span class="text-muted sr-only">Action</span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                  <a class="dropdown-item" data-toggle="modal" data-target="#grade" href="#">등급 변경</a>
                                  <a class="dropdown-item" data-toggle="modal" data-target="#status" href="#">상태 변경</a>
                                </div>
                              </div>
							</td>
                          </tr>
      					</c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="col-md-12 mb-4">
                  <div class="card shadow">
                    <div class="card-body">
                      <ul class="nav nav-pills nav-fill mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" onclick="boardTab()" id="pills-board-tab" data-toggle="pill" href="#pills-board" role="tab" aria-controls="pills-board" aria-selected="false">총 작성 글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="commentTab()" id="pills-comment-tab" data-toggle="pill" href="#pills-comment" role="tab" aria-controls="pills-comment" aria-selected="false">총 작성 댓글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="rBoardTab()" id="pills-rBoard-tab" data-toggle="pill" href="#pills-rBoard" role="tab" aria-controls="pills-rBoard" aria-selected="false">신고된 글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="rCommentTab()" id="pills-rComment-tab" data-toggle="pill" href="#pills-rComment" role="tab" aria-controls="pills-rComment" aria-selected="false">신고된 댓글</a>
                        </li>
                      </ul>
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
												<select name="gradeNo" class="form-control select2" >
													<option value="" disabled selected>등급 선택</option>
													<option value="2">일반 회원</option>
													<option value="3">우수 회원</option>
													<option value="4">최우수 회원</option>
												</select>
												<input type="hidden" class="memNoVal" name="memNo" value="${user[0].memNo }">
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
					
					<div class="modal fade" id="status" tabindex="-1" role="dialog"  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<!--Content-->
							<div class="modal-content">
								<div class="modal-header text-center">
									<h5 class="modal-title w-100 font-weight-bold py-2">
										<strong><span>상태 변경하기</span></strong>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<!--Body-->
	   							<form id="changeStatus" action="${pageContext.request.contextPath }/user/changeStatus" method="post">
									<div class="modal-body">
										<div class="row">
											<div class="col">
												<select name="memState" class="form-control select2" >
													<option value="" disabled selected>상태 변경</option>
													<option value="0">클린 회원</option>
													<option value="1">블랙리스트</option>
													<option value="2">블라인드</option>
												</select>
												<input type="hidden" name="memNo" value="${user.get(0).memNo }">
											</div>
										</div>	
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">변경</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div> <!-- end section -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
      </main> <!-- main -->
    </div> <!-- .wrapper -->
   
    <script type="text/javascript">
	    $('#dataTable-1').DataTable({
			autoWidth: true,
	        "lengthMenu": [
	          [16, 32, 64, -1],
	          [16, 32, 64, "All"]
	        ]
	  	});

	    $('#dataTable-2').DataTable({
			autoWidth: true,
	        "lengthMenu": [
	          [16, 32, 64, -1],
	          [16, 32, 64, "All"]
	        ]
      	});

	    $('#dataTable-3').DataTable({
			autoWidth: true,
	        "lengthMenu": [
	          [16, 32, 64, -1],
	          [16, 32, 64, "All"]
	        ]
      	});

	    $('#dataTable-4').DataTable({
			autoWidth: true,
	        "lengthMenu": [
	          [16, 32, 64, -1],
	          [16, 32, 64, "All"]
	        ]
      	});
      	

	</script>
   
   
	<script type="text/javascript">

		var memNo = $('.memNoVal').val();	
		
	   	function boardTab(){
	   		location.href = "${pageContext.request.contextPath}/user/selectBoardList?memNo=" + memNo;
		}
		
	   	function commentTab(){
	   		location.href = "${pageContext.request.contextPath}/user/selectCommentList?memNo=" + memNo;
	   	}
	   	
	   	function rBoardTab(){
	   		location.href = "${pageContext.request.contextPath}/user/selectReportBoardList?memNo=" + memNo;
	   	}
	   	
	   	function rCommentTab(){
	   		location.href = "${pageContext.request.contextPath}/user/selectReportCommentList?memNo=" + memNo;
	   	}
   
   
   </script>
   
	<!-- ajax로 불러올때 -->
	<script>
    	/* function boardTab(){
    		var memNo = $('.memNoVal').val();
			$.ajax({
				url: "${pageContext.request.contextPath}/user/selectBoardList",
				data :{memNo : memNo},
				async: true,
				dataType : "json",
				success : function(data){
					
					var bList = data;
					$('.boardListTbody').empty();
					for(var i in bList){
						console.log(data[i]);
						listBody = 
							'<tr class="accordion-toggle collapsed" data-toggle="collapse"  href="#collap' + i + '">'
								+'<td>'+ data[i].board_No +'</td>'
								+'<td>'+ data[i].type_Name +'</td>'
								+'<td>'+ data[i].board_Title +'</td>'
								+'<td>'+ data[i].mem_Nick +'</td>'
								+'<td>'+ data[i].board_Date +'</td>'
								+'<td>'+ data[i].board_View +'</td>'
								+'<td>'+ data[i].board_Status +'</td>'
							+'</tr>'
							+'<tr id="collap' + i + '" class="collapse in p-3 bg-light">'
								+'<td colspan="7">'+ data[i].board_Content +'</td>'
							+'</tr>'
						$('.boardListTbody').append(listBody);
					}
					
					
				}, error : function () {
					alert("불러오기 실패");
				}
			});
		};

		
		function commentTab(){
			var memNo = $('.memNoVal').val();
			$.ajax({
				url: "${pageContext.request.contextPath}/user/selectCommentList",
				data :{memNo : memNo},
				async: true,
				dataType : "json",
				success : function(data){
					
					var cList = data;
					$('.commentListTbody').empty();
					for(var i in cList){
						console.log(data[i]);
						listBody = 
							'<tr>'
								+'<td>'+ data[i].comm_No +'</td>'
								+'<td colspan="3">'+ data[i].comm_Content +'</td>'
								+'<td></td>'
								+'<td></td>'
								+'<td>'+ data[i].comm_Date +'</td>'
							+'</tr>'
						$('.commentListTbody').append(listBody);
					}
					
				}, error : function () {
					alert("불러오기 실패");
				}
			});
		};

		function rBoardTab(){
    		var memNo = $('.memNoVal').val();
			$.ajax({
				url: "${pageContext.request.contextPath}/user/selectReportBoardList",
				data :{memNo : memNo},
				async: true,
				dataType : "json",
				success : function(data){
					
					var rbList = data;
					
					$('.rBoardListTbody').empty();
					for(var i in rbList){
						console.log(data[i]);
						listBody = 
							'<tr>'
								+'<td>'+ data[i].board_No +'</td>'
								+'<td>'+ data[i].type_Name +'</td>'
								+'<td class="'+ data[i].board_No +'">'
									+'<div id="accordion'+ i +'">'
										+'<a href="#collapse'+ i +'" data-toggle="collapse" data-target="#collapse'+ i +'" aria-expanded="false" aria-controls="collapse'+ i +'">'+ data[i].board_Title +'</a>'
									+'</div>'
								+'</td>'
								+'<td>'+ data[i].mem_Nick +'</td>'
								+'<td>'+ data[i].board_Date +'</td>'
								+'<td>'+ data[i].board_View +'</td>'
							+'</tr>'
							+'<tr>'
								+'<td colspan="6">'
									+'<div id="collapse'+ i +'" class="collapse" aria-labelledby="heading" data-parent="#accordion'+ i +'">'
	                					+'<div class="card-body">'+ data[i].board_Content +'</div>'
	              					+'</div>'
	              				+'</td>'
							+'</tr>'
						$('.rBoardListTbody').append(listBody);
					}
					
					
					
				}, error : function () {
					alert("불러오기 실패");
				}
			});
		};

		function rCommentTab(){
			var memNo = $('.memNoVal').val();
			$.ajax({
				url: "${pageContext.request.contextPath}/user/selectReportCommentList",
				data :{memNo : memNo},
				async: true,
				dataType : "json",
				success : function(data){
					
					$('.rCommentListTbody').empty();
					var rcList = data;
					for(var i in rcList){
						console.log(data[i]);
						listBody = 
							'<tr>'
								+'<td>'+ data[i].comm_No +'</td>'
								+'<td colspan="5">'+ data[i].comm_Content +'</td>'
								+'<td></td>'
								+'<td></td>'
								+'<td></td>'
								+'<td></td>'
								+'<td>'+ data[i].comm_Date +'</td>'
							+'</tr>'
						$('.rCommentListTbody').append(listBody);
					}
					
				}, error : function () {
					alert("불러오기 실패");
				}
			});
		}; */
	</script>
	
	
<%-- 	+'<fmt:parseDate var="parsedDate" value="'+ data[i].comm_Date +'" pattern="yyyy-MM-dd HH:mm:ss.S"/>'
	+'<td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>' --%>
	
<%-- 	+'<td>'
		+'<c:if test="'+ data[i].board_Status +'eq Y}">'
			+'<span class="badge badge-success">활성화</span></c:if>'
		+'<c:if test="'+ data[i].board_Status +'eq N}">'
			+'<span class="badge badge-secondary">삭제</span></c:if> 
		+'<c:if test="'+ data[i].board_Status +'eq B}">'
			+'<span class="badge badge-danger">블라인드</span></c:if> 
	+'</td>' --%>
  
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
