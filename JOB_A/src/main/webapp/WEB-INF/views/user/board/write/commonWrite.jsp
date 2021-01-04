<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<style>
	#listArea {
		width : 100%;
		height : 600px;
		margin: 40px auto auto auto;
	}
	#noticeList{
		text-align : center;
		margin: auto;
	}
	
	/* Top Button Area */
	#topBtnArea {
		width : 100%;
		display : block;
		height : 100px;
	}
	#backBtn {
		margin-top: 20px;
		float: right;
	}
	
	/* title, writer, date.. etc TableHead Area */ 
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
	tr>td:last-child{
		width : 80%;
		display : flex;
	}
	td>input[type="file"] {
		margin: auto;
	}
	
	/* Contents Area */
	#contentsArea {
		width:50%;
		height: 500px;
		margin:auto;
	}
	#contentsArea {
		height: 500px;
	}
	#contentsArea-text {
		height: 480px;
		resize: none;
	}
	
	/* Bottom Button Area */
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
	}
	
	/* Radio Button Area */
	#radioArea {
		display : block;
		width : 50%;
		height : auto;
		margin: 0px auto;
	}
	.radioBtn {
		display: inline-block;
	}
	
	/* 사진첨부 버튼 */
	#attachBtn {
		float: left;
		width : 100%;
	}
	
</style>
<html>
	<head>
		<title>글쓰기</title>
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
						<div id="topBtnArea">
							<button id="backBtn" onclick="history.go(-1);">뒤로가기</button>
						</div>
						
						<form name="noticeFrm" method="post" onsubmit="beforeSubmitChk();">
						<!-- 내부 내용 작성란 -->
						<div id="contentsTbl">
							<!-- <input type="hidden" name="board_no" value=""/> -->
							<div id="radioArea">
								<input type="radio" class="radioBtn" id="radio-free" name="type_no" onchange="changeAction(this);" value="4" /><label for="radio-free">자유</label>
								<input type="radio" class="radioBtn" id="radio-anon" name="type_no" onchange="changeAction(this);" value="5" /><label for="radio-anon">익명</label>
								<input type="radio" class="radioBtn" id="radio-until" name="type_no" onchange="changeAction(this);" value="6" /><label for="radio-until">24시</label>
								<input type="radio" class="radioBtn" id="radio-qna" name="type_no" onchange="changeAction(this);" value="7" /><label for="radio-qna">QnA</label>
								<input type="radio" class="radioBtn" id="radio-mento" name="type_no" onchange="changeAction(this);" value="8" /><label for="radio-mento">멘토</label>
							</div>
							<hr />
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
									<tr>
										<td>첨부파일</td>
										<td><input type="file" id="attachBtn" name="" value="사진첨부"/></td>
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

				function changeAction(obj) {
					if (obj.checked == true) {
						switch (obj.value) {
							case "4":
								document.forms[0].action = "${pageContext.request.contextPath}/noticeWrite.bo";
								console.log("case 4 선택됨")
								break;
							case "5":
								document.forms[0].action = "${pageContext.request.contextPath}/noticeWrite.bo";
								console.log("case 5 선택됨")
								break;
							case "6":
								document.forms[0].action = "${pageContext.request.contextPath}/noticeWrite.bo";
								console.log("case 6 선택됨")
								break;
							case "7":
								document.forms[0].action = "${pageContext.request.contextPath}/noticeWrite.bo";
								console.log("case 7 선택됨")
								break;
							case "8":
								document.forms[0].action = "${pageContext.request.contextPath}/noticeWrite.bo";
								console.log("case 8 선택됨")
								break;
						}
					}
				}

				function beforeSubmitChk() {
					if (type_no == null) {
						window.alert("게시판 항목을 선택해주세요.");
					} else {
						if
					}
				}
	
         	</script>
	</body>
</html>