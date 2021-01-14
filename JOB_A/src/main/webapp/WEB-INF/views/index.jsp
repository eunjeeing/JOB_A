<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<style>
#banner {
	height: 40%;
}

.left {
	width: 70%;
	padding-right: 22px;
}
/* 검색창 스타일 */
.container {
	width: 80%;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
	margin-left: 10px;
}

.container input#search::-webkit-input-placeholder {
	color: #65737e;
	cursor: pointer;
}

.container input#search:-moz-placeholder { /* Firefox 18- */
	color: #65737e;
}

.container input#search::-moz-placeholder { /* Firefox 19+ */
	color: #65737e;
}

.container input#search:-ms-input-placeholder {
	color: #65737e;
}

.container input#search {
	width: 120%;
	height: 50px;
	font-size: 10pt;
	float: left;
	color: #63717f;
	padding-left: 45px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.container .icon {
	position: absolute;
	top: 45%;
	margin-left: 18px;
	margin-top: 14px;
	z-index: 1;
	color: #4f5b66;
	-webkit-transition: all .55s ease;
	-moz-transition: all .55s ease;
	-ms-transition: all .55s ease;
	-o-transition: all .55s ease;
	transition: all .55s ease;
}

.container:hover .icon {
	margin-top: 13px;
	color: #93a2ad;
	-webkit-transform: scale(1.5); /* Safari and Chrome */
	-moz-transform: scale(1.5); /* Firefox */
	-ms-transform: scale(1.5); /* IE 9 */
	-o-transform: scale(1.5); /* Opera */
	transform: scale(1.5);
}

.container input#search:hover, .container input#search:focus, .container input#search:active
	{
	outline: none;
	background: rgba(222, 225, 226, 0.75);
}
/* 캐러셀 스타일 */
p {
	display: contents;
}

.carou_title {
	height: 30px;
	width: 95%;
	margin: 85px auto 10px 13px;
}

.carousel-container {
	width: 96%;
	height: 280px;
	margin: auto auto 30px 13px;
	border: 0px solid #000;
	position: relative;
	overflow: hidden;
}
.carousel-slide {
	width : 1000%;
	height: 280px;
	display : flex;
}
.carousel-slide:hover{
	cursor: pointer;
	background-color: rgba(222, 225, 226, 0.75);
}

#prevBtn {
	position: absolute;
	top: 50%;
	transform: translate(0%, -50%);
	height: 280px;
	width: 13px;
	box-shadow: none;
	border: 3px solid #f56a6a;
	border-right: none;
}
#nextBtn {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translate(0%, -50%);
	height: 280px;
	width: 13px;
	box-shadow: none;
	border: 3px solid #f56a6a;
	border-left: none;
}

#prevBtn>img {
	width: 15px;
	position: absolute;
	left: 10px;
	bottom: 132px;
}

#nextBtn>img {
	width: 15px;
	position: absolute;
	right: 10px;
	bottom: 132px;
}



/* 사이트 홍보 배너 */
.site_title {
    height: 11em;
    width: 93%;
    margin-left: 3%;
    margin-top: 0px;
    padding-left: 4em;
    padding-top: 2.5em;
    background-color: black;
}

.site_title>p {
	font-size: 24px;
	font-weight: bold;
	color: white;
}

.right {
	width: 27%;
	height: 550px;
	display: block;
	margin-bottom: 20px;
}
.right>div {
	/* background-color: rgba(222, 225, 226, 0.75); */
	background-image: url(${pageContext.request.contextPath}/resources/images/back4.jpg);
	background-size: 100% 100%;
    background-position: center;
}
/* 랭킹 스타일 */
.ranking {
	height: 325px;
	width: 100%;
}

#rank-list a {
	border-bottom: none;
	text-decoration: none;
	color: grey;
}

#rank-list a:hover {
	cursor: pointer;
}

#rank-list {
	overflow: hidden;
	width: 100%;
	height: 320px;
	margin: 0;
}

#rank-list dt {
	font-size: 18px;
	font-weight: bold;
	color: black;
	margin-top: 25px;
	margin-left: 30px;
	margin-bottom: 5px;
}

#rank-list dd {
	position: relative;
}

#rank-list ol {
	position: absolute;
	top: 0;
	left: 9px;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#rank-list li {
	margin-top: 3px;
	line-height: 20px;
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transition: all 0.3s ease-in-out;
}

#rank-list li:hover {
	transform: scale(1.2);
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
}

section>div>.sub_menu {
	border-left: 10px solid #f56a6a;
	border-right: 10px solid #f56a6a;
	border-radius: 5px;
	width: 30%;
	height: 100px;
	margin-right: 20px;
	padding: 17px 15px 10px 32px;
}

section>div>.sub_menu3 {
	border-left: 10px solid #f56a6a;
	border-right: 10px solid #f56a6a;
	border-radius: 5px;
	width: 30%;
	height: 100px;
	margin-right: 20px;
	padding: 17px 15px 10px 22px;
}

.textline {
	font-size: 17px;
	font-weight: bold;
	display: inline-block;
	margin-left: 18px;
	margin-bottom: 0;
}

#sub_menu:hover {
	cursor: pointer;
	background-color: lightgrey;
}

.adminBtn{
	width : 10%;
	height : 15px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	padding-top: 15px;
}
</style>
<html>
<head>
<title>JOB_A</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function(){

	var date = {};
	
	$.ajax({
		url:"${pageContext.request.contextPath}/carousel",
		type:"POST",
		dataType : "json",
		async: true,

		success : function(data){
			var list = data;
			for(var i in list){
				console.log(data[i]);
				div = 
					'<div style="width:430px;">'+
					'<div class="tit" id=' + data[i].board_No + '>' +
						'<p >' + data[i].TYPE_NAME + ' 게시판</p>' +
						'<h3 class="hh" style="font-size:23px;">"' + data[i].BOARD_TITLE + '"</h3>' +
						'<div class="pre-txt">' + data[i].BOARD_CONTENT + '</div>' +
					'</div>' +
				'<div class="sub" style="margin-top : 0.7em;">' +
					'<p class="name" style="padding-top: 3em;">' + data[i].MEM_NICK + '</p>' +
					'<div class="wrap-info">' +
						'<i class="far fa-eye" style="margin-right : 0.5em;">' + data[i].BOARD_VIEW + '</i>' +
							'<i class="far fa-comment">' + data[i].COMM_COUNT + '</i>' +
						'<div class="info_fnc">' + data[i].BOARD_DATE + '</div>' +
					'</div>' +
				'</div>'+
				'</div>'
				$('.carousel-slide').append(div);
			}
		},
		error : function(){
				alert("ajax 오류!");
				console.log(error);
	            console.log(error.status);
			}
		});

	$.ajax({
		url:"${pageContext.request.contextPath}/rankList",
		type:"POST",
		dataType : "json",
		async: true,
		success : function(data){

			var list = data;
				console.log(data);
	}
	})
});
</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<c:import url="user/common/header.jsp" />

				<div class="adminBtn">
				<button id="Btn" onclick="goAdmin();" style="">관리자 페이지로 이동</button>
				</div>
				<!-- Banner -->
				<section id="banner">
					<!-- 왼쪽 구역 -->
					<div class="left">
						<!-- 검색창 -->
						<div class="container">
							<span class="icon"><i class="fa fa-search"></i></span> <input
								type="search" id="search" placeholder=" Search !"
								onKeyDown="enterKey();" />
						</div>
						<!-- 캐러셀 -->
						<div class="carou_title">
							<i class="fas fa-fire"
								style="font-size: 22px; color: #f56a6a; margin-left: 5px;"></i>
							<p style="font-size: 17px;">&nbsp;토픽 베스트</p>
						</div>
						
						<div class="carousel-container">
							<div class="carousel-slide" id="goBoard";">
							</div>
						<button id="prevBtn" onclick="plusSlides(-1)">
							<img alt="prev"
								src="${pageContext.request.contextPath}/resources/images/left-arrow.png">
						</button>
						<button id="nextBtn" onclick="plusSlides(1)">
							<img alt="next"
								src="${pageContext.request.contextPath}/resources/images/right-arrow.png">
						</button>
						</div>
							<!-- 캐러셀 함수 -->
							<script>
								var slideIndex = 1;		
								showSlides(slideIndex);

								function plusSlides(n){
									showSlides(slideIndex+=n);
									}
								function currentSlide(n) {
									  showSlides(slideIndex = n);
									}

								function showSlides(n) {
									var i;
									var slides=
										document.getElementsByClassName("crousel-slide");
									if(n>slides.length){slideIndex = 1}
									if(n<1) {slideIndex = slides.length}
									for(i=0; i<slides.length; i++){
											slides[i].style.display = "none";
										}
									slides[slidIndex-1].style.display = "block"; 
								}
							</script>
						
						
						<!-- 홍보 배너 -->
						<div class="site_title">
							<p>
								취준생의,&nbsp;취준생에 의한,&nbsp;취준생을 위한&nbsp;🙌<br> JOB_A로 다 잡아!
							</p>
						</div>
					</div>
					<!-- 오른쪽 구역 -->
					<div class="right">
						<div class="ranking">
							<dl id="rank-list">
								<dt>//&nbsp;Wanted JOB</dt>
								<dd>
									<ol>
										<li><a href="#">&nbsp;1. </a></li>
										<li><a href="#">&nbsp;2. test<a></li>
										<li><a href="#">&nbsp;3.<a></li>
										<li><a href="#">&nbsp;4.<a></li>
										<li><a href="#">&nbsp;5.<a></li>
										<li><a href="#">&nbsp;6.<a></li>
										<li><a href="#">&nbsp;7.<a></li>
										<li><a href="#">&nbsp;8.<a></li>
										<li><a href="#">&nbsp;9.<a></li>
										<li><a href="#">10.</a></li>
									</ol>
								</dd>
							</dl>
						</div>
						<a href="http://localhost:8088/Zipper/"> <img
							class="image object" id="ad_img"
							src="${pageContext.request.contextPath}/resources/images/ad.png"
							alt="ad_page"
							style="margin: 0; margin-top: 20px; width: 100%; height: 240px; object-fit: contain;" />
						</a>
					</div>
				</section>

				<!-- Section -->

				<section>
					<div style="margin-left: 35px; margin-bottom: 30px; display: flex;">
						<div class="sub_menu" id="sub_menu" OnClick="goCal()">
							<i class="icon far fa-calendar-alt"
								style="font-size: 50px; color: #f56a6a;"></i>
							<p class="textline">
								한 눈에 보자!<br>채용달력
							</p>
						</div>
						<div class="sub_menu" id="sub_menu" OnClick="goChat()">
							<i class="icon far fa-comments"
								style="font-size: 50px; color: #f56a6a;"></i>
							<p class="textline">
								다들 뭐해?<br>실시간 채팅
							</p>
						</div>
						<div class="sub_menu3" id="sub_menu" OnClick="goInfo()">
							<i class="icon far fa-question-circle"
								style="font-size: 50px; color: #f56a6a;"></i>
							<p class="textline">
								알려주세요~<br>사이트 이용방법
							</p>
						</div>
				</section>

			</div>
		</div>
		<c:import url="user/common/sideBar.jsp" />


	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!-- 캐러셀 클릭 이벤트 -->
	<c:if test="${ !empty member }" >
	<script>
		$(function() {
			$("div[class=tit]")
					.on("click",
							function() {
								var board_No = $(this).attr("id");
								console.log("board_No=" + board_No);
								location.href = "${pageContext.request.contextPath}/board2/blahView.do?board_No="
										+ board_No;
							});
		});
	</script>
	</c:if>
	<c:if test="${ empty member }">
	<script>
			$(function() {
			$("div[class=carousel-slide]")
					.on(
							"click",function() {
								window.alert("로그인 후 이용해주세요");
							});
			});
	</script>
	</c:if>
	
	<c:if test="${ !empty member }" >
	
	<script>/* 채팅으로 이동 */
	function goChat(){
            location.href = '${pageContext.request.contextPath}/chat/chatList/0';
        }

    /* 게시물로 이동 */
       // 해당 게시글로 이동
   $(function (){
      $("#goBoard").on("click", function(){
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
            location.href = "${pageContext.request.contextPath}/selectOneAccept.bo?board_no="+ board_No;
            break;

         case'10':
            location.href = "${pageContext.request.contextPath}/selectOneInterview.bo?board_no="+ board_No;
            break;
         }
      });
   });
	</script>
	</c:if>
	<c:if test="${ empty member }">
	<script>
		function goChat() {
			window.alert("로그인 후 이용해주세요");
		}
	</script>
	</c:if>
	<script type="text/javascript">
				/* 전체 검색 */
				function enterKey() {
	    			if (event.keyCode==13){
	    				location.href="${pageContext.request.contextPath}/search/searchList.do?keyword="+$('#search').val();
	    			}
	    		}
			
				/* 캘린더로 이동 */
				function goCal(){
			            location.href = '${pageContext.request.contextPath}/calendar.do';
				}
				
				/* 이용안내로 이동 */
				function goInfo(){
					location.href = '${pageContext.request.contextPath}/selectNoticeFromIndex.bo';
				}	

				function goAdmin(){
					location.href = '${pageContext.request.contextPath}/adminIndex.do';
					}
	</script>
	

</body>
</html>
