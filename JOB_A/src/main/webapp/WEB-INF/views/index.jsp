<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<style>
	
	#banner{
		height: 40%;
	}
	.left{
		width: 70%;
		padding-right : 22px;
	}
	/* 검색창 스타일 */
	.container{
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
	 
	.container input#search::-moz-placeholder {  /* Firefox 19+ */
		color: #65737e;  
	}
	 
	.container input#search:-ms-input-placeholder {  
		color: #65737e;  
	}
	.container input#search{
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
	.container .icon{
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
	.container:hover .icon{
		margin-top: 13px;
		color: #93a2ad;
		
		-webkit-transform:scale(1.5); /* Safari and Chrome */
		-moz-transform:scale(1.5); /* Firefox */
		-ms-transform:scale(1.5); /* IE 9 */
		-o-transform:scale(1.5); /* Opera */
		 transform:scale(1.5);
	}
	
	.container input#search:hover, .container input#search:focus, .container input#search:active{
	    outline:none;
	    background: rgba(222, 225, 226, 0.75);
	}
	/* 캐러셀 스타일 */
	.carou_title{
		height: 30px;
		width: 95%;
		border : 1px black solid; /* 나중에 지울것 */
		margin: 80px auto 0 13px;
	}
	.carousel-container{
		width: 95%;
		margin: auto auto 30px 13px;
		padding-top : 10px;
		border: 0px solid #000;
		overflow: hidden;
		position: relative;
	}
	.carousel-slide{
		display: flex;
		width: 100%;
		height: 260px;
	}
	#prevBtn{
		position:absolute;
		top: 52%;
		transform: translate(0%, -50%);
		height: 260px;
		text-indent: -9999px;
		border-right: none;
		background-color: #f56a6a;
	}
	#nextBtn{
		position:absolute;
		top: 52%;
		right: 0;
		padding-top:2px;
		transform: translate(0%, -50%);
		height: 260px;
		text-indent: -9999px;
		background-color: #f56a6a;
	}
	/* 사이트 홍보 배너 */
	.site_title{
		border : 1px black solid; /* 나중에 지울것 */
		height: 125px;
		width: 95%;
		margin-left: 13px;
		padding: 5px auto auto 5px;
		background-color: grey;
	}
	.right{
		width : 27%;
		height: 537px;
		border : 1px black solid; /* 나중에 지울것 */
		display: block;
	}
	.right>div{
		border : 1px black solid; /* 나중에 지울것 */
	}
	.ranking{
		height: 325px;
		width:100%;
	}
	.ad_box{
		margin-top : 20px;
		height: 190px;
		width: 100%;
	}
	
</style>
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		
	</head>
	<body class="is-preload">
 
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<c:import url="user/common/header.jsp"/>

							<!-- Banner -->
								<section id="banner">
									<!-- 왼쪽 구역 -->
									<div class="left">
										<!-- 검색창 -->
											<div class="container">
											    <span class="icon"><i class="fa fa-search"></i></span>
											    <input type="search" id="search" placeholder=" Search !" />
											</div>
										<!-- 캐러셀 -->
										<div class="carou_title">
											<span class="icon"><i class="fa fa-search"></i></span>
										</div>
										<div class="carousel-container">
											<div class="carousel-slide" style="border: 1px solid black;">
												<img src="#" id="lastClone">
												<img src="#">
												<img src="#">
												<img src="#" id="firstClone">
											</div>
											<button id="prevBtn"><img alt="prev" src=""></button>
											<button id="nextBtn"><img alt="next" src=""></button>
										</div>
										<!-- 홍보 배너 -->
										<div class="site_title">
										
										</div>
									</div>
									<!-- 오른쪽 구역 -->
									<div class="right">
										<div class="ranking">
										</div>
										<div class="ad_box">
										</div>
									</div>
								</section>

							<!-- Section -->
								<section>
									<div class="features">
										<article>
											<span class="icon fa-gem"></span>
											<div class="content">
											</div>
											<span class="icon solid fa-rocket"></span>
											<div class="content">
											</div>
											<span class="icon solid fa-rocket"></span>
											<div class="content">
											</div>
										</article>
								</section>

						</div>
					</div>

				<c:import url="user/common/sideBar.jsp"/>

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>