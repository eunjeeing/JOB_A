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
<!-- Simple bar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/simplebar.css">
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/dropzone.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/uppy.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.steps.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/app-light.css"
	id="lightTheme">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/app-dark.css"
	id="darkTheme" disabled>
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
									<span class="h2 mb-0">${totalCount}</span>
									<p class="small text-muted mb-0">VISITOR</p>
									<span class="badge badge-pill badge-success">누적 방문자</span>
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
									<span class="h2 mb-0">1K+</span>
									<p class="small text-muted mb-0">BOARDS</p>
									<span class="badge badge-pill badge-success">총 게시글</span>
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
									<span class="h2 mb-0">00</span>
									<p class="small text-muted mb-0">MEMBERS</p>
									<span class="badge badge-pill badge-warning">총 회원</span>
								</div>
								<div class="col-auto">
									<span class="fe fe-32 fe-users text-muted mb-0"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="row my-4">
						<div class="col-md-6 mb-4">
							<div class="card shadow">
								<div class="card-header">
									<strong class="card-title mb-0">선호직종 분포도</strong>
								</div>
								<div class="card-body">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<canvas id="pieChartjs" width="698" height="600"
										class="chartjs-render-monitor"
										style="display: block; height: 300px; width: 349px;"></canvas>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /. col -->
						<div class="col-md-6 mb-4">
							<div class="card shadow">
								<div class="card-header">
									<strong class="card-title mb-0">연도 비교</strong>
								</div>
								<div class="card-body">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<canvas id="areaChartjs" width="698" height="600"
										class="chartjs-render-monitor"
										style="display: block; height: 300px; width: 349px;"></canvas>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /. col -->
					</div>

					<div class="row items-align-baseline">
						<div class="col-md-12 col-lg-4">
							<div class="card shadow eq-card mb-4">
								<div class="card-body mb-n3">
									<div class="row items-align-baseline h-100">
										<div class="col-md-6 my-3">
											<p class="mb-0">
												<strong class="mb-0 text-uppercase text-muted">신규 게시글</strong>
											</p>
											<h3>2,562</h3><!-- 
											<p class="text-muted">Lorem ipsum dolor sit amet,
												consectetur adipiscing elit.</p> -->
										</div>
										<div class="col-md-6 my-4 text-center">
											<div lass="chart-box mx-4">
												<div id="radialbarWidget"></div>
											</div>
										</div>
										<div class="col-md-6 border-top py-3">
											<p class="mb-1">
												<strong class="text-muted">Cost</strong>
											</p>
											<h4 class="mb-0">108</h4>
											<p class="small text-muted mb-0">
												<span>37.7% Last week</span>
											</p>
										</div>
										<!-- .col -->
										<div class="col-md-6 border-top py-3">
											<p class="mb-1">
												<strong class="text-muted">Revenue</strong>
											</p>
											<h4 class="mb-0">1168</h4>
											<p class="small text-muted mb-0">
												<span>-18.9% Last week</span>
											</p>
										</div>
										<!-- .col -->
									</div>
								</div>
								<!-- .card-body -->
							</div>
							<!-- .card -->
						</div>
						<!-- .col -->
						<div class="col-md-12 col-lg-4">
							<div class="card shadow eq-card mb-4">
								<div class="card-body">
									<div class="chart-widget mb-2">
										<div id="radialbar"></div>
									</div>
									<div class="row items-align-center">
										<div class="col-4 text-center">
											<p class="text-muted mb-1">Cost</p>
											<h6 class="mb-1">$1,823</h6>
											<p class="text-muted mb-0">+12%</p>
										</div>
										<div class="col-4 text-center">
											<p class="text-muted mb-1">Revenue</p>
											<h6 class="mb-1">$6,830</h6>
											<p class="text-muted mb-0">+8%</p>
										</div>
										<div class="col-4 text-center">
											<p class="text-muted mb-1">Earning</p>
											<h6 class="mb-1">$4,830</h6>
											<p class="text-muted mb-0">+8%</p>
										</div>
									</div>
								</div>
								<!-- .card-body -->
							</div>
							<!-- .card -->
						</div>
						<!-- .col -->
						<div class="col-md-12 col-lg-4">
							<div class="card shadow eq-card mb-4">
								<div class="card-body">
									<div class="d-flex mt-3 mb-4">
										<div class="flex-fill pt-2">
											<p class="mb-0 text-muted">Total</p>
											<h4 class="mb-0">108</h4>
											<span class="small text-muted">+37.7%</span>
										</div>
										<div class="flex-fill chart-box mt-n2">
											<div id="barChartWidget"></div>
										</div>
									</div>
									<!-- .d-flex -->
									<div class="row border-top">
										<div class="col-md-6 pt-4">
											<h6 class="mb-0">
												108 <span class="small text-muted">+37.7%</span>
											</h6>
											<p class="mb-0 text-muted">Cost</p>
										</div>
										<div class="col-md-6 pt-4">
											<h6 class="mb-0">
												1168 <span class="small text-muted">-18.9%</span>
											</h6>
											<p class="mb-0 text-muted">Revenue</p>
										</div>
									</div>
									<!-- .row -->
								</div>
								<!-- .card-body -->
							</div>
							<!-- .card -->
						</div>
						<!-- .col-md -->
					</div>

				</div>
				<!-- .row -->
			</div>


		</main>
		<!-- main -->
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/simplebar.min.js"></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/daterangepicker.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/jquery.stickOnScroll.js'></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/tinycolor-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/d3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/topojson.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/datamaps.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/datamaps-zoomto.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/datamaps.custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/Chart.min.js"></script>
	<script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/gauge.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/apexcharts.custom.js"></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/jquery.mask.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/select2.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/jquery.steps.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/jquery.validate.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/jquery.timepicker.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/dropzone.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/uppy.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/admin/js/quill.min.js'></script>
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
	<script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
        });
      }
    </script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/apps.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
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
