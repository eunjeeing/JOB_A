<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 레벨업</title>
 	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/bg2.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

	#writeBtn {
		float: right;
	}
	
	#listArea {
		/*border: 1px solid blue;*/
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
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />

				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">레벨업</h3>
					</div>
				</div>

				<!-- search / write area -->
				<div id="utilBox">
					<div id="searchBox">
						<input type="search" id="search" placeholder="검색내용을 입력해주세요."
							onKeyDown="enterKey();" />
					</div>
					<button type="button" id="searchBtn" onclick="search()"
					style="width: 50px;"><i class="fas fa-search" style="margin: -9px;"></i>
					</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/board2/selectQnAList.do'"
					style="width: 50px;"><i class="fas fa-redo" style="margin: -9px;"></i></button>
					
					<c:if test="${ !empty member}" >
						<button id="writeBtn" onclick="goQnAForm();">글쓰기</button>
					</c:if>
				</div>
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
									<c:forEach items="${ selectQnAList }" var="qna">
									<!--  onclick="selectOne();" -->
									<tr id="${qna.board_No}">
										<td>${qna.board_No}</td>
										<td width="60%">${qna.board_Title}</td>
										<td>${qna.mem_Nick}</td>
										<td>${qna.board_Date}</td>
										<td>${qna.board_View}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>	<!-- #listArea -->
						<c:out value="${pageBar}" escapeXml="false"/>
		
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<c:if test="${!empty member }">
	<script>
			$(function() {
				$("tr[id]")
						.on(
								"click",
								function() {
									var board_No = $(this).attr("id");
									console.log("board_No=" + board_No);
									location.href = "${pageContext.request.contextPath}/board2/qnaSelectOne.do?board_No="
											+ board_No;
								});
			});
	</script>
	</c:if>
	<c:if test="${empty member }">
	<script>
		$(function() {
				$("tr[id]")
						.on(
								"click",function() {
									window.alert("로그인 후 이용해주세요");
								});
				});
	</script>
	</c:if>
	<script>
		function goQnAForm() {
			location.href = "${pageContext.request.contextPath}/board2/qnaForm.do";
		}

    	function search() {
			location.href="${pageContext.request.contextPath}/board2/searchQnAList.do?keyword="+$('#search').val();

    	}
    	
    	function enterKey() {
    			if (event.keyCode==13){
    				location.href="${pageContext.request.contextPath}/board2/searchQnAList.do?keyword="+$('#search').val();
    			}
    		}
	</script>			
</body>
</html>