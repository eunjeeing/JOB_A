<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 면접후기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<style>
	#topbanner {
		background-image: url(${pageContext.request.contextPath}/resources/images/back9.jpg);
		background-size: 100% 100%;
		background-position: center;
		background-size : cover;
		margin-top: 10px;
		/* border: 1px solid black; */
		height: 400px;
		display: flex;
	}
	
	#topbanner-textarea {
		width: 40%;
		height: 50%;
		margin: auto;
		padding: auto;
		/* border : 1px solid black; */
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
#title {
	margin: 0 0 0 0 !important;
}
#close-icon:hover {
	cursor:pointer;
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
	margin-top: 16px;
	font-size: 16px;
	line-height: 16px;
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
}

.article-view-contents .contents-txt {
	margin-top: 24px;
	line-height: 1.6em;
	font-size: 17px;
}


p {
	margin: 0 !important;
}

a {
    -moz-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out !important;
    -webkit-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out !important;
    -ms-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out !important;
    transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out !important;
    text-decoration: none !important;
}

#head {
	margin: 10px 20px;
}

.note-btn {
    display: inline-block;
    font-weight: 400;
    margin-bottom: 0;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid #dae0e5;
    white-space: nowrap;
    outline: 0;
    color: #333 !important;
    background-color: #fff;
    border-color: #dae0e5;
    padding: 5px 10px;
    font-size: 14px;
    height: 2.2em;
    border-radius: 3px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    box-shadow: inset 0 0 0 2px #fff !important;
}
.close {
   opacity: 1.0;
   font-size: 25px;
   height: 1em;
   box-shadow: none;
}

.btn-primary.disabled, .btn-primary:disabled {
   background-color: white;
   border: 2px solid #f56a6a;
   opacity: 1.0 !important;
}

.note-modal-footer {
    padding: 0 10px 20px 20px;
    margin-bottom: 10px;
}

</style>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../../common/header.jsp" />
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">합격후기</h3>
					</div>
				</div>

 				<!-- insert Form -->
				<section class="container">
					<div class="wrapped" id="wrapped">
						<div role="main" class="contents">
					<form action="${pageContext.request.contextPath}/acceptInsert.bo"
						method="post" name="" onsubmit="return validate();" enctype="multipart/form-data">
							<div class="acticle-view-head" id="head">
								<div class="title-close" style="display: flex;">
									<!-- 제목 -->
									
									<input type="hidden" name="mem_nick" value="${member.memNick}"/>
									<input type="hidden" name="mem_no" value="${member.memNo}"/>
									<i class="far fa-window-close" id="close-icon" style="font-size: 30px; color: #f56a6a; margin-left:auto; margin-right: 0;"
								  	 onclick="window.history.back();"></i>
								 	</div>
									<br />
								 	<input type="text" name="board_mainTitle" placeholder="회사명" required/>
									<input type="text" class="form-control" 
									name="board_title" id="board_Title" placeholder="상세제목" required>
							</div>
							<br />

							
							<div class="article-view-contents">
								<textarea class="summernote" name="board_content"
								placeholder="내용" required>
								</textarea>
							<br />
							<button type="submit">확인</button>

							</div>
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
		  				 <c:import url="../../../common/sideBar.jsp" /> 
		
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>
$(document).ready(function(){
	
	$('.summernote').summernote({
	    placeholder: '내용',
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
       url: '/joba/updateImage.do',
    cache : false,
    contentType : false,
       enctype: 'multipart/form-data',
    processData : false,
       success: function(url) {
          console.log('----------------------------');
          console.log(url);
          console.log('----------------------------');
          url.replace("\/","/");
         $(el).summernote('editor.insertImage', url);
       }, error: function(){
          console.log("실패");
       }
  });
}  


function validate(){
	var content = $("[name=board_content]").val();
	if(content.trim().length==0){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

</script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
 
</body>
</html>