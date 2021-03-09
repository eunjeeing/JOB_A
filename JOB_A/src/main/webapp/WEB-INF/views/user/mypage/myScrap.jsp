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
		float:right;
		margin-bottom : 20px;
	}
	
	#searchBox {
		width : 35%;
		height : 100%;
		float : right;
		margin-right : 10px;
	}
	
	#selectBox {
		width : 15%;
		align : center;
		border : 2px solid #f56a6a;
		border-radius : 8%;
	}
	/*
	#searchBtn {
		float: right;
	}*/
	/*
	#cancelSearchBtn {
		float: right;
	}*/
	
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
	
	#nonListArea {
		height : 600px;
		width : 100%;
		display : flex;
	}
	
	#nonListArea>p{
		height : auto;
		width : auto;
		margin : auto;
		font-size : 150%;
	}
	
	/* bookmark icon size adjustment*/
	.bookmarkIcon {
		height : 20px;
		width : 20px;

	}
	
</style>
<html>
	<head>
		<title>MYPAGE | MYSCRAP</title>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
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
							
						<c:import url="../common/header.jsp"/>

						<!-- search / write area -->
						<div id="utilBox">
							<div id="searchBox">
								<input type="search" id="search" name="keyword" placeholder="제목을 입력해주세요" 
										onKeyDown="enterKey(${sessionScope.member.memNo});" style="width : 60%; float:right;" />
							</div>
							<form action="${pageContext.request.contextPath}/myscrap/sortScrapList.bo">
								<input type="hidden" name="mem_no" value="${sessionScope.member.memNo}" />
								<select name="type_no" id=selectBox>
									<option value="0"> 전체</option>
									<option value="2"> 채용공고</option>
									<option value="4"> 블라블라</option>
									<option value="5"> 블라인드</option>
									<option value="8"> 멘토멘티</option>
									<option value="9"> 면접후기</option>
									<option value="10"> 합격후기</option>
								</select>
								<input type="submit" value="조회"/>
							</form>
						</div>
						
						<br />
						<!-- list Area -->
						<c:if test="${!empty myScrapList}">
							
						<div id="listArea">
							<table id="noticeList">
								<thead>
									<th><center>No.</center></th>
									<th><center>게시판</center></th>
									<th><center>제목</center></th>
									<th><center>작성자</center></th>
									<th><center>등록일</center></th>
									<th><center>조회수</center></th>
								</thead>
								<tbody>
									<c:forEach items="${myScrapList}" var="scrap">
									<!--  onclick="selectOne();" -->
									<tr id="${scrap.board_no}" onclick="selectOne(${scrap.board_no}, ${scrap.type_no});">
										<td>${scrap.board_no}</td>		<!-- 숫자 카운팅으로 변경 -->
										<td>${scrap.type_name }</td>
										<td>${scrap.board_title}</td>
										<td>${scrap.mem_nick}</td>
										<td>${scrap.board_date}</td>
										<td>${scrap.board_view}</td>
										<td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>	<!-- #listArea -->
						<c:out value="${pageBar}" escapeXml="false"/>
						</c:if>
						
						<!-- list 가 존재 하지 않을 경우 출력 -->
						<c:if test="${empty myScrapList}">
							<div id="nonListArea">
								<p>아직 스크랩한 게시글이 없어요.. ㅠㅜ</p>
							</div>
						</c:if>
						
					</div>		<!-- #inner -->
				</div>			<!-- #main -->
				
				<!-- Menu Console -->
				<c:import url="../common/sideBar.jsp"/>
			</div>				<!-- wrapper -->

		<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
 			<script>
					function selectOne(board_no, type_no) {
						switch(type_no) {
							case 2 :
								location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No=" + board_no;
								break;
							case 4 :
								location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No=" + board_no;
								break;
							case 5 :
								location.href = "${pageContext.request.contextPath}/board2/blindSelectOne.do?board_No=" + board_no;
								break;
							case 6 :
								location.href = "${pageContext.request.contextPath}//selectOneTomorrow.bo?board_no=" + board_no;
								break;
							case 8 :
								location.href = "${pageContext.request.contextPath}/selectOneMento.bo?board_no=" + board_no;
								break;
							case 9 :
								location.href = "${pageContext.request.contextPath}/selectOneInterview.bo?board_no=" + board_no;
								break;
							case 10 :
								location.href = "${pageContext.request.contextPath}/selectOneAccept.bo?board_no=" + board_no;
								break;
						}
					}
					
			    	
			    	function search() {
						if (cPage==1) {
			    			location.href="${pageContext.request.contextPath}/searchScrapList.bo?keyword="+$('#search').val();
						} else {
			    			location.href="${pageContext.request.contextPath}/searchScrapList.bo?keyword=${keyword}";
			    		}
			    	}
			    	
			    	function enterKey( mem_no ) {
		    			if (event.keyCode==13){
		    				location.href="${pageContext.request.contextPath}/searchScrapList.bo?keyword="+$('#search').val()+"&mem_no=" + mem_no;
		    			}
		    		}
			    						
         	</script>
	</body>
</html>