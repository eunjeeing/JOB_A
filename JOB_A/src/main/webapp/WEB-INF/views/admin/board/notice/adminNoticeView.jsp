<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리 | 관리자 공지 상세</title>

<style>
	.tab {
		display: inline-block;
		padding-right: 10px;
	}
	
	/* p {
		background: #80808026;
	    padding: 5px 8px 5px 8px;
	    color: black;
	    border-radius: 5px;
	}
	
	p:hover {
		background: black;
		color: white;
		cursor: pointer;
		padding: 20px 8px 5px 8px;
	} */
	
	#mento {
		font-weight:800;
	}
	
	.goBoard:hover{
		cursor:pointer;
	}
	
	.trtr:hover{
		background: #EAEAEA;
	}
	
	#buttonArea {
		float: right;
	}
	
/* 	p {
		background-color : lightgrey !important;
	}
	
	p:hover {
		background-color : lightgrey !important;
	} */
	.article-view-head {
	position: relative;
	z-index: 10;
	padding: 25px 20px 19px;
}

.name {
	margin-top: 16px !important;
	font-size: 16px;
	line-height: 16px;
}

p {
	padding-right: 20px !important;
	margin: 0 !important;
}

.article-view-head .wrap-info {
	margin-top: 16px;
}

.wrap-info {
	position: relative;
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 14px;
}

.wrap-info a, .wrap-info span {
	margin-right: 14px;
	color: #94969b;
	vertical-align: top;
}
.wrap-info a {
	border-bottom: 0px;
}
.article-view-head .wrap-info .info_fnc {
	top: -2px;
}

.wrap-info .info_fnc {
	position: absolute;
	top: 0;
	right: 0;
}

.article-view-contents {
	margin: 10px 20px;
	border-top: 1px solid #eee;
}

.article-view-contents .contents-txt {
	margin-top: 24px;
	line-height: 1.6em;
	font-size: 17px;
}

.article-comments {
	margin: 10px 20px;
	padding: 23px 0 24px;
	border-top: 1px solid #eee;
}

#head {
	margin: 14px 14px 14px 14px;
}

#report {
	margin-right: 0;
	font-size: 20px;
}

#book {
	margin-left: 14px;
	font-size: 20px;
	margin-right: 0;
}

.wrap-info .rebo {
	color: black !important;
}

.article-comments .wrap-comment {
	padding: 8px 20px 15px;
	border-bottom: 1px solid #eee;
}

.article-comments .wrap-comment .name {
	margin-top: 9px;
	color: #94969b;
	font-size: 13px;
	line-height: 1.33em;
}

.article-comments .wrap-comment .cmt-txt {
	margin-top: 4px;
	font-size: 14px;
	line-height: 1.43em;
}

.article-comments .wrap-comment .wrap-info {
	margin-top: 10px;
}

.cmt-txt {
	margin: 0;
}

#comm_Con2 {
	margin: 0;
	border: none;
	resize: none;
}

#close-icon:hover {
	cursor:pointer;
}

/* #comm_Con2:focus {
	border: none;
    box-shadow: 0 0 0 0; 
} */
.wrap-info i {
    margin-right: 0;
}

/* 대댓글 스타일 */
.article-comments .wrap-reply {
    margin-top: -1px;
    border-top: 1px solid #eee;
   /*  background-color: #f8f8f8; */
}

.article-comments .wrap-reply .wrap-comment {
    padding: 8px 20px 15px 40px;
}

/* .article-comments .wrap-reply textarea {
	 background-color: #f8f8f8;
} */

.rebo:hover {
	cursor:pointer;
}

.fa-exclamation-triangle:hover {
	cursor:pointer;
	color:black;
}

form {
	margin: 0 !important;
}
	
