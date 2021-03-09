<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/dropzone.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/uppy.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.steps.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/quill.snow.css">
<style>

@font-face {
    font-family: 'NEXON Lv2 Gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
	 font-family: 'NEXON Lv2 Gothic';
}

#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/com.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

#title {
	margin: 0 0 0 0 !important;
}

#wrapped {
	border: 1px solid #f56a6a;
	height: 580px;
}

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
	font-size: 14px;
	line-height: 1.33em;
}

.article-comments .wrap-comment .cmt-txt {
	margin-top: 4px;
	font-size: 16px;
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
/* 
 #comm_Con2:focus {
	border: none;
    box-shadow: 0 0 0 0;
} 
 */

.wrap-info i {
    margin-right: 0;
}

/* 대댓글 스타일 */
.article-comments .wrap-reply {
    margin-top: -1px;
    border-top: 1px solid #eee;
    background-color: #f8f8f8;
}

.article-comments .wrap-reply .wrap-comment {
    padding: 8px 20px 15px 40px;
}

.article-comments .wrap-reply textarea {
	 background-color: #f8f8f8;
}

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
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				
				<!-- 게시글 -->
				<section class="container">
					<div class="wrapped" id="wrapped">
						<div role="main" class="contents">
							<div class="acticle-view-head" id="head">
								<div class="title-close" style="display: flex;">
								<h2 id="title">${board.board_Title }</h2>
								<i class="far fa-window-close" id="close-icon" style="font-size: 30px; color: #f56a6a; margin-left:auto; margin-right: 0;"
								   onclick="location.href='${pageContext.request.contextPath}/board2/blahList.do'"></i>
								</div>
								<p class="name">${board.mem_Nick }</p>
								<div class="wrap-info">
									<span class="date"> <i class="far fa-clock"></i>${board.board_Date }</span> 
									<span class="pv fe fe-16 fe-eye"></i>${board.board_View }</span> 
									<span class="cmt fe fe-16 fe-message-circle"></i>${board.comm_Count }</span>
								</div>
							</div>
							<div class="article-view-contents">
								<div id="contentArea" class="contents-txt">${board.board_Content }</div>
							</div>


								<!-- 댓글리스트 -->
								<c:forEach items="${selectComment}" var="co">
								<c:if test="${co.comm_Level eq 1}">
									<div id="${co.comm_No }" class="wrap-comment comment-area">
										<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq board2.mem_No }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">글쓴이</text></c:if></p>
										<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="overflow:auto;">${co.comm_Content }</textarea></p>
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
													<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${board2.type_No}&board_No=${board2.board_No}&comm_No=${co.comm_No }'">삭제</a>
												</c:if>
												<c:if test="${member.memNo ne co.mem_No}">
												<span class="reportBtn_comment" id="reportBtn_comment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
													<!-- ----------------------- 댓글신고정보 by 은열 ------------------------------ -->
													<input type="hidden" class="board_comment_info" value="${co.comm_No }">
													<input type="hidden" class="board_comment_mem_no" value="${co.mem_No }">
													<input type="hidden" class="board_comment_reporter" value="${member }">
													<!-- ----------------------------------------------------- -->
												</c:if>
											</div>
										</div>
									</div>
								</c:if>
								
								<!-- 대댓글일때 -->
								<c:if test="${co.comm_Level ne 1}">
									<div class="wrap-reply">
										<div id="${co.comm_No }" class="wrap-comment comment-area">
											<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq board2.mem_No }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">글쓴이</text></c:if></p>
											<p class="cmt-txt"><textarea id="comm_Con2" readonly="readonly" style="overflow:auto;">${co.comm_Content }</textarea></p>
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
														<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${board2.type_No}&board_No=${board2.board_No}&comm_No=${co.comm_No }'">삭제</a>
													</c:if>
													
							 						<c:if test="${member.memNo ne co.mem_No}">
													<span class="reportBtn_cocomment" id="reportBtn_cocomment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
													<!-- ----------------------- 대댓글신고정보 by 은열 ------------------------------ -->
													<input type="hidden" class="board_cocomment_info" value="${co.comm_No }">
													<input type="hidden" class="board_cocomment_mem_no" value="${co.mem_No }">
													<input type="hidden" class="board_cocomment_reporter" value="${member }">
													<!-- ----------------------------------------------------- -->
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
					
				</section>
			</div>
		</div>
	</div>	<!-- 신고 모달 창 -->
		 	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
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
								location.href = '${pageContext.request.contextPath}/comments2/insertComment.do?type_No=${board2.type_No}&board_No=${board2.board_No}&mem_No=${member.memNo}&comm_Content='
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
			
			location.href = "${pageContext.request.contextPath}/comments2/updateComment.do?type_No=${board2.type_No}&board_No=${board2.board_No}&comm_No=" + comm_No + "&comm_Content="
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
					"<textarea id='comm_Content2' name='comm_Content' placeholder='댓글을 남겨주세요.' style='resize: none;' maxlength='500'>" +
					"</textarea>" +
					"</form>" +
		               "<div class='byte' style='float:right; font-size:12px; color:darkgray;'>" +
		                  "<text id='commentByte2'>0</text><text id='slash2'> / </text><text id='maxByte2'>500</text>" +
		               "</div>" +
				"</div>" +
				"<button onclick='reConfirm(this); return false;' style='font-weight: 300; font-size: 20px;'> 작성</button>" +
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

			location.href="${pageContext.request.contextPath}/comments2/insertComment.do?type_No=${board2.type_No}&board_No=${board2.board_No}&mem_No=${member.memNo}&comm_Content="
				+ comm_Content + "&comm_Ref=" + comm_Ref + "&comm_Level=" + comm_Level;
	    }

	    function bookmark(board_no, mem_no) {
			var bookmarkClass = $('#bookmark').attr('class').substr(0,3);
			if (bookmarkClass == 'far') {
				console.log("북마크 안되어있음.")	
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/bookmark/insertBookmark.bm",
					data: {board_no : board_no, mem_no : mem_no},
					datatype: 'json',
					success: 
						function(data){
							if(data.isSuccess == true) {
								$("#bookmark").attr('class', 'fas fa-bookmark');
								console.log("북마크 INSERT 성공");
							} else {
								console.log("북마크 INSERT 실패")
							}
						},
					error: 
						function(jqxhr, textStatus, errorThrown) {
							console.log("북마크 INSERT 실패");
							console.log(jqxhr);
							console.log(textStatus);
							console.log(errorThrown);
					}
				});
			} else {
				console.log("북마크 되어있음.")
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/bookmark/deleteBookmark.bm",
					data: {board_no : board_no, mem_no : mem_no},
					datatype : 'json',
					success: 
						function(data){
							if(data.isSuccess == true) {
								$("#bookmark").attr('class', 'far fa-bookmark');
								console.log("북마크 DELETE 성공");
							} else {
								console.log("북마크 DELETE 실패")
							}
						},
					error: 
						function(jqxhr, textStatus, errorThrown) {
							console.log("북마크 DELETE 실패");
							console.log(jqxhr);
							console.log(textStatus);
							console.log(errorThrown);
						}
				});
			}
		}	

	    // 게시글신고모달 스크립트 by 은열
	    $('.reportBtn').click(function(){
		    var test = $('#board_info').val();
		    
			$('.modal_board').val($('#board_info').val());
			$('.modal_reporter').val($('#board_reporter').val());
			$('.modal_board_no').val($('#board_mem_no').val());
			$('.modal_separate').val(1);
	    });

        var commentModal = document.getElementById('myModal');
	    
	    // 댓글 신고모달 스크립트 by 은열
		var $comment = $('.reportBtn_comment').on('click', function(){
				var idx = $comment.index(this);
				console.log(idx)
				var modal_board = $('.board_comment_info:eq('+idx+')').val();
				console.log( "보드번호:"+modal_board );
				var modal_reporter = $('.board_comment_reporter:eq('+idx+')').val();
				console.log( "신고자넘버:"+modal_reporter );
				var modal_board_no = $('.board_comment_mem_no:eq('+idx+')').val();
				console.log( "게시글작성자번호:"+modal_board_no );
				
				$('.modal_separate').val(2);	
				$('.modal_board').val(modal_board);
				$('.modal_reporter').val(modal_reporter);
				$('.modal_board_no').val(modal_board_no);
	              commentModal.style.display = "block";
					
			});


	    // 대댓글 신고모달 스크립트 by 은열
		var $cocoment = $('.reportBtn_cocomment').on('click', function(){
				var idx = $cocoment.index(this);
				var modal_board = $('.board_cocomment_info:eq('+idx+')').val();
				console.log( "보드번호:"+modal_board );
				var modal_reporter = $('.board_cocomment_reporter:eq('+idx+')').val();
				console.log( "신고자넘버:"+modal_reporter );
				var modal_board_no = $('.board_cocomment_mem_no:eq('+idx+')').val();
				console.log( "게시글작성자번호:"+modal_board_no );
				
				$('.modal_separate').val(2);	
				$('.modal_board').val(modal_board);
				$('.modal_reporter').val(modal_reporter);
				$('.modal_board_no').val(modal_board_no);
	              commentModal.style.display = "block";
					
			});


	    // 댓글 글자수 세기
        $('#comm_Content').on('keyup', function(){
            var inputLength = $(this).val().length; // 입력된 글자 수
            var remain = 500 - inputLength;         // 남은 글자 수

            $('#commentByte').html(inputLength);
            $('#maxByte').html(remain);

            if(inputLength == 500) {
            	$('#commentByte').empty();
            	$('#slash').empty();
            	$('#maxByte').html("입력 가능한 글자 수를 초과하였습니다.");
            	$('#maxByte').css('color', '#fa1302');
            	
            } else if(inputLength < 500) {
            	$('#commentByte').html(inputLength);
                $('#maxByte').html(remain);
                $('#slash').html(' / ');
                $('#maxByte').css('color', 'darkgray');
            }

        });
	</script>
</body>
</html>