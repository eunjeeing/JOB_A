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
	
	.goBoard:hover {
		cursor: pointer;
		
	}
	
	tr>td{
		background : white;
	}
	
	.goBoard:hover{
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
	
	input[type=checkbox] {
	appearance: auto !important;
	opacity: 1 !important;
	 }
 input[type="checkbox"],
  input[type="radio"] {
    text-decoration: none;
    color: #7f888f;
    cursor: pointer;
    display: inline-block;
    font-size: 1em;
    font-weight: 400;
    padding-left: 2.4em;
    padding-right: 0.75em;
    position: unset;
          border-radius: 0.375em;
      border: solid 1px rgba(210, 215, 217, 0.75); }

  input[type="checkbox"]:checked,
  input[type="radio"]:checked {
    background: #3d4449 !important;
    border-color: #3d4449 !important;
    color: #ffffff !important; }
    
  input[type="checkbox"]:focus,
  input[type="radio"]:focus {
    border-color: #f56a6a;
    box-shadow: 0 0 0 1px #f56a6a; }	

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
									<th width="5%"><center><input type="checkbox" id="checkAll"></center></th>
									<th><center>No.</center></th>
									<th><center>게시판</center></th>
									<th width="50%"><center>제목</center></th>
									<th><center>작성자</center></th>
									<th><center>등록일</center></th>
									<th><center>조회수</center></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ selectMyPost }" var="mp">
									<!--  onclick="selectOne();" -->
									<tr align="center">
										<input class="tno" type="hidden" value="${mp.type_No }" />
										<td><input type="checkbox" id="chk" value="${mp.board_No}"></td>
										<td>${mp.board_No}</td>
										<td>${mp.type_Name }</td>
										<td class="goBoard" id="${mp.board_No}">${mp.board_Title}</td>
										<td >${mp.mem_Nick}</td>
										<td>${mp.board_Date}</td>
										<td>${mp.board_View}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
							<button id="delete" class="btn btn-default" onclick="deleteChk();"><i class="fa fa-check" aria-hidden="true"></i>
							삭제</button>				
						<c:out value="${pageBar}" escapeXml="false"/>
							
							
						</div>
					</div>

				<c:import url="../common/sideBar.jsp"/>

			</div>
<script>
	$(function(){
		$(".goBoard").on("click", function(){
			var board_No = $(this).attr("id");
			var tno = $(this).siblings('.tno').val();

			console.log(board_No);
			console.log(tno);
			
			switch(tno) {
			case '1':
				location.href = "${pageContext.request.contextPath}/notice.bo?board_no="+ board_No;
				break;
				
			case '2':
				location.href = "${pageContext.request.contextPath}/board2/jobSelectOne.do?board_No="+ board_No;
				break;

			case '4':
				location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="+ board_No;
				break;
			
			case '5':
				location.href = "${pageContext.request.contextPath}/board2/blindSelectOne.do?board_No="+ board_No;
				break;

			case '7':
				location.href = "${pageContext.request.contextPath}/board2/qnaSelectOne.do?board_No="+ board_No;
				break;	
			}
		});
	});

	$(document).ready(function(){
	    $("#checkAll").click(function(){
	        if($("#checkAll").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true);
	        }else{
	            $("input[type=checkbox]").prop("checked",false);
	        }
	    });
	});

	function deleteChk(){
			var chk = "";
			$( "input[id='chk']:checked" ).each (function (){
				  chk = chk + $(this).val()+ "," ;
			 });
			 chk = chk.substring(0,chk.lastIndexOf( ","));
	 
	  if(chk == ''){
	    alert("삭제할 항목을 선택하세요.");
	    return false;
	  }
			 
	  if(confirm("삭제 하시겠습니까?")){
	  }
	}
</script>
</body>
</html>