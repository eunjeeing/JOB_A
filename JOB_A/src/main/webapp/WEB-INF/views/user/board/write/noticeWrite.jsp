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
		width : 50%;
		margin: auto;
		display: flex;
	}

	#editBtn,#deleteBtn, #cancelBtn{
		width : 30%;
		height: 40px;
		margin: auto;
		/*font-size: 10px;*/
	}
	
	table>thead>tr>td>input {
		width: 100px;
	}
	
	#contentsArea {
		height: 500px;
	}
	
	#contentsArea-text {
		height: 480px;
		resize: none;
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
						<div id="topBtnArea">
							<button id="backBtn" onclick="history.go(-1);">뒤로가기</button>
						</div>
						
						<form name="noticeFrm" action="${pageContext.request.contextPath}/insertNotice.bo" method="post">
						<div id="contentsTbl">
							<!-- <input type="hidden" name="board_no" value=""/> -->
							<table id="inputTbl">
							<input type="hidden" name="mem_no" value="${member.memNo}"/>
								<thead>
									<tr>
										<td>제목</td>
										<td><input type="text" name="board_title"/></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>작성자</td>
										<td>${member.memNick}</td>
									</tr>
								</tbody>
							</table>
							<br />
							<div id="contentsArea">
								<p>
									<textarea type="textarea" id="contentsArea-text" name="board_content"></textarea>
								</p>
							</div>
						</div>
						
						<div id="bottomBtnArea">
							<div id="functionBtn">
								<!-- 수정 & 삭제 버튼 -->
								<input type="submit" id="editBtn" value="등록"/>
								<button type="button" id="cancelBtn" onclick="history.go(-1)">취소</button>
							</div>
						</div>
						</form>
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
	
         	</script>
	</body>
</html>