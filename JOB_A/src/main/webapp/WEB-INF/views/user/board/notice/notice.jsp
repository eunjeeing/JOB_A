<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<style>
	
	#banner{
		float : flex;
		height: 600px;
	}
	
	#topbanner {
		background-image: url(${pageContext.request.contextPath}/resources/images/pic01.jpg);
		background-size: 100% 100%;
		margin-top: 10px;
		border: 1px solid black;
		height: 300px;
		display: flex;
	}
	
	#topbanner-textarea {
		width: 40%;
		height: 50%;
		margin: auto;
		padding: auto;
		border : 1px solid black;
		display: flex;
		background : black;
		opacity : 0.4;
	}
	
	#topbanner-text {
		font-size: 40px;
		font-weight: 500;
		margin: auto;
		color: white;
	}
	
	#utilBox {
		width : 100%;
		height : 50px;
		margin-top : 50px;
	}
	
	#searchBox {
		width : 35%;
		height : 100%;
		float : left;
		margin-right : 10px;
	}
	
	#writeBtn {
		float: right;
	}
	
	#listArea {
		border: 1px solid blue;
		width : 100%;
		height : 800px;
		margin: 20px auto auto auto;
	}
	
	.pagination {
		text-align: center;
		margin-top : 20px;
		margin-bottom : 100px;
	}
	
	  
</style>
<script>

	function search() {
			location.href="${pageContext.request.contextPath}/searchNotice.bo?keyword="+$('#search').val();
		}
	
	function enterKey() {
			if (event.keyCode==13){
				location.href="${pageContext.request.contextPath}/searchNotice.bo?keyword="+$('#search').val();
			}
		}
</script>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

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
						<!-- Top Banner Area -->
						<div id="topbanner">
							<div id="topbanner-textarea">
								<h3 id="topbanner-text">공지사항</h3>							
							</div>
						</div>
						
						<!-- search / write area -->
						<div id="utilBox">
							<div id="searchBox">
								<input type="search" id="search" placeholder="검색내용을 입력해주세요." onKeyDown="enterKey();" />
							</div>
							<button type="button" id="searchBtn" onclick="search()">검색
							</button>
							<button id="writeBtn">글쓰기
							</button>
						</div>
						
						<!-- list Area -->
						<div id="listArea">
							<table id="noticeList">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
								<c:forEach items="${ noticeList }" var="notice">
								<tr>
									<td>${notice.board_no}</td>
									<td>${notice.board_title}</td>
									<td>${notice.board_writer}</td>
									<td>${notice.board_date}</td>
									<td>${notice.board_view}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						
						<!-- page button area -->
						<!-- 임시 페이징 처리 Utils.java 코드를 이용할 계획 -->
						<!-- 
						<ul class="pagination">
							<li><span class="button disabled">Prev</span></li>
							<li><a href="#" class="page active">1</a></li>
							<li><a href="#" class="page">2</a></li>
							<li><a href="#" class="page">3</a></li>
							<li><span>&hellip;</span></li>
							<li><a href="#" class="page">8</a></li>
							<li><a href="#" class="page">9</a></li>
							<li><a href="#" class="page">10</a></li>
							<li><a href="#" class="button">Next</a></li>
						</ul>
						
						-->
						<c:out value="${pageBar}" escapeXml="false"/>
						
					</div>
					
					
					
				</div>
				
				<!-- Menu Console -->
				<c:import url="../../../user/common/sideBar.jsp"/>
			</div>

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