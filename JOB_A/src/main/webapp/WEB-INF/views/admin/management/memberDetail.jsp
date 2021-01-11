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
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme">
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
                      <table class="table table-hover table-sm">
                        <thead>
                          <tr>
                          	<th>회원 번호</th>
							<th>아이디</th>
							<th>닉네임</th>
                            <th>등급</th>
							<th>상태</th>
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
                          <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">총 작성 글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">총 작성 댓글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="pills-board-tab" data-toggle="pill" href="#pills-board" role="tab" aria-controls="pills-board" aria-selected="false">신고된 글</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="pills-conmment-tab" data-toggle="pill" href="#pills-conmment" role="tab" aria-controls="pills-conmment" aria-selected="false">신고된 댓글</a>
                        </li>
                      </ul>
                      <div class="tab-content mb-1" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        	<table class="table table-bordered" id="dataTable-1">
								<thead>
									<tr role="row">
										<th>No.</th>
										<th>게시판</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList}" var="b">
										<tr>
											<td>${b.board_No}</td>
											<td>${b.type_Name}</td>
											<td class="goBoard" id="${b.board_No}">${b.board_Title}</td>
											<td>${b.mem_Nick}</td>
											<td>${b.board_Date}</td>
											<td>${b.board_View}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        	<table class="table table-bordered" id="dataTable-2">
								<thead>
									<tr role="row">
										<th>No.</th>
										<th>댓글 내용</th>
										<th>등록일</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commentList}" var="c">
										<tr>
											<td>${c.comm_No}</td>
											<td>${c.comm_Content}</td>
											<fmt:parseDate var="parsedDate" value="${rc.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
											<td id="clock"><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                        </div>
                        <div class="tab-pane fade" id="pills-board" role="tabpanel" aria-labelledby="pills-board-tab">
                        	<table class="table table-bordered" id="dataTable-3">
								<thead>
									<tr role="row">
										<th>No.</th>
										<th>게시판</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${reportBoardList}" var="rb">
										<tr>
											<td>${rb.board_No}</td>
											<td>${rb.type_Name}</td>
											<td class="goBoard" id="${rb.board_No}">${rb.board_Title}</td>
											<td>${rb.mem_Nick}</td>
											<td>${rb.board_Date}</td>
											<td>${rb.board_View}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                        </div>
                        <div class="tab-pane fade" id="pills-conmment" role="tabpanel" aria-labelledby="pills-conmment-tab">
                        	<table class="table table-bordered" id="dataTable-4">
								<thead>
									<tr role="row">
										<th>No.</th>
										<th>댓글 내용</th>
										<th>등록일</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${reportCommentList}" var="rc">
										<tr>
											<td>${rc.comm_No}</td>
											<td>${rc.comm_Content}</td>
											<fmt:parseDate var="parsedDate" value="${rc.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
											<td id="clock"><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div> <!-- end section -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
      </main> <!-- main -->
    </div> <!-- .wrapper -->

		
	<script>
      $('#dataTable-1').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
      $('#dataTable-2').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
      $('#dataTable-3').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
      $('#dataTable-4').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });


      $(function(){
  		$(".goBoard").on("click", function(){
  			var board_No = $(this).attr("id");
  			var tno = $(this).siblings('.tno').val();

  			console.log(board_No);
  			console.log(tno);
  			
  			switch(tno) {
  			case '1':
  				location.href = "${pageContext.request.contextPath}/notice.bo?board_no="+ board_No;
  				break;
  				
  			case '2':
  				location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No="+ board_No;
  				break;

  			case '4':
  				location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="+ board_No;
  				break;
  			
  			case '5':
  				location.href = "${pageContext.request.contextPath}/board2/blindSelectOne.do?board_No="+ board_No;
  				break;

  			case '7':
  				location.href = "${pageContext.request.contextPath}/board2/qnaSelectOne.do?board_No="+ board_No;
  				break;	
  			}
  		});
  	});
    </script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/apps.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>

	<script
		src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>

	
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