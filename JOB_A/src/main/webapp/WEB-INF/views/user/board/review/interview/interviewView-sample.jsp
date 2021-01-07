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
		float: right;
	}
	
	#topBtnArea {
		width : 100%;
		display : block;
		height : 100px;
	}
	
	#contentsTbl {
		width : 100%;
		margin-top: 30px;
		display : block;
	}
	
	#contentsTbl>#inputTbl{
		width : 50%;
		align: center;
		margin: auto;
	}
	
	tr:first-child {
		width : 20%;
	}
	
	tr:last-child {
		width : 80%;
		text-align : left;
	}
	
	#contentsArea {
		width:50%;
		height: 500px;
		margin:auto;
	}
	
	#bottomBtnArea {
		display: flex;
	}
	
	#functionBtn{
		width : 40%;
		margin: auto;
		display: flex;
	}

	#editBtn,#deleteBtn{
		width : 40%;
		height: 40px;
		margin: auto;
		/*font-size: 10px;*/
	}

	
</style>
<html>
	<head>
		<title>게시판 | 면접후기</title>
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
							
						<c:import url="../../../../user/common/header.jsp"/>
						
						<div id="topBtnArea">
							<button id="backBtn" onclick="history.go(-1);">뒤로가기</button>						
						</div>
						
						<!-- 내부 내용 작성란 -->
						<div id="contentsTbl">
							<table id="inputTbl">
								<thead>
									<tr>
										<td>제목</td>
										<td>${interview.board_title}</td>
									</tr>
									
								</thead>
								<tbody>
									<tr>
										<td>작성자</td>
										<td>${interview.mem_nick}</td>
									</tr>
									<tr>
										<td>작성일</td>
										<td>${interview.board_date}</td>
									</tr>
								</tbody>
							</table>
							<br />
							<div id="contentsArea">
								<p>
									${interview.board_content}
								</p>
							</div>
						</div>
						<c:if test="${member.memNo == interview.mem_no}">
						<div id="bottomBtnArea">
							<div id="functionBtn">
								<!-- 수정 & 삭제 버튼 -->
								<button id="editBtn" onclick="updateNotice();">수정</button>
								<!-- <button id="deleteBtn" onclick="deleteNotice();">삭제</button> -->
							</div>
						</div>
						</c:if>
					</div>		<!-- #inner -->
				</div>			<!-- #main -->
				
				<!-- Menu Console -->
				<c:import url="../../../../user/common/sideBar.jsp"/>
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
				function updateNotice(){
			    		location.href = "${pageContext.request.contextPath}/updateInterview.bo?board_no="+${notice.board_no};
			    	}
				
         	</script>
	</body>
</html>