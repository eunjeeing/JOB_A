<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- cnd방식으로 sockjs불러오기 -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
</script>
<title>마이페이지</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


<style>
	
	.porm1{
		width : 750px;
        padding-top: 300px;
		margin: 0 auto;
	
	}
    
    .porm2{
        width: 750px;
        margin: 0 auto;

    }
	.click1, .click2, .click3, .click4{
        float: left;
        width: 250px;
        height: 150px;
        border: 1px solid lightgray;
        border-radius : 5px;
        background-color : lightgray;
		margin-top: 10px;         
 		display : flex;
 		cursor: pointer;
	}
	
	.click1:hover, .click2:hover, .click3:hover, .click4:hover{
		background-color: #f56a6a;

	}
	
	.icon{
		margin-right : -50px;
		
	}
	.click2 .icon a, .click3 .icon a, .click4 .icon a{
		border: none;
	
	}
	
	.next{
		margin-top : 55px;
		margin-left : 15px;	
	}
	.next .number{
		color: white;
		font-size: 25px;
		font-weight: bold;
		letter-spacing: 2px;
		
	}
	
	.click1 a{
		font-size: 18px;
		font-weight: bold;
		color : white;
		border: none;
		letter-spacing: 2px;
		
	}
	
	.click1 a:hover{
		text-decoration:none; 
		color:#EDA900;
		
	}
	.click1 .next {
		margin-top : 49px;
	
	}

	.click2, .click4{
		margin-left : 15px;
		
	}

	.xi-bookmark, .xi-user, .xi-pen, .xi-forum{
		color : white;
		margin : 50px;
		font-size : 60px;
	}
	
</style>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper" id="click1">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<c:import url="../common/header.jsp" />
	
		
					<div class="porm1" id="myPageandScrap">
					<div class="click1">
						<c:if test="${!empty member}"/>
						<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
						
						<div class="icon">
							<i class="xi-user"></i>
						</div>
						<div class="next" id="update">
							<a href="${pageContext.request.contextPath}/member/memberView.do?memId=${member.memId}&memNo=${member.memNo}" title="정보 수정" ><span>${member.memNick}&nbsp;님</span></a>
							<br />
							<span><a href="${pageContext.request.contextPath}/member/memberView.do" id="gradeNo" title=""><span></span></a></span>
						</div>
					</div>
				
					<div class="click2" onclick="location.href='${pageContext.request.contextPath}/myscrap/selectMyScrap.bo?mem_no=${member.memNo}'">
						<c:if test="${!empty member}"/>
						<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
						
						<div class="icon">
							<a href="#" title="내가 스크랩한 게시글"> <i class="xi-bookmark"></i></a>
						</div>
						<div class="next" id="scrab">
							<p class="number">30</p><!-- 내가 스크랩한 게시글 갯수 삽입 코드 -->
						</div>
					</div>
					</div>
					
					<div class="porm2" id="writeandcomment">
					<div class="click3" onclick="location.href='${pageContext.request.contextPath}/mypage/selectMyPost.do?mem_No=${member.memNo}'">
						<c:if test="${!empty member}"/>
						<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
						
						<div class="icon">
						<a href="#" title="내가 작성한 게시글"> <i class="xi-pen"></i></a>
						</div>
						<div class="next" id="writeboard">
							<p class="number">15</p><!-- 내가 작성한 게시글 갯수 삽입 코드 -->
						</div>
					</div>
				
					<div class="click4" onclick="location.href='${pageContext.request.contextPath}/mypage/selectMyComment.do?mem_No=${member.memNo}'">
						<c:if test="${!empty member}"/>
						<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
						
						<div class="icon">
							<a href="#" title="내가 작성한 댓글"> <i class="xi-forum"></i></a>
						</div>
						<div class="next" id="writecomment">
							<p class="number">20</p><!-- 내가 작성한 댓글 갯수 삽입 코드  -->
						</div>
					</div>
				</div>
					
			</div>
		</div>				
			
				<c:import url="../common/sideBar.jsp" />
	</div>	
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			console.log("${member.gradeNo}");
			switch(${member.gradeNo}){
		
			case 2:
				return document.getElementById("gradeNo").innerHTML = "일반회원";
				break;
		
			case 3:
				return document.getElementById("gradeNo").innerHTML = "우수회원";
				break;
				
			case 4:
				return document.getElementById("gradeNo").innerHTML = "최우수회원";
				break;
				
			case 5:
				return document.getElementById("gradeNo").innerHTML = "인사 담당자";
				break;
		}

	})
</script>
</body>
</html>