</style>
</head>
<body class="vertical  dark">
	<div class="wrapper">
		<!-- 헤더 -->
		<c:import url="../../common/navbar.jsp" />
		<!-- 사이드 바 -->
		<c:import url="../../common/sidebar.jsp" />
		
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div>
							<h2 class="page-title">ADMIN NOTICE VIEW <button class="btn mb-2 btn-light" style="float:right; position:-30px;"onclick="history.go(-1);"> 뒤로가기</button></h2>
						</div>
						<br />
						
						<!-- 헤더 -->
						<div class="row top">
							<div class="col-md-12 top">
								<div class="card shadow top" style="height: auto;">
									<div class="card-body top">
										<table class="table table-hover table-borderless border-v">
											<thead>
												<tr align="center">
													<th>No.</th>
													<th>작성자</th>
													<th>등록일</th>
													<th>상태</th>
													<!-- <th>답변상태</th> -->
													<th>활성화여부</th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<th>${notice.board_no}</th>
													<th>${notice.mem_nick}</th>
													<th>${notice.board_date}</th>
													<th>
														<c:if test="${notice.board_status eq 'Y'}">
															<span class='badge badge-success'>정상</span>
														</c:if> <c:if test="${notice.board_status eq 'B'}">
															<span class='badge badge-danger'>블라인드</span>
														</c:if>  <c:if test="${notice.board_status eq 'N'}">
															<span class='badge badge-secondary'>삭제</span>
														</c:if> 
													</th>
													<%-- <th>
														<c:if test="${notice.comm_count > 0}">
															<span class='badge badge-success'>완료</span>
														</c:if>
														<c:if test="${notice.comm_count == 0}">
															<span class='badge badge-secondary'>미완료</span>
														</c:if>
													</th> --%>
													<th>
														<c:if test="${notice.board_status eq 'Y' }">
															<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusB.do?board_No=${notice.board_no}&type_No=${notice.type_no}'">블라인드</button>
														</c:if>
														<c:if test="${notice.board_status eq 'B' }">
															<button class="btn mb-2 btn-light" style="margin-bottom:0 !important;"
																onclick="location.href='${pageContext.request.contextPath}/admin/updateStatusY.do?board_No=${notice.board_no}&type_No=${notice.type_no}'">활성화</button>
														</c:if>
														<c:if test="${notice.board_status eq 'N'}">
															<button class="btn mb-2 btn-light" disabled="disabled">활성화</button>
														</c:if>
													</th>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
						<br /><br />

						
						<!-- 본문 -->
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
										<div id="buttonArea">
											<button class="btn mb-2 btn-primary" onclick="goUpdate(${notice.board_no});">수정</button>&nbsp;
											<button class="btn mb-2 btn-primary" onclick="deleteNotice(${notice.board_no});">삭제</button>
										</div>
											
										<div class="basicInfo" style="margin-top:20px;">
											<h2 align="center"><!-- 제모오오오옥 -->${notice.board_title}</h2>
											<!-- <input type="text" id="simpleInput" class="form-control form-control-lg"/> -->
											<br /><hr />
											<div style="display:flex;">
												<!-- <textarea name="" id="" cols="30" rows="10">
												awefjkl;asdfjkl;asdfjkl;asdfjkl;asdfjkl;
												</textarea>>	 -->			
												<div  style="width:45%; margin:auto;">
													<!-- 내요요오오오오ㅗㅇㅇ -->${notice.board_content}
												</div>
								
											</div>
										</div>
										<br>
										
									</div>
								</div>
							</div>
							<!-- Bordered table -->
						</div>
						<br /><br />
						<div class="row">
							<div class="col-md-12">
								<div class="card shadow">
									<div class="card-body">
										<div class="article-comments">
											<h3 style="font-weight: 500">댓글 ${notice.comm_count }</h3>
											<div class="write_area">
												<div id="btn_add_comment" style="display: flex;">
													<div class="reply_area" style="width: 100%;">
														<form id="commentForm" method="post">
														<input type="hidden" id="mem_No" name="mem_No"
															value="${sessionScope.mem_No }" /> 
														<input type="hidden" name="comm_Ref" value="0" />
														<input type="hidden" name="comm_Level" value="1" />
														<textarea id="comm_Content" name="comm_Content" maxlength="500"
															placeholder="댓글을 남겨주세요." style="resize: none; width:100%; background-color : lightgrey; color:black;"></textarea>
														</form>
														
														<!-- 글자 수 -->
														<div class="byte" style="float:right; font-size:12px; color:darkgray;">
															<text id="commentByte">0</text><text id="slash"> / </text><text id="maxByte">500</text>
														</div>
			
														
													</div>
													<div class="reply_button" style="height:100%;">
														<button class="btn mb-2 btn-primary" id="insertComment" type="button" 
														style="font-weight: 300; font-size: 20px; width:150%;">작성</button>
													</div>
												</div>
											</div>
											
											<c:forEach items="${commentList}" var="co">
												<c:if test="${co.comm_Level eq 1}">
												<div id="${co.comm_No }" class="wrap-comment comment-area">
													<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq notice.mem_no }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">작성자</text></c:if></p>
													<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="width:100%; overflow:auto; background-color: lightgrey; color:black;">${co.comm_Content }</textarea></p>
													<div class="wrap-info">
													
														<span class="date"> <i class="far fa-clock"></i>
														<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
														<a class="cmt" href="#" onclick="reComment(this);return false;"> <i class="far fa-comment"> </i> 대댓글
														</a>
														<div class="info_fnc">
																<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
													      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
														  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
														  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
															<c:if test="${member.memNo eq co.mem_No}">
																<a href="#" onclick="updateComment(this);return false;">수정</a>
																<a href="#" class="updateConfirm" onclick="updateConfirm(this);" style="display:none;" >수정완료</a>												
																<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&comm_No=${co.comm_No }'">삭제</a>
															</c:if>
															
															<%-- <c:if test="${member.memNo ne co.mem_No}">
															<span class="reportBtn_comment" id="reportBtn_comment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
																<!-- ----------------------- 댓글신고정보 by 은열 ------------------------------ -->
																<input type="hidden" class="board_comment_info" value="${co.comm_No }">
																<input type="hidden" class="board_comment_mem_no" value="${co.mem_No }">
																<input type="hidden" class="board_comment_reporter" value="${member }">
																<!-- ----------------------------------------------------- -->
															</c:if> --%>
														</div>
													</div>
												</div>
											</c:if>
												
											<!-- 대댓글일때 -->
											<c:if test="${co.comm_Level ne 1}">
												<div class="wrap-reply">
													<div id="${co.comm_No }" class="wrap-comment comment-area">
														<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq notice.mem_no }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">작성자</text></c:if></p>
														<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="width:100%;overflow:auto; background-color:lightgrey; color:black;">${co.comm_Content }</textarea></p>
														<div class="wrap-info">
														
														<span class="date"> <i class="far fa-clock"></i>
														<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
														<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
															<div class="info_fnc">
																	<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
														      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
															  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
															  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
																<c:if test="${member.memNo eq co.mem_No}">
																	<a href="#" onclick="updateComment(this);return false;">수정</a>
																	<a href="#" class="updateConfirm" onclick="updateConfirm(this);" style="display:none;" >수정완료</a>												
																	<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&comm_No=${co.comm_No }'">삭제</a>
																</c:if>
																<c:if test="${member.memNo ne co.mem_No}">
																<span class="reportBtn_cocomment" id="reportBtn_cocomment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
																<!-- ----------------------- 대댓글신고정보 by 은열 ------------------------------ -->
																<input type="hidden" class="board_cocomment_info" value="${co.comm_No }">
																<input type="hidden" class="board_cocomment_mem_no" value="${co.mem_No }">
																<input type="hidden" class="board_cocomment_reporter" value="${member }">
																<!-- -------------------------------------------------------- -->
																</c:if>	
															</div>
														</div>
													</div>
												</div>
											</c:if>			
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>

			</div>
			<!-- end section -->
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->
<script>
	function goUpdate(board_no) {
		location.href="${pageContext.request.contextPath}/admin/adminNoticeUpdateForm.bo?board_no=" + board_no;
	}
	
	function deleteNotice(board_no) {
		location.href="${pageContext.request.contextPath}/admin/deleteAdminNotice.bo?board_no=" + board_no;
	}
	
	$(function(){
		
		$("#notice").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/noticeList.bo";
		});
		
		$("#adminNotice").on("click", function(){
			location.href = "${pageContext.request.contextPath}/admin/adminNotice.bo";
		});
	});
	
	$(function(){
		$(".goBoard").on("click", function(){
			var board_No = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/admin/noticeView.bo?board_no="+ board_No;
		});
	});

</script>
	<script>
      $('#dataTable-1').DataTable(
      {
        autoWidth: true,
        "lengthMenu": [
          [16, 32, 64, -1],
          [16, 32, 64, "All"]
        ]
      });
    </script>
	<%-- <script src="${pageContext.request.contextPath}/resources/admin/js/apps.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
	<script>
      	window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-56159088-1');

    </script> --%>
    <script>
    document
	.getElementById("insertComment")
	.addEventListener(
			"click",
			function() {
				if (comm_Content.value == ""
						|| comm_Content.value.length == 0) {
					alert("댓글을 입력해 주세요");
					return false;
				} else {
					location.href = '${pageContext.request.contextPath}/comments2/insertComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&mem_No=${member.memNo}&comm_Content='
							+ comm_Content.value;
				}
			}, false);


		function updateComment(obj) {
			// 현재 버튼의 위치와 가장 가까운 textarea 접근하기
			$(obj).parent().parent().parent().find('textarea').removeAttr('readonly');
			
			// 수정 완료 버튼 보이게 하기
			$(obj).siblings('.updateConfirm').css('display', 'inline');
			
			// 현재 클릭한 수정 버튼 숨기기
			$(obj).css('display', 'none');
		}
		
		function updateConfirm(obj) {
			// 수정을 마친 댓글 내용 가져오기
			var content = $(obj).parent().parent().parent().find('textarea').val();
			
			// 댓글 번호 가져오기
			var comm_No = $(obj).siblings('#comm_No').val();
			
			console.log(content);
			
			location.href = "${pageContext.request.contextPath}/comments2/updateComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&comm_No=" + comm_No + "&comm_Content="
				+ content;
		}
		
		// 대댓글 .......
		function reComment(obj) {

			var commentDiv = $(obj).parent().parent();

			var comm_Ref = $(obj).next().find('.comm_Ref').val();
			console.log("원 댓글 번호 : " + comm_Ref);
			

			$(obj).css('display','none');

			var reCommentCode =
				"<div class='write_area' style='padding: 8px 20px 15px 40px;'>" + 
				"<i class='fa fa-reply fa-rotate-180'></i>" + 
				"<text>   대댓글</text>" + 
				"<div id='btn_add_comment' style='display: flex;'>" + 
				"<div class='reply_area' style='width: 100%;'>" +
					"<form id='commentForm' method='post'>" +
					"<input type='hidden' id='mem_No' name='mem_No' value='${sessionScope.mem_No }' />" +
					"<input type='hidden' name='comm_Ref' value=" + comm_Ref + " />" +
					"<input type='hidden' name='comm_Level' value='1' />" +
					"<textarea id='comm_Content2' name='comm_Content' placeholder='댓글을 남겨주세요.' style=' width:100%; resize: none; background-color:black; color:white;' maxlength='500'>" +
					"</textarea>" +
					"</form>" +
		               "<div class='byte' style='float:right; font-size:12px; color:darkgray;'>" +
		                  "<text id='commentByte2'>0</text><text id='slash2'> / </text><text id='maxByte2'>500</text>" +
		               "</div>" +
				"</div>" +
				"<button onclick='reConfirm(this); return false;' class='btn mb-2 btn-primary' style='font-weight: 300; font-size: 20px; width:10%;'> 작성</button>" +
			"</div>" +
			"</div>";

			commentDiv.append(reCommentCode);

	        $('#comm_Content2').on('keyup', function(){
	            var inputLength = $(this).val().length; // 입력된 글자 수
	            var remain = 500 - inputLength;         // 남은 글자 수

	            $('#commentByte2').html(inputLength);
	            $('#maxByte2').html(remain);

	            if(inputLength == 500) {
	            	$('#commentByte2').empty();
	            	$('#slash2').empty();
	            	$('#maxByte2').html("입력 가능한 글자 수를 초과하였습니다.");
	            	$('#maxByte2').css('color', '#fa1302');
	            	
	            } else if(inputLength < 500) {
	            	$('#commentByte2').html(inputLength);
	                $('#maxByte2').html(remain);
	                $('#slash2').html(' / ');
	                $('#maxByte2').css('color', 'darkgray');
	            }

	        });

		}
		
		function reConfirm(obj){
		
			var comm_Ref = $(obj).prev().find('input[name=comm_Ref]').val();
			console.log("원 댓글 번호 : " + comm_Ref);
			
			var comm_Level = Number($(obj).prev().find('input[name=comm_Level]').val()) + 1;
			console.log("댓글 레벨 : " + comm_Level);
			
			var comm_Content = $(obj).prev().find('textarea').val();
			console.log("댓글 내용 : " + comm_Content);
			
			location.href="${pageContext.request.contextPath}/comments2/insertComment.do?type_No=${notice.type_no}&board_No=${notice.board_no}&mem_No=${member.memNo}&comm_Content="
				+ comm_Content + "&comm_Ref=" + comm_Ref + "&comm_Level=" + comm_Level;
		}
    </script>
</body>
</html>