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
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js">
</script>

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
</head>
<style>
	
	.session1{
		width : 600px;
        padding-top: 300px;
		margin: 0 auto;
	
	}
	
    
    .session2{
        width: 600px;
        margin: 0 auto;


    }
	.click1, .click2, .click3, .click4{
        float: left;
        width: 50%;
        height: 150px;
        border: 1px solid black;
       

		
	}


</style>
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
<body>
	<!-- Wrapper -->
	<div id="wrapper" id="click1">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<c:import url="../user/common/header.jsp" />
	
						
		<div class="session1" id="myPageandScrap">
		<div class="click1">
			<c:if test="${!empty member}"/>
			<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>

			<img src="#" alt="" />
			<a href="${pageContext.request.contextPath}/member/memberView.do" class="memberUpdate" title="">${member.memNick}</a>님
			<br />
			<span><a href="${pageContext.request.contextPath}/member/memberView.do" id="gradeNo" title="">${member.gradeNo}</a></span>
		</div>
	
		<div class="click2" >
			<c:if test="${!empty member}"/>
			<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
	
			<a href="#"> 스크랩 페이지</a>
		</div>
		</div>
		
		<div class="session2">
		<div class="click3" >
			<c:if test="${!empty member}"/>
			<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
		
			<a href="#"> 본인이 작성한 게시글 </a>
		</div>
	
		<div class="click4" >
			<c:if test="${!empty member}"/>
			<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>
		
			<a href="#"> 본인이 작성한 댓글 </a>
		</div>
		</div>
		
			</div>
		</div>

				<c:import url="../user/common/sideBar.jsp" />
	</div>	
</body>
</html>