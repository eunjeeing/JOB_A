<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | MENTO</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/back8.jpg)
		no-repeat;
	background-size: 100% 100%;
	background-position: center;
	background-size : cover;
	margin-top: 10px;
	height: 400px;
	display: flex;
	opacity : 0.75;
}
	
	#topbanner-textarea{
	opacity : 0.75;
}


#title {
	margin: 0 0 0 0 !important;
}

#wrapped {
	border: 1px solid #f56a6a;
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

/* ????????? ????????? */
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

	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
<scrip>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
</scrip>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />
				
				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">?????????</h3>
					</div>
				</div>

				<!-- ????????? -->
				<section class="container">
					<div class="wrapped" id="wrapped">
						<div role="main" class="contents">
							<div class="acticle-view-head" id="head">
								<div class="title-close" style="display: flex;">
								<h2 id="title">${mento.board_title }</h2>
								<i class="far fa-window-close" id="close-icon" style="font-size: 30px; color: #f56a6a; margin-left:auto; margin-right: 0;"
								   onclick="location.href='${pageContext.request.contextPath}/mentoList.bo'"></i>
								</div>
								<p class="name">${mento.mem_nick }</p>
								<div class="wrap-info">
									<span class="date"> <i class="far fa-clock"></i>
											${mento.board_date }
									</span> <span class="pv"> <i class="far fa-eye"></i>
											${mento.board_view }
									</span> <span class="cmt"> <i class="far fa-comment"></i>
											${mento.comm_count }
									</span>
									<div class="info_fnc">
									
										<c:if test="${member.memNo ne mento.mem_no}">
										<!-- ?????? inline css by ?????? -->
											<span class="rebo" id="goReport" style="margin-right:-4px;"> 
												<i class="fas fa-exclamation-triangle" id="report" style="padding:2px;"></i>
												<a class="reportBtn" style="color:black; vertical-align: middle; " id="myBtn"> ??????</a> 
											</span>
												<input type="hidden" id="board_info" value="${mento.board_no}">
												<input type="hidden" id="board_mem_no" value="${mento.mem_no}">
												<input type="hidden" id="board_reporter" value="${member}">
											<!---------------------------------------------------------------------------> 
										</c:if>
										
										<span class="rebo" onclick="bookmark(${mento.board_no}, ${member.memNo})">
											<c:if test="${!empty bookmark}">
												<i class="fas fa-bookmark" id="bookmark"></i> ?????????
											</c:if>
											<c:if test="${empty bookmark}">
												<i class="far fa-bookmark" id="bookmark"></i> ?????????
											</c:if>
										</span>
									</div>
								</div>
							</div>
							<div class="article-view-contents">
								<div id="contentArea" class="contents-txt">
									${mento.board_content }</div>
								<p>
								<c:if test="${member.memNo eq mento.mem_no}">
								<div align="right">
									<%-- <button style="font-weight: 300; margin-right:10px;"
									 onclick="location.href='${pageContext.request.contextPath}/mentoUpdateForm.bo?board_no=${mento.board_no}'">??????</button>
 --%>
									 <button style="font-weight: 300; margin-right:10px;"
									 onclick="location.href='${pageContext.request.contextPath}/mentoUpdateForm.bo?board_no=${mento.board_no}&mem_no=${SessionScope.member.memNo}&type_no=${mento.type_no}'">??????</button>

									<button style="font-weight: 300;" onclick="location.href='${pageContext.request.contextPath}/mentoDelete.bo?board_no=${mento.board_no}'">??????</button>
								</div>
								</c:if>
								</p>
							</div>



							<!-- ???????????? -->
							<div class="article-comments">
								<h3 style="font-weight: 500">?????? ${mento.comm_count }</h3>
								<%-- <c:if test="${member.gradeNo < 2 && mento.comm_count < 1}">
									<div class="write_area">
										<div id="btn_add_comment" style="display: flex;">
											<div class="reply_area" style="width: 100%;">
												<form id="commentForm" method="post">
												<input type="hidden" id="mem_No" name="mem_No"
													value="${sessionScope.mem_No}" /> 
												<input type="hidden" name="comm_Ref" value="0" />
												<input type="hidden" name="comm_Level" value="1" />
												<textarea class="summernote" id="comm_Content" name="comm_Content" maxlength="200"
													placeholder="????????? ???????????????." style="resize: none;"></textarea>
												</form>
												
												<!-- ?????? ??? -->
												<!-- <div class="byte" style="float:right; font-size:12px; color:darkgray;">
													<text id="commentByte">0</text><text id="slash"> / </text><text id="maxByte">200</text>
												</div> -->
	
												
											</div>
											<div class="reply_button" style="height:100%;">
												<button id="insertComment" type="button" 
												style="font-weight: 300; font-size: 20px;">??????</button>
											</div>
										</div>
									</div>
								</c:if> --%>
								
								<!-- ??????????????? -->
								<c:forEach items="${commentList}" var="co">
									<c:if test="${co.comm_Level eq 1}">
									<div id="${co.comm_No }" class="wrap-comment comment-area">
										<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq mento.mem_no }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">?????????</text></c:if></p>
										<p class="cmt-txt">
											<div id="contentArea-comm" class="contents-txt">
												<c:if test="${member.gradeNo < 2}">
													<textarea id="comm_Con2" readonly="readonly" style="overflow:auto;">${co.comm_Content}</textarea>
												</c:if>
												<c:if test="${member.gradeNo >= 2 }">
													${co.comm_Content}												
												</c:if>
											</div>
										</p>
										<div class="wrap-info">
										
											<span class="date"> <i class="far fa-clock"></i>
											<fmt:parseDate var="parsedDate" value="${co.comm_Date}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
											<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
											<c:if test="${sessionScope.member.gradeNo < 2}">
											<!-- <a class="cmt" href="#" onclick="reComment(this);return false;"> <i class="far fa-comment"> </i> ????????? -->
											</a>
											<div class="info_fnc">
													<input type="hidden" id="comm_No" name="comm_No" value="${co.comm_No }"/>
										      		<input type="hidden" class="mem_No"  name="mem_no" value="${member.memNo}" />
											  		<input type="hidden" class="comm_Ref"  name="comm_Ref" value="${co.comm_No}" />
											  		<input type="hidden" class="comm_Level"  name="comm_Level" value="${co.comm_Level}" />
												<c:if test="${member.memNo eq co.mem_No}">
													<c:if test="${member.gradeNo < 2}"></c:if>
													<a href="#" onclick="updateComment(this);return false;">??????</a>
													<a href="#" class="updateConfirm" onclick="updateConfirm(this);" style="display:none;" >????????????</a>											
													<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${mento.type_no}&board_No=${mento.board_no}&comm_No=${co.comm_No }'">??????</a>
												</c:if>
												<c:if test="${member.memNo ne co.mem_No}">
												<c:if test="${ co.grade_No != 0 && co.grade_No != 1}">												
												<span class="reportBtn_comment" id="reportBtn_comment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
													<!-- ----------------------- ?????????????????? by ?????? ------------------------------ -->
													<input type="hidden" class="board_comment_info" value="${co.comm_No }">
													<input type="hidden" class="board_comment_mem_no" value="${co.mem_No }">
													<input type="hidden" class="board_comment_reporter" value="${member }">
													<!-- ----------------------------------------------------- -->
												</c:if>
												</c:if>
												</div>
											</c:if>
										</div>
									</div>
								</c:if>
									
							<%-- <!-- ??????????????? -->
								<c:if test="${co.comm_Level ne 1}">
								<c:if test="${sessionScope.member.gradeNo < 2}">
									<div class="wrap-reply">
										<div id="${co.comm_No }" class="wrap-comment comment-area">
											<p class="name">${co.mem_Nick }<c:if test="${co.mem_No eq board2.mem_No }"><text style="color: #f56a6a; font-size: 12px; padding-left:1em;">?????????</text></c:if></p>
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
														<a href="#" onclick="updateComment(this);return false;">??????</a>
														<a href="#" class="updateConfirm" onclick="updateConfirm(this);" style="display:none;" >????????????</a>												
														<a href="#" onclick="location.href='${pageContext.request.contextPath}/comments2/deleteComment.do?type_No=${mento.type_no}&board_No=${mento.board_no}&comm_No=${co.comm_No }'">??????</a>
													</c:if>
													<c:if test="${member.memNo ne co.mem_No}">
													<span class="reportBtn_cocomment" id="reportBtn_cocomment" style="vertical-align: middle;" ><i class="fas fa-exclamation-triangle"></i></span> 
													<!-- ----------------------- ????????????????????? by ?????? ------------------------------ -->
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
								</c:if>	 --%>		
								</c:forEach>
							</div>

						</div>
					</div>
				</section>
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
	<c:import url="../reportModal.jsp"/>	<!-- ?????? ?????? ??? -->
	 	

	<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<script>
		$(document).ready(function(){
			
			$('.summernote').summernote({
			    placeholder: '??????',
			    tabsize: 2,
			    lang : 'ko-KR',
			    height: 500,
			    focus: true,
			    callbacks: {
			          onImageUpload: function(files, editor, welEditable) {
			        	  console.log(files);
			        	  console.log(editor);
			        	  console.log(welEditable);
			        	  var opt = {};
				          for (var i = files.length - 1; i >= 0; i--) {
				                sendFile(files[i], this);
			             }
			         }
			    }
			});
		});

		function sendFile(file, el) {
		    
		 var form_data = new FormData();
		  form_data.append('file', file);
		   console.log(form_data.file);
		
		  
		  $.ajax({
		       data: form_data,
		       type: "post",
		       url: '/joba/insertImage.do',
		    cache : false,
		    contentType : false,
		    enctype: 'multipart/form-data',
		    processData : false,
		       success: function(url) {
		          url.replace("\/","/");
		         $(el).summernote('editor.insertImage', url);
		       }, error: function(){
		          console.log("error");
		       }
		  });
		}  
		/* 
		document.getElementById("insertComment").addEventListner("click",
						function() {
							if (comm_Content.value == ""
									|| comm_Content.value.length == 0) {
								alert("????????? ????????? ?????????");
								return false;
							} else {
								location.href = '${pageContext.request.contextPath}/comments2/insertComment.do?type_No=${mento.type_no}&board_No=${mento.board_no}&mem_No=${member.memNo}&comm_Content='
										+ comm_Content.value;
							}
						}, false); */


		function updateComment(obj) {
			// ?????? ????????? ????????? ?????? ????????? textarea ????????????
			$(obj).parent().parent().parent().find('textarea').removeAttr('readonly');

			// ?????? ?????? ?????? ????????? ??????
			$(obj).siblings('.updateConfirm').css('display', 'inline');
			
			// ?????? ????????? ?????? ?????? ?????????
			$(obj).css('display', 'none');
		}

		function updateConfirm(obj) {
			// ????????? ?????? ?????? ?????? ????????????
			var content = $(obj).parent().parent().parent().find('textarea').val();
			
			// ?????? ?????? ????????????
			var comm_No = $(obj).siblings('#comm_No').val();

			console.log(content);
			
			location.href = "${pageContext.request.contextPath}/comments2/updateComment.do?type_No=${mento.type_no}&board_No=${mento.board_no}&comm_No=" + comm_No + "&comm_Content="
				+ content;
			alert("????????? ?????????????????????");
		}

		// ????????? .......
		function reComment(obj) {

			var commentDiv = $(obj).parent().parent();

			var comm_Ref = $(obj).next().find('.comm_Ref').val();
			console.log("??? ?????? ?????? : " + comm_Ref);
			

			$(obj).css('display','none');

			var reCommentCode =
				"<div class='write_area' style='padding: 8px 20px 15px 40px;'>" + 
				"<i class='fa fa-reply fa-rotate-180'></i>" + 
				"<text>   ?????????</text>" + 
				"<div id='btn_add_comment' style='display: flex;'>" + 
				"<div class='reply_area' style='width: 100%;'>" +
					"<form id='commentForm' method='post'>" +
					"<input type='hidden' id='mem_No' name='mem_No' value='${sessionScope.mem_No }' />" +
					"<input type='hidden' name='comm_Ref' value=" + comm_Ref + " />" +
					"<input type='hidden' name='comm_Level' value='1' />" +
					"<textarea id='comm_Content2' name='comm_Content' placeholder='????????? ???????????????.' style='resize: none;' maxlength='200'>" +
					"</textarea>" +
					"</form>" +
		               "<div class='byte' style='float:right; font-size:12px; color:darkgray;'>" +
		                  "<text id='commentByte2'>0</text><text id='slash2'> / </text><text id='maxByte2'>200</text>" +
		               "</div>" +
				"</div>" +
				"<button onclick='reConfirm(this); return false;' style='font-weight: 300; font-size: 20px;'> ??????</button>" +
			"</div>" +
			"</div>";

			commentDiv.append(reCommentCode);

	        $('#comm_Content2').on('keyup', function(){
	            var inputLength = $(this).val().length; // ????????? ?????? ???
	            var remain = 200 - inputLength;         // ?????? ?????? ???

	            $('#commentByte2').html(inputLength);
	            $('#maxByte2').html(remain);


	        });

		}

	    function reConfirm(obj){

	    	var comm_Ref = $(obj).prev().find('input[name=comm_Ref]').val();
			console.log("??? ?????? ?????? : " + comm_Ref);
			
			var comm_Level = Number($(obj).prev().find('input[name=comm_Level]').val()) + 1;
			console.log("?????? ?????? : " + comm_Level);

			var comm_Content = $(obj).prev().find('textarea').val();
			console.log("?????? ?????? : " + comm_Content);

			location.href="${pageContext.request.contextPath}/comments2/insertComment.do?type_No=${mento.type_no}&board_No=${mento.board_no}&mem_No=${member.memNo}&comm_Content="
				+ comm_Content + "&comm_Ref=" + comm_Ref + "&comm_Level=" + comm_Level;
	    }

	    function bookmark(board_no, mem_no) {
			var bookmarkClass = $('#bookmark').attr('class').substr(0,3);
			if (bookmarkClass == 'far') {
				console.log("????????? ???????????????.")	
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/bookmark/insertBookmark.bm",
					data: {board_no : board_no, mem_no : mem_no},
					datatype: 'json',
					success: 
						function(data){
							if(data.isSuccess == true) {
								$("#bookmark").attr('class', 'fas fa-bookmark');
								console.log("????????? INSERT ??????");
							} else {
								console.log("????????? INSERT ??????")
							}
						},
					error: 
						function(jqxhr, textStatus, errorThrown) {
							console.log("????????? INSERT ??????");
							console.log(jqxhr);
							console.log(textStatus);
							console.log(errorThrown);
					}
				});
			} else {
				console.log("????????? ????????????.")
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/bookmark/deleteBookmark.bm",
					data: {board_no : board_no, mem_no : mem_no},
					datatype : 'json',
					success: 
						function(data){
							if(data.isSuccess == true) {
								$("#bookmark").attr('class', 'far fa-bookmark');
								console.log("????????? DELETE ??????");
							} else {
								console.log("????????? DELETE ??????")
							}
						},
					error: 
						function(jqxhr, textStatus, errorThrown) {
							console.log("????????? DELETE ??????");
							console.log(jqxhr);
							console.log(textStatus);
							console.log(errorThrown);
						}
				});
			}
		}
		
	    // ????????????????????? ???????????? by ??????
	    $('#goReport').click(function(){
		    var test = $('#board_info').val();
		    
			$('.modal_board').val($('#board_info').val());
			$('.modal_reporter').val($('#board_reporter').val());
			$('.modal_board_no').val($('#board_mem_no').val());
			$('.modal_separate').val(1);

			console.log($('#board_mem_no').val());
	    });

        var commentModal = document.getElementById('myModal');
	    
	    // ?????? ???????????? ???????????? by ??????
		var $comment = $('.reportBtn_comment').on('click', function(){
				var idx = $comment.index(this);
				var modal_board = $('.board_comment_info:eq('+idx+')').val();
				console.log( "????????????:"+modal_board );
				var modal_reporter = $('.board_comment_reporter:eq('+idx+')').val();
				console.log( "???????????????:"+modal_reporter );
				var modal_board_no = $('.board_comment_mem_no:eq('+idx+')').val();
				console.log( "????????????????????????:"+modal_board_no );
				
				$('.modal_separate').val(2);	
				$('.modal_board').val(modal_board);
				$('.modal_reporter').val(modal_reporter);
				$('.modal_board_no').val(modal_board_no);
	              commentModal.style.display = "block";
					
			});


	    // ????????? ???????????? ???????????? by ??????
		var $cocoment = $('.reportBtn_cocomment').on('click', function(){
				var idx = $cocoment.index(this);
				var modal_board = $('.board_cocomment_info:eq('+idx+')').val();
				console.log( "????????????:"+modal_board );
				var modal_reporter = $('.board_cocomment_reporter:eq('+idx+')').val();
				console.log( "???????????????:"+modal_reporter );
				var modal_board_no = $('.board_cocomment_mem_no:eq('+idx+')').val();
				console.log( "????????????????????????:"+modal_board_no );
				
				$('.modal_separate').val(2);	
				$('.modal_board').val(modal_board);
				$('.modal_reporter').val(modal_reporter);
				$('.modal_board_no').val(modal_board_no);
	              commentModal.style.display = "block";
					
			});	

	    // ?????? ????????? ??????
        $('#comm_Content').on('keyup', function(){
            var inputLength = $(this).val().length; // ????????? ?????? ???
            var remain = 200 - inputLength;         // ?????? ?????? ???

            $('#commentByte').html(inputLength);
            $('#maxByte').html(remain);

        });	

        // textarea ????????????
        var txtArea = $(".comm_Con2");
        if (txtArea) {
            txtArea.each(function(){
                $(this).height(this.scrollHeight);
            });
        }

	</script>
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
</body>
</html>