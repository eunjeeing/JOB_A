<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<style>
	#listArea {
		/*border: 1px solid blue;*/
		width : 100%;
		height : 600px;
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
	
	#backBtn {
		margin-top: 20px;
	}
	
	#contentsTbl {
		margin-top: 30px;
	}
	
	
</style>
<html>
	<head>
		<title>공지사항</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	</head>
	<body class="is-preload">
 
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
				<div id="main">
					<div class="inner">
							
						<c:import url="../../../user/common/header.jsp"/>
						
						<button id="backBtn" onclick="history.go(-1);">뒤로가기</button>
						
						<!-- 내부 내용 작성란 -->
						<div id="contentsTbl">
							<table>
								<thead>
									<tr>공지사항 제목</tr>
								</thead>
								<tbody>
									<tr>
										<td>작성자</td>
										<td></td>
									</tr>
								
								</tbody>
							</table>
						</div>
						
					</div>		<!-- #inner -->
				</div>			<!-- #main -->
				
				<!-- Menu Console -->
				<c:import url="../../../user/common/sideBar.jsp"/>
			</div>				<!-- wrapper -->

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
 			<script>
				// Menu Controller 
				// Menu.
				var $menu = $('#menu'),
					$menu_openers = $menu.children('ul').find('.opener');
				
				// Openers.
				$menu_openers.each(function() {
					var $this = $(this);
			      	$this.on('click', function(event) {
			        	// Prevent default.
			            event.preventDefault();
			         	// Toggle.
			            $menu_openers.not($this).removeClass('active');
			            $this.toggleClass('active');
			         	// Trigger resize (sidebar lock).
			            $window.triggerHandler('resize.sidebar-lock');
			      	});
				});
				
				// 수정용 JS
				
				// 삭제용 JS
   	

         	</script>
	</body>
</html>