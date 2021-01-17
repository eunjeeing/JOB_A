<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 댓글조회</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
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
	
	#nonListArea {
			height : 300px;
			width : 10%;
			text-align: center;
			display: table-cell;
			vertical-align: middle;
		}
	#nonListArea>div{
		display: inline-block;
	}
	
	#nonListArea>div>p{
		font-size : 35px;
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
						
						<c:if test="${!empty selectMyComment}">
						<div id="listArea">
						<p style="font-size:17px;"><a href="${pageContext.request.contextPath}/mypage/selectMyPost.do?mem_No=${member.memNo}" style="border: none; color: black;">게시글</a>
							&nbsp;&nbsp;&nbsp;<text style="font-size:20px; color:black;">|</text>&nbsp;&nbsp;&nbsp;&nbsp;<text style="color: #f56a6a;">댓글</text></p>
							<table id="myPostList">
								<thead>
								<tr>
									<th width="5%"><center>
										<div><input type="checkbox" id="checkAll">
										<label for="checkAll"></label></div>
									</center></th>
									<th width="5%"><center>No.</center></th>
									<th><center>댓글내용</center></th>
									<th width="20%"><center>등록일</center></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ selectMyComment }" var="mc">
									<tr id="${mp.comm_No }" align="center">
										<input class="tno" type="hidden" value="${mc.type_No }" />
										<td>
											<div><input type="checkbox" class="chk" id="${mc.comm_No }" data-cno="${mc.comm_No }">
											<label for="${mc.comm_No }"></label></div>
										</td>
										<td width="">${mc.comm_No }</td>
										<td class="goBoard" id="${mc.board_No}">${mc.comm_Content}</td>
										<fmt:parseDate var="parsedDate" value="${mc.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
										<td id="clock"><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
										
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<button class="btn btn-default" data-cno="${mc.comm_No }" id="deleteChk"><i class="fa fa-check" aria-hidden="true"></i>
							삭제</button>
						<c:out value="${pageBar}" escapeXml="false"/>
						</c:if>
						
						<c:if test="${empty selectMyComment}">
							<div id="listArea">
								<p style="font-size:17px;"><a href="${pageContext.request.contextPath}/mypage/selectMyPost.do?mem_No=${member.memNo}" style="border: none; color: black;">게시글</a>
								&nbsp;&nbsp;&nbsp;<text style="font-size:20px; color:black;">|</text>&nbsp;&nbsp;&nbsp;&nbsp;<text style="color: #f56a6a;">댓글</text></p>
							</div>
							<div id="nonListArea">
								<p>등록된 댓글이 없습니다.</p>
							</div>
						</c:if>	
							
							
						</div>
					</div>

				<c:import url="../common/sideBar.jsp"/>

			</div>
			
	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>

	// 해당 게시글로 이동
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

			case '6':
				location.href = "${pageContext.request.contextPath}/selectOneTomorrow.bo?board_no="+ board_No;
				break;

			case '7':
				location.href = "${pageContext.request.contextPath}/board2/qnaSelectOne.do?board_No="+ board_No;
				break;	

			case '8':
				location.href = "${pageContext.request.contextPath}/selectOneMento.bo?board_no="+ board_No;
				break;
				
			case '9':
				location.href = "${pageContext.request.contextPath}/selectOneInterview.bo?board_no="+ board_No;
				break;

			case'10':
				location.href = "${pageContext.request.contextPath}/selectOneAccept.bo?board_no="+ board_No;
				break;
			}
		});
	});

	// checkAll 체크 --> 개별 체크박스 모두 체크
	$("#checkAll").click(function(){
	    if($("#checkAll").prop("checked")){
	            $(".chk").prop("checked",true);
	    }else{
	            $(".chk").prop("checked",false);
	    }
	});

	// 개별 체크박스 선택 or 선택해제 --> checkAll 체크박스 해제
	$(".chk").click(function(){
		$("#checkAll").prop("checked", false);
	});

	// 체크된 댓글 삭제
	$("#deleteChk").click(function(){

		var checkArr = new Array();

		$("input[class='chk']:checked").each(function(){
			checkArr.push($(this).attr("data-cno"));
		});

		console.log(checkArr);

		if(checkArr.length == 0) {
			alert("선택된 항목이 없습니다.")
			return false;
		}
		
		var confirm_val = window.confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {

			$.ajax({
				url : "/joba/mypage/deleteChkComment.do",
				type : "post",
				data : { chk : checkArr },
				success : function(result){

					if(result == 1) {
						location.href = "/joba/mypage/selectMyComment.do?mem_No=" + ${member.memNo};
					}
					else{
						window.alert("삭제 실패");
					}
					
				}
			});
		}
	});

</script>
</body>
</html>