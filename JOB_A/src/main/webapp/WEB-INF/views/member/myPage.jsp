<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<style>

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
	<div>
		<c:if test="${!empty member}"/>
		<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}"/>

		<img src="#" alt="#" />
		<a href="${pageContext.request.contextPath}/member/memberView.do" class="memberUpdate" title="">${member.memNick}</a>님
		<span><a href="${pageContext.request.contextPath}/member/memberView.do" id="gradeNo" title="">${member.gradeNo}</a></span>
	</div>
	</div>
		<c:if test="${!empty member}">
		<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}">
	
		<a href="#"> 스크랩 페이지</a>
	<div>
	<div>
		<c:if test="${!empty member}">
		<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}">
		
		<a href="#"> 본인이 작성한 게시글 </a>
	</div>
	
	<div>
		<c:if test="${!empty member}">
		<c:if test="${member.gradeNo >= '2' && member.gradeNo <= '5'}">
		
		<a href="#"> 본인이 작성한 댓글 </a>
	</div>
</body>
</html>