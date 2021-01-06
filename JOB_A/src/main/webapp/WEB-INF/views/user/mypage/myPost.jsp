<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 게시글조회</title>
<style>
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
	

</style>
</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<c:import url="../common/header.jsp"/>
							
						<div id="listArea">
							<table id="myPostList">
								<thead>
								<tr>
									<th width="5%"><input type="checkbox" id="checkAll" name="checkAll" /> 
											<label class="form-check-label" for="checkAll"></label></th>
									<th><center>No.</center></th>
									<th><center>게시판</center></th>
									<th><center>제목</center></th>
									<th><center>작성자</center></th>
									<th><center>등록일</center></th>
									<th><center>조회수</center></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ selectMyPost }" var="mp">
									<!--  onclick="selectOne();" -->
									<tr id="${mp.board_No}">
										<td><input type="checkbox" class="chkBox" id="chkBox" name="chkBox">
											</td>
										<td><center>${mp.board_No}</center></td>
										<td><center>${mp.type_Name }</center></td>
										<td><center>${mp.board_Title}</center></td>
										<td><center>${mp.mem_Nick}</center></td>
										<td><center>${mp.board_Date}</center></td>
										<td><center>${mp.board_View}</center></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>	
						<c:out value="${pageBar}" escapeXml="false"/>
														<input type="checkbox" id="allCheck">
							
							
						</div>
					</div>

				<c:import url="../common/sideBar.jsp"/>

			</div>
	
</body>
</html>