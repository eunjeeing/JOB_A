<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>JOB_A | Admin</title>
<script src="${pageContext.request.contextPath}/resources/admin/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/js/simplebar.min.js"></script>
<script>
$(document).ready(function(){
	 $.ajax({
	      url:"${pageContext.request.contextPath}/boardCount",
	      type:"POST",
	      dataType : "json",
	      async: true,
	      success : function(data){
	    	  console.log(data[0]);

	    	  $('.boardTotal').append('<p class="small text-muted mb-0">Total '+ data[0]["COUNT(*)"] +'</p>');
	      }
	 });
	 
	 $.ajax({
	      url:"${pageContext.request.contextPath}/todayBoardCount",
	      type:"POST",
	      dataType : "json",
	      async: true,
	      success : function(data){
	    	  console.log(data[0]);
	    	  
	    	  $('.boardCount').append('<span class="h2 mb-0">Today '+ data[0]["COUNT(*)"] +'</span>');
	      }
	 });
	 
	 $.ajax({
	      url:"${pageContext.request.contextPath}/todayMember",
	      type:"POST",
	      dataType : "json",
	      async: true,
	      success : function(data){
	    	  console.log(data[0]);
	    	  
	    	  $('.todayMember').append('<span class="h2 mb-0">Today '+ data[0]["COUNT(*)"] +'</span>');
	      }
	 });
	 $.ajax({
	      url:"${pageContext.request.contextPath}/totalMember",
	      type:"POST",
	      dataType : "json",
	      async: true,
	      success : function(data){
	    	  console.log(data[0]);
	    	  
	    	  $('.totalMember').append('<p class="small text-muted mb-0">Total '+ data[0]["COUNT(*)"] +'</p>');
	      }
	 });
	 $.ajax({
	      url:"${pageContext.request.contextPath}/rankList",
	      type:"POST",
	      dataType : "json",
	      async: true,
	      success : function(data){
				console.log(data);
				var count = [];
				var name = [];

				for(var i in data){
					count.push(data[i].CATEGORY_COUNT);
					name.push(data[i].CATEGORY_NAME)
					};
				console.log(count);
				console.log(name);

				// doughnut차트 시작
				var ctx = $('#doughnutChart');
				var myChart = new Chart(ctx,{
					type : "doughnut",
					data : {
						datasets: [{
							data: count,
							backgroundColor : [
									'#E74645',
									'#FB7756',
									'#FACD60',
									'#8CC474',
									'#8FCACA',
									'#ABDEE6',
									'#CBAACB',
									'#6546A4',
									'#6F85BF',
									'#BC5679'
								],
						}],
						labels: name
					}, // data : end
					options : {
						responsive : true,
						animation : {
							animateScale : true,
							animaterotate : true
							}
						}// option end	
				}); // config end\
	      }
	}); // ajax end
	$.ajax({
		url:"${pageContext.request.contextPath}/reportCount",
		type:"POST",
		dataType : "json",
		async: true,
		success : function(data){
			var date = [];
			var report = [];
			var board = [];

			for(var i in data){
				date.push(data[i].BOARD_DATE);
				report.push(data[i].REPORT_COUNT);
				board.push(data[i].BOARD_COUNT);
				
				};
			console.log('date:' +date);
			console.log('report:' +report);
			console.log('board:' +board);

			// area차트 시작
			var ctx = $('#areaChart');
			var config = new Chart(ctx, {
				type : 'line',
				data : {
					labels : date,
					datasets : [{
						label : "신고된 게시글",
						borderColor : 'rgb(214,10,0,0.8)',
						backgroundColor: 'rgb(214,10,0,0.8)',
						data : report,
					}, {
					 	label : "전체 게시글",
						borderColor :'rgb(0,186,24,0.5)',
						backgroundColor : 'rgb(0,186,24,0.5)',
						data : board,
					}]
					}, // data end
					options : {
						responsive : true,
						tooltips : { mode : 'index'},
						hover : { mode : 'index'},
						scales : {
							xAxes : [{
								scaleLabel : {
									display : true,
									labelString : 'Month'
									}
								}],
								yAxes : [{
									stacked:true,
									scaleLabel : {
										display:true,
										labelString :'Value'
										}
							}]
						}// option end
					}
				}); // config end
		} // success end
	}); // ajax end

	// 최근 게시글 10개 
	$.ajax({
		url:"${pageContext.request.contextPath}/recentBoard",
		type:"POST",
		dataType : "json",
		async: true,
		success : function(data){
			var list = data;
			console.log(list);
			for ( var i in list){
				tr =
					'<tr align="center" class="trtr odd" role="row">'+
					'<td class="sorting_1">'+ data[i].BOARD_NO +'</td>'+
					'<td class="goBoard" id="4">'+ data[i].BOARD_TITLE+'</td>'+
					'<td>'+ data[i].MEM_NICK+'</td>'+
					'<td>'+ data[i].BOARD_DATE+'</td>'+
					'<td>'+ data[i].BOARD_VIEW+'</td>'+
					'</tr>' 

					$('.recentBoard').append(tr);
				}// for문 end
			/* click(); */
		} // success end 
	});// ajax end
});
</script>
<!-- Simple bar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/simplebar.css">
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/feather.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/dropzone.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/uppy.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/jquery.steps.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/app-light.css" id="lightTheme">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/app-dark.css" id="darkTheme" disabled>
</head>
<body class="vertical  dark  ">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="admin/common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="admin/common/sidebar.jsp" />

		<main role="main" class="main-content">
			<div class="col">
				<h2 class="h5 page-title">Welcome!</h2>
			</div>
			<div class="row">
				<div class="col-md-4 mb-4">
					<div class="card shadow">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col">
									<span class="h2 mb-0">Today ${todayCount}</span>
									<p class="small text-muted mb-0">total ${totalCount}</p>
									<span class="badge badge-pill text-white bg-success-dark">방문자 집계</span>
								</div>
								<div class="col-auto">
									<span class="fe fe-32 fe-shopping-bag text-muted mb-0"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4">
					<div class="card shadow">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col">
									<div class="boardCount"></div>
									<div class="boardTotal"></div>
									<span class="badge badge-pill badge-info">게시글 집계</span>
								</div>
								<div class="col-auto">
									<span class="fe fe-32 fe-clipboard text-muted mb-0"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4">
					<div class="card shadow">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col">
									<div class="todayMember"></div>
									<div class="totalMember"></div>
									<span class="badge badge-pill text-white bg-primary-dark">회원 집계</span>
								</div>
								<div class="col-auto">
									<span class="fe fe-32 fe-users text-muted mb-0"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="row align-items-center my-2">
				<div class="col-auto ml-auto">
					<form class="form-inline">
						<div class="form-group">
							<label for="reportrange" class="sr-only">
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">기간</font>
								</font>
							</label>
							<div id="reportrange" class="px-2 py-2 text-muted">
							<i class="fe fe-calendar fe-16 mx-2"></i>
							<span class="small">
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">2020 년 12 월 19 일-2021 년 1 월 17 일</font>
								</font>
							</span>
							</div>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-sm">
								<span class="fe fe-refresh-ccw fe-12 text-muted"></span>
							</button>
							<button type="button" class="btn btn-sm">
								<span class="fe fe-filter fe-12 text-muted"></span>
							</button>
						</div>
					</form>
				</div>
			</div> -->
              
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="row my-4">
		                <div class="col-md-6 mb-4" style="width: 50vw;">
		                  <div class="card shadow">
		                    <div class="card-header">
		                      <strong class="card-title mb-0">
		                      	<font style="vertical-align: inherit;">
		                      	<font style="vertical-align: inherit;">선호 직종</font>
		                      	</font></strong>
		                    </div>
		                    <div class="card-body">
		                    	<div class="chartjs-size-monitor">
		                    		<div class="chartjs-size-monitor-expand">
		                    		</div>
		                    		<div class="chartjs-size-monitor-shrink">
		                    		</div>
		                    	</div>
		                     	<canvas id="doughnutChart" width="650" height="500"></canvas>
		                    </div> <!-- /.card-body -->
		                  </div> <!-- /.card -->
		                </div> <!-- /. col -->
		                <!-- 도넛 차트 끝 -->
		                
		                <div class="col-md-6 mb-4">
		                  <div class="card shadow">
		                    <div class="card-header">
		                      <strong class="card-title mb-0">
			                      <font style="vertical-align: inherit;">
			                     	 <font style="vertical-align: inherit;">일반 게시글 VS 신고 게시글</font>
			                      </font>
		                      </strong>
		                    </div>
		                    <div class="card-body">
		                    	<div class="chartjs-size-monitor">
		                    		<div class="chartjs-size-monitor-expand">
		                    		</div>
		                    		<div class="chartjs-size-monitor-shrink"></div>
		                    	</div>
		                      	<canvas id="areaChart" width="650" height="500"></canvas>
		                      
		                    </div> <!-- /.card-body -->
		                  </div> <!-- /.card -->
		                </div> <!-- /. col -->
		              </div>
						
					
						<div class="col-md-12 mb-12">
							<div class="card shadow">
								<div class="card-body">
								<div class="row">
									<div class="col-sm-12" style=" margin-bottom : 10px;">
										<font style="vertical-align: inherit;">
										&nbsp;최근 게시글&nbsp;&nbsp;&nbsp;</font>
										<font style="vertical-align: right;">
											<a href="${pageContext.request.contextPath}/admin/jobList.do">
											👉&nbsp;더보기</a>
										</font>
									</div>
								</div>
									<!-- 테이블 -->
								<div id="dataTable-1_wrapper"
									class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-hover dataTable no-footer"
												align="center" id="dataTable-1" role="grid"
												aria-describedby="dataTable-1_info">
												<thead>
													<tr align="center" role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="dataTable-1" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="No.: activate to sort column descending"
															style="width: 26px;">No.</th>
														<th width="40%" class="sorting" tabindex="0"
															aria-controls="dataTable-1" rowspan="1" colspan="1"
															aria-label="제목: activate to sort column ascending"
															style="width: 248px;">제목</th>
														<th class="sorting" tabindex="0"
															aria-controls="dataTable-1" rowspan="1" colspan="1"
															aria-label="작성자: activate to sort column ascending"
															style="width: 49px;">작성자</th>
														<th class="sorting" tabindex="0"
															aria-controls="dataTable-1" rowspan="1" colspan="1"
															aria-label="등록일: activate to sort column ascending"
															style="width: 83px;">등록일</th>
														<th width="8%" class="sorting" tabindex="0"
															aria-controls="dataTable-1" rowspan="1" colspan="1"
															aria-label="조회수: activate to sort column ascending"
															style="width: 30px;">조회수</th>
													</tr>
												</thead>
												<tbody class="recentBoard">
													
												</tbody>
											</table>
										</div>
									</div>
									
								</div>
								<script type="text/javascript">
								/* function click(){
									$("#list").on("click",function(){
										var board_No = $(this).attr("id");
										var popUrl = "${pageContext.request.contextPath}/user/selectBoardDetail?boardNo=" + boardNo;
										var popOption = "width=700, height=600, resizable=no, scrollbars=no, status=no;";
	
										window.open(popUrl, "", popOption);
										
										});
									}; */
								</script>
								<br>
								</div>
							</div>
						</div>
							<!-- Bordered table -->
					
					
					
					</div>

				</div>
				<!-- .row -->
			</div>


		</main>
		<!-- main -->
	</div>
	<script src="${pageContext.request.contextPath}/resources/admin/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/daterangepicker.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery.stickOnScroll.js'></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/tinycolor-min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/config.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/d3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/topojson.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/datamaps.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/datamaps-zoomto.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/datamaps.custom.js"></script>
	<script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/gauge.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/apexcharts.custom.js"></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery.mask.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/select2.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery.steps.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery.validate.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery.timepicker.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/dropzone.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/uppy.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/admin/js/quill.min.js'></script>
	<script> 
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
	
	<script src="${pageContext.request.contextPath}/resources/admin/js/apps.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
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
