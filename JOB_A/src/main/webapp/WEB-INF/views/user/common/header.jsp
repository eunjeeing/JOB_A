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

	  
</style>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />

<header id="header">
	<div class="icons" >
		<a href="${pageContext.request.contextPath}" class="logo"><strong>JOB-A</strong></a>
	</div>
	<div class="icons" >
		<c:if test="${empty member}">
			<a href="${pageContext.request.contextPath}/login.do" class="fas fa-sign-in-alt"> <span class="label">로그인</span></a>
		</c:if>
		<c:if test="${!empty member}">
			<c:if test="${member.gradeNo == '0' || member.gradeNo == '1'}">
				<span>관리자 <a href="${pageContext.request.contextPath}/member/member##.do'" title="${member.memNick}"></a>님, 오늘도 즐거운 노동~!</span>
				<a href="${pageContext.request.contextPath}/member/memberLogout.do'" class="fas fa-sign-out-alt"><span class="label">로그아웃</span></a>
			</c:if>
			<span><a href="${pageContext.request.contextPath}/member/#####.do?memId=${member.memId}" title="${member.memNick}"></a> 님, 취뽀 화이팅</span>
			<a href="${pageContext.request.contextPath}/member/memberLogout.do'" class="fas fa-sign-out-alt"><span class="label">로그아웃</span></a>
		</c:if>
	</div>
</header>