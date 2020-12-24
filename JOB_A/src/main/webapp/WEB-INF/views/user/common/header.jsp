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
		<a href="index.ma" class="logo"><strong>JOB-A</strong></a>
	</div>
	<div class="icons" >
		<c:if test="${empty member}">
			<a href="#" class="fas fa-sign-in-alt"> <span class="label">로그인</span></a>
		</c:if>
		<c:if test="${!empty member}">	
			<span><a href="${pageContext.request.contextPath}/member/#####.do?memId=${member.memId}" title="${member.memNick}"></a> 님, 취뽀 화이팅</span>
			<a href="location.href='${pageContext.request.contextPath}/member/#####.do'" class="fas fa-sign-out-alt"> <span class="label">로그아웃</span></a>
		</c:if>
	</div>
</header>