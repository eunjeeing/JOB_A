<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>

<style>
.navbar-nav .nav-link {
	padding: 1rem;
}
@font-face {
    font-family: 'NEXON Lv2 Gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	 font-family: 'NEXON Lv2 Gothic';
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>JOB_A | Admin</title>

</head>

<aside class="sidebar-left border-right bg-white shadow"
	id="leftSidebar" data-simplebar>
	<a href="#"
		class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3"
		data-toggle="toggle"> <i class="fe fe-x"><span class="sr-only"></span></i>
	</a>
	<nav class="vertnav navbar navbar-light">
		<!-- nav bar -->
		<div class="w-100 mb-4 d-flex">
			<a class="navbar-brand mx-auto mt-2 flex-fill text-center"
				href="${pageContext.request.contextPath}" style="font-weight: bold;">JOB_A
				<g> <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
				<polygon class="st0" points="96,69 33,69 42,51 105,51 	" /> <polygon
					class="st0" points="78,33 15,33 24,15 87,15 	" /> </g> </svg>
			</a>
		</div>
		<div class="w-100 mb-4 d-flex"
			style="display: flex; align-items: center; flex-direction: column">
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/admin/images/adminIcon.png"
					alt="..." class="avatar-img rounded-circle"
					style="width: 60px; height: 60px; overflow: hidden; margin-bottom: 7px;">
			</div>
			<div>
				<a href="" style="text-decoration: none; font-size: 20px;">
					${member.memId} </a>
				<!-- 개인정보 수정페이지로 이동 -->
			</div>
		</div>
		<br />


		<ul class="navbar-nav flex-fill w-100 mb-2">

			<li class="nav-item w-100"><a class="nav-link"
				href="${pageContext.request.contextPath}/adminIndex.do"> <i
					class="fe fe-home fe-16"></i> <span class="ml-3 item-text">HOME</span>
			</a></li>

			<!-- 회원 관리 -->
			<li class="nav-item dropdown"><a href="#member-elements"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i class="fe fe-smile fe-16"></i>
					<span class="ml-3 item-text">MEMBER</span>
			</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="member-elements">
					<c:if test="${member.gradeNo eq 0 }">
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/admin/adminEnrollView">
							<span class="ml-1 item-text">Admin Register</span>
					</a></li></c:if>
					<c:if test="${member.gradeNo > 0 }">
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/admin/adminUpdateView?adminNo=${member.memNo}">
							<span class="ml-1 item-text">Admin Update</span>
					</a></li></c:if>
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/admin/adminList"> <span
							class="ml-1 item-text">Admin List</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/user/userList"> <span
							class="ml-1 item-text">Member List</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/user/gradeListView">
							<span class="ml-1 item-text">Member Grade</span>
					</a></li>
				</ul></li>
			<!-- 공지사항 -->
			<li class="nav-item dropdown"><a href="#notice"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i
					class="fe fe-file-text fe-16"></i> <span class="ml-3 item-text">NOTICE</span>
			</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="notice">
					<li class="nav-item"><a class="nav-link pl-3" href="${pageContext.request.contextPath}/admin/noticeList.bo"> <span
							class="ml-1 item-text">Notice List</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3" href="${pageContext.request.contextPath}/admin/noticeWrite.bo"> <span
							class="ml-1 item-text">Write Notice</span></a></li>
				</ul></li>

			<!-- 게시판 관리 -->
			<li class="nav-item dropdown"><a href="#board"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i class="fe fe-grid fe-16"></i>
					<span class="ml-3 item-text">BOARD</span>
			</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="board">
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/admin/jobList.do"> <span
							class="ml-1 item-text">Board List</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3"
						href="${pageContext.request.contextPath}/admin/jobCommentList.do">
							<span class="ml-1 item-text">Comment List</span>
					</a></li>
					<li class="nav-item"><a class="nav-link pl-3" 
						href="${pageContext.request.contextPath}/admin/mentoTotalList.bo"> <span
							class="ml-1 item-text">Mentoring</span></a></li>
				</ul></li>

			<!-- 신고 관리 -->
	         <li class="nav-item dropdown"><a href="#report"
	            data-toggle="collapse" aria-expanded="false"
	            class="dropdown-toggle nav-link"> <i
	               class="fe fe-alert-triangle fe-16"></i> <span
	               class="ml-3 item-text">REPORT</span>
	         </a>
	            <ul class="collapse list-unstyled pl-4 w-100" id="report">
	               <li class="nav-item"><a class="nav-link pl-3"
	                  href="${pageContext.request.contextPath}/boardReportList.do"><span
	                     class="ml-1 item-text">Board</span></a></li>
	               <li class="nav-item"><a class="nav-link pl-3" 
	                  href="${pageContext.request.contextPath}/commentReportList.do"><span
	                     class="ml-1 item-text">Comment</span></a></li>

            </ul></li>

			 <!-- 통계 관리 -->
			<!--<li class="nav-item dropdown"><a href="#static"
				data-toggle="collapse" aria-expanded="false"
				class="dropdown-toggle nav-link"> <i
					class="fe fe-bar-chart-2 fe-16"></i> <span class="ml-3 item-text">STATICS</span>
			</a>
				<ul class="collapse list-unstyled pl-4 w-100" id="static">
					<li class="nav-item"><a class="nav-link pl-3" href="#"> <span
							class="ml-1 item-text">User Static</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3" href="#"> <span
							class="ml-1 item-text">Board Static</span></a></li>
					<li class="nav-item"><a class="nav-link pl-3" href="#"> <span
							class="ml-1 item-text">Report Static</span></a></li>

				</ul></li> -->
		</ul>

		</ul>

	</nav>
</aside>
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
	src='${pageContext.request.contextPath}/resources/admin/js/jquery.dataTables.min.js'></script>
<script 
	src='${pageContext.request.contextPath}/resources/admin/js/dataTables.bootstrap4.min.js'></script>
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