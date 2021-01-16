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
                          <a class="nav-link" onclick="boardTab()" id="pills-board-tab" data-toggle="pill" href="#pills-board" role="tab" aria-controls="pills-board" aria-selected="false">총 작성 글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="commentTab()" id="pills-comment-tab" data-toggle="pill" href="#pills-comment" role="tab" aria-controls="pills-comment" aria-selected="false">총 작성 댓글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="rBoardTab()" id="pills-rBoard-tab" data-toggle="pill" href="#pills-rBoard" role="tab" aria-controls="pills-rBoard" aria-selected="false">신고된 글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" onclick="rCommentTab()" id="pills-rComment-tab" data-toggle="pill" href="#pills-rComment" role="tab" aria-controls="pills-rComment" aria-selected="false">신고된 댓글</a>
                        </li>
                      </ul>
                      <div class="tab-content mb-1" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-rComment" role="tabpanel" aria-labelledby="pills-rComment-tab">
                        	<table class="table table-hover datatables" id="dataTable-1">
								<thead>
									<tr role="row">
										<th>No.</th>
										<th style="width: 60%">댓글 내용</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${rCommentList}" var="rc">
										<tr>
											<td>${rc.comm_No}</td>
											<td>${rc.comm_Content}</td>
											<td>${rc.comm_Date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                        </div>
                        </div>
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
