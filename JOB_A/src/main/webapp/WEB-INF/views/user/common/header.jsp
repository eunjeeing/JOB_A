<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<style>
	
	.fas {
		border-bottom: none;
	}


	* {
   font-family: 'Do Hyeon', sans-serif !important;
	}
	
	i {
	      font-family: 'Font Awesome 5 Free' !important;
	}  
	
	.icons {
	}
</style>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="preconnect" href="https://fonts.gstatic.com"> 
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<header id="header">
	<div class="icons" >
		<a href="${pageContext.request.contextPath}" class="logo"><strong style="font-size: 30px;">JOB-A</strong></a>
	</div>
	<div class="icons" >
		<c:if test="${empty member}">
			<a href="${pageContext.request.contextPath}/login.do"><i class="fas fa-sign-in-alt"></i> <span>로그인</span></a>
		</c:if>
		<c:if test="${member.gradeNo le 1}">
			<span>관리자 <a href="${pageContext.request.contextPath}/member/myPage.do?member=${member}">${member.memNick}</a>님, 오늘도 즐거운 노동~!</span>&nbsp;
			<a href="${pageContext.request.contextPath}/member/memberLogout.do"><i class="fas fa-sign-out-alt"></i><span>로그아웃</span></a>
		</c:if>
		<c:if test="${member.gradeNo gt 1}">
			<span><a href="${pageContext.request.contextPath}/member/myPage.do?member=${member}">${member.memNick}</a> 님, 취뽀 화이팅</span>&nbsp;
			<a href="${pageContext.request.contextPath}/member/memberLogout.do"><i class="fas fa-sign-out-alt"></i><span>로그아웃</span></a>
		</c:if>
	</div>
</header>










