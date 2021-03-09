<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 채용공고</title>
<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/job.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}

	#topbanner-textarea {
		width: 40%;
		height: 50%;
		margin: auto;
		padding: auto;
		display: flex;
		background : white;
		opacity : 0.6;
		border: none;
	}
	
	#topbanner-text {
		font-size: 40px;
		font-weight: 500;
		margin: auto;
		color: black;
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

input[type="date"] {
	margin-right: 3em;
	margin-left: 5px;
}
input {
	margin-bottom: 5px;
}
input[type="date"] {
  -moz-appearance: none;
  -webkit-appearance: none;
  -ms-appearance: none;
  appearance: none;
  background: #ffffff;
  border-radius: 0.375em;
  border: none;
  border: solid 1px rgba(210, 215, 217, 0.75);
  color: inherit;
  display: block;
  outline: 0;
  padding: 0 1em;
  text-decoration: none;
  width: 100%; 
}
input[type="date"]:invalid {
    box-shadow: none; }
input[type="date"]:focus {
    border-color: #f56a6a;
    box-shadow: 0 0 0 1px #f56a6a; }
    
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
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">

				<c:import url="../../common/header.jsp" />
				
				<!-- Top Banner Area -->
				<div id="topbanner">
					<div id="topbanner-textarea">
						<h3 id="topbanner-text">채용공고</h3>
					</div>
				</div>
				
 				<!-- insert Form -->
				<section class="container">
					<div class="wrapped" id="wrapped">
						<div role="main" class="contents">
					<form action="${pageContext.request.contextPath}/board2/insertJob.do"
						method="post" onsubmit="return validate();">
							<div class="acticle-view-head" id="head">
								<div class="title-close" style="display: flex;">
									<!-- 제목 -->
									<i class="far fa-window-close" id="close-icon" style="font-size: 30px; color: #f56a6a; margin-left:auto; margin-right: 0;"
								  	 onclick="window.history.back();"></i>
								 	</div>
								 	<br />
									<input type="text" class="form-control" placeholder="제목" maxlength="50"
									name="board_Title" id="board_Title" required>
									<input type="text" class="form-control" placeholder="URL ex) www.naver.com"
									name="board_Url" maxlength="100" required>
									<div style="color: #7f888f; display: inline-flex;" >
										<text style="line-height: 40px;">시작일  </text> 
										<input type="date" class="form-control" style="width:20%; color:inherit;" name="board_Start" required>
										<text style="line-height: 40px;">종료일  </text>
										<input type="date" class="form-control" style="width:20%; color:inherit;" name="board_End" required>
										<text style="line-height: 40px;">합격발표일  </text>
										<input type="date" class="form-control" style="width:20%; color:inherit;" name="board_Announce" required>
									</div>
									 	<div id="category-border">
											<div id="categoty" style="padding: 15px 50px 0 50px;">
												<input type="radio" name="category_No" id="경영·사무" value="1" checked>
												<label for="경영·사무" class="top-radio">경영·사무</label> &nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="마케팅·광고·홍보" value="2" >
												<label for="마케팅·광고·홍보" class="top-radio">마케팅·광고·홍보</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="IT·미디어" value="3" >
												<label for="IT·미디어" class="top-radio">IT·미디어</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="영업" value="4" >
												<label for="영업" class="top-radio">영업</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="서비스" value="5" >
												<label for="서비스" class="top-radio">서비스</label>
												<br />
												<input type="radio" name="category_No" id="연구개발" value="6" >
												<label for="연구개발" class="bottom-radio">연구개발</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="의료" value="7" >
												<label for="의료" class="bottom-radio">의료</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="건설" value="8" >
												<label for="건설" class="bottom-radio">건설</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="교육" value="9" >
												<label for="교육" class="bottom-radio">교육</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="생산·제조" value="10" >
												<label for="생산·제조" class="bottom-radio">생산·제조</label>&nbsp;&nbsp;&nbsp;
												
												<input type="radio" name="category_No" id="무역·유통" value="11" >
												<label for="무역·유통" class="bottom-radio">무역·유통</label>
											</div>
										</div>
								 <input type="hidden" id="mem_No" name="mem_No" value="${member.memNo }" /> 
								 <input type="hidden" id="type_No" name="type_No" value="2">
								 
							</div>
							
							<div class="article-view-contents">

								<p>
								<textarea class="summernote" name="board_Content"
								placeholder="내용" style="resize:none; height:400px;" required></textarea>
								</p>
							<br />
							<button type="submit">확인</button>

							</div>
							</form>
						</div>
					</div>
			</div>
		</div>
 				<c:import url="../../common/sideBar.jsp" />
	
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>
$(document).ready(function(){
	
	$('.summernote').summernote({
	    placeholder: 
		    '내용',
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


function validate(){
	var content = $("[name=board_Content]").val();
	if(content.trim().length==0){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

</script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- include summernote -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
 
</body>
</html>