<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시글 신고 리스트 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

<style type="text/css">
	/*
	#listArea {
		width : 100%;
		height : auto;
		margin: 40px auto auto auto;
	}
	
	.pagination {
		text-align: center;
		margin-top : 20px;
		margin-bottom : 100px;
	}
	
	#noticeList{
		text-align : center;
		margin: auto;
	}
	*/

.reportList{
	position: absolute;
	top: 100px;
	left: ;
				width: 1000px;
	
	margin: auto;
	
}
.reportList .countAndSearch{
	margin-left: 400px;
	

}
.reportList .listArea {
	margin-left : 400px;
}
.reportList .listArea .boardList{

	width: 100%;
	margin: 1rem auto auto auto;
	text-align : center;
	
}

.reportList .listArea .boardList tr td{
	background: white;
	width: 100;
	min-width: 150px;
}

/* on/off 토글버튼 css */
.switch {
  	position: relative;
  	display: inline-block;
  	width: 60px;
  	height: 34px;
  	vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  	position: absolute;
  	cursor: pointer;
  	top: 0;
  	left: 0;
  	right: 0;
  	bottom: 0;
  	background-color: #ccc;
  	-webkit-transition: .4s;
  	transition: .4s;
}

.slider:before {
  	position: absolute;
  	content: "";
  	height: 26px;
  	width: 26px;
  	left: 4px;
  	bottom: 4px;
  	background-color: white;
  	-webkit-transition: .4s;
  	transition: .4s;
}

input:checked + .slider {
  	background-color: #2196F3;
}

input:focus + .slider {
  	box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  	-webkit-transform: translateX(26px);
  	-ms-transform: translateX(26px);
  	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  	border-radius: 34px;
}

.slider.round:before {
  	border-radius: 50%;
}

p {
   	margin:0px;
   	display:inline-block;
   	font-size:15px;
   	font-weight:bold;
}
/****************************************/
</style>
</head>
<body class="vertical  dark  ">
	<div class="wrapper"> <!-- 큰 틀 -->
		<!-- 헤더 -->
		<c:import url="../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../common/sidebar.jsp" />
		<div class="reportList">
			
			<div class="countAndSearch">
				<div class="count">
					신규 신고수
				</div>
				<input type="search" id="keyword" class="keywordSearch" style="width: 150px">
				<button type="button" id="searchBtn" onclick="search()">검색 </button>
			</div>
			
			<!-- list Area -->
			<div class="listArea">
				<table class="boardList">
					<thead>
						<th><center>No.</center></th>
						<th><center>제목</center></th>
						<th><center>작성자</center></th>
						<th><center>등록일</center></th>
						<th><center>신고자</center></th>
						<th><center>비활성화</center></th>
					</thead>
					<tbody>
						<tr>
							<td>숫자 카운팅 예정</td>		
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
							<td>신고자</td>
							<td>비활성화
								<label class="switch">
	        					<input type="checkbox">
	        					<span class="slider round"></span>
	      						</label>
	      						<p>OFF</p><p style="display:none;">ON</p>
							</td>
						</tr>	
					</tbody>
				</table>
			</div>	<!-- #listArea -->
			
		</div>
				<c:out value="${pageBar}" escapeXml="false"/>
	</div>	<!-- 큰 틀 끝 -->	
</body>

	<!-- wrapper script -->
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
    
	<!-- ★토글버튼 on/off 스크릡트★ : by 은열 -->
	<script type="text/javascript">
		var check = $("input[type='checkbox']");
		check.click(function(){
	   	$("p").toggle();
	});
	</script>
	
	
</html>