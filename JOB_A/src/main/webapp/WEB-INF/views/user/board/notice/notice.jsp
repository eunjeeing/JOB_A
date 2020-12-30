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
	
	tbody>tr:hover {
		cursor: pointer;
		
	}
	
	tr>td{
		background : white;
	}
	
	tbody>tr:hover{
		background : black;
		opacity: 0.3;
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
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
 
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
							<button id="writeBtn" onclick="fn_goBoardForm();">글쓰기
							</button>
						</div>
						
						<!-- list Area -->
						<div id="listArea">
							<table id="noticeList">
								<thead>
									<th><center>No.</center></th>
									<th><center>제목</center></th>
									<th><center>작성자</center></th>
									<th><center>등록일</center></th>
									<th><center>조회수</center></th>
								</thead>
								<tbody>
									<c:forEach items="${ noticeList }" var="notice">
									<!--  onclick="selectOne();" -->
									<tr id="${notice.board_no}">
										<td>${notice.board_no}</td>		<!-- 숫자 카운팅으로 변경 -->
										<td>${notice.board_title}</td>
										<td>${notice.mem_nick}</td>
										<td>${notice.board_date}</td>
										<td>${notice.board_view}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<c:out value="${pageBar}" escapeXml="false"/>
						
					</div>		<!-- #inner -->
				</div>			<!-- #main -->
				
				<!-- Menu Console -->
				<c:import url="../../../user/common/sideBar.jsp"/>
			</div>				<!-- wrapper -->

		<!-- Scripts -->
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

			     	$(function(){
			    		$("tr[id]").on("click", function(){
			    			var board_no = $(this).attr("id");
			    			console.log("board_no="+ board_no);
			    			location.href = "${pageContext.request.contextPath}/selectOneNotice.bo?no="+ board_no;
			    		});
			    	});
			    	
			    	function search() {
				    	//var cPage = ${pageNo};
						if (cPage==1) {
			    			location.href="${pageContext.request.contextPath}/searchNotice.bo?keyword="+$('#search').val();
						} else {
			    			location.href="${pageContext.request.contextPath}/searchNotice.bo?keyword=${keyword}";
			    		}
			    	}
			    	
			    	function enterKey() {
			    			if (event.keyCode==13){
			    				location.href="${pageContext.request.contextPath}/searchNotice.bo?keyword="+$('#search').val();
			    			}
			    		}

			    	function fn_goBoardForm(){
			    		location.href = "${pageContext.request.contextPath}/user/board/write/boardForm.do";
			    	}
			    	
			    	/*
			    	function selectOne() {
			    		var board_no = $(this).attr("id")
			    		location.href = "${pageContext.request.contextPath}/selectOneNotice.bo?no="+ board_no;
			    		}
			    	*/
					
         	</script>
	</body>
</html>