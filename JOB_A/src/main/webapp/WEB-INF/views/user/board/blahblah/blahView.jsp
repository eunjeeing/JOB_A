<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB_A | 블라블라</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
#topbanner {
	background:
		url(${pageContext.request.contextPath}/resources/images/blah.jpg)
		no-repeat;
	background-position: center center;
	margin-top: 10px;
	height: 400px;
	display: flex;
}
#wrapped {
	border: 1px solid pink;
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
    border-top: 1px solid #eee;
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
						<h3 id="topbanner-text">블라블라</h3>
					</div>
				</div>

				<!-- View -->
				<section class="container">
					<div class="wrapped" id="wrapped">
						<div role="main" class="contents">
							<div class="acticle-view-head" id="head">
								<h2>${board2.board_Title }</h2>
								<p class="name">
									${board2.mem_Nick }
								</p>
								<div class="wrap-info">
									<span class="date">
										<i class="far fa-clock"> ${board2.board_Date }</i>
									</span>
									<span class="pv">
										<i class="far fa-eye"> ${board2.board_View }</i>
									</span>
									<span class="cmt">
										<i class="far fa-comment"> ${board2.comm_Count }</i>
									</span>
									<div class="info_fnc">
									<span class="rebo">
										<i class="fas fa-exclamation-triangle" id="report"></i> 신고
									</span>
									<span class="rebo">
										<i class="far fa-bookmark" id="book"> </i> 스크랩
									</span>
									</div>
								</div>
							</div>
							<div class="article-view-contents">
								<p id="contentArea" class="contents-txt">
									${board2.board_Content }
								</p>
<%-- 								<div class="article_info">
									<div class="info">
										<i class="far fa-comment">${board2.comm_Count }</i>
									</div>
									<div class="info_fnc">
									</div>
								</div> --%>
							</div>
							
							<!-- 댓글 -->
							<div class="article-comments">
								<h3>댓글 ${board2.comm_Count }</h3>
								<div class="write_area">
									<div id="btn_add_comment" style="display: flex;" >
										<div class="reply_area" style="width: 100%;">
										<from id="commentForm" method="post">
											<input type="hidden" id="mem_No" name="mem_No" value="${sessionScope.mem_No }" />
											<textarea id="comm_Content" name="comm_Content" placeholder="댓글을 남겨주세요." style="resize: none;"></textarea>
										</div>
											<button id="insertCommentBtn" style="height: 85px; font-size:20px;">등록</button>
										</form>
									</div>
								</div>
								<c:forEach items="${selectComment }" var="co">
								<div id="${co.comm_No }" class="wrap-comment comment-area">
									<p class="name">${co.mem_Nick }</p>
									<p class="cmt-txt">${co.comm_Content }</p>
									<div class="wrap-info">
										<span class="date">
											<i class="far fa-clock"> 
 											<fmt:formatDate value="${co.comm_Date }" pattern="yyyy-MM-dd a hh:mm:ss"/></i></span>
										<a class="cmt">
											<i class="far fa-comment"> 대댓글</i>
										</a>
										<div class="info_fnc">
											<span><i class="fas fa-exclamation-triangle"></i></span>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							
						</div>
					</div>
				</section>
			</div>
		</div>
		<c:import url="../../common/sideBar.jsp" />
	</div>
<!--  <script>
 	var httpRequest = null;

	// httpRequest 객체 생성
	function getXMLHttpRequest(){
		var httpRequest = null;

		if(window.ActiveXObject){
			try{
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try{
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch(e2) { httpRequest = null; }
			}
		}
		else if(window.XMLHttpRequest){
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}

	// 댓글 등록
	function insertCmt() {
		var form = document.getElementById("commentForm");

		var board = form.board_No.value;
		var id = form.mem_No.value;
		var content = form.comm_Content.value;

		if(!content){
			alert("내용을 입력하세요.");
			return false;
		} else {
			
			var param="board_No="+board+"&mem_No="+id+"&comm_Content"+content;

			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "/comments2/insertComment.bo", true);
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR');
			httpRequest.send(param);
		}
	}

	function checkFunc(){
		if(httpRequest.readyState == 4){
			// 결과값
			var resultText = httpRequest.responseText;
			if(resultText == 1){
				document.location.reload();
			}
		}
	}
  	$(".insertCommentBtn").on("click", function(){
		  var formObj = $("form[name='commentForm']");
		  formObj.attr("action", "/comments2/insertComment.bo");
		  formObj.submit();
		}); -->
<script type="text/javascript">
		 document.getElementById("insertCommentBtn").addEventListener("click", function() {
		    	if(comm_Content.value==""||comm_Content.value.length==0){
					alert("댓글을 입력해 주세요");
					return false;
				}else{
					location.href='${pageContext.request.contextPath}/comments2/insertComment.bo?board_No=${board2.board_No}&mem_No=${member.memNo}&comm_Content='+comm_Content.value;
				}}, false);
</script>
</body>
</html>