<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
  
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>JOB-A</h2>
			</header>
			<ul>
				<li><a href="index.ma">공지사항</a></li>
				<li><span class="opener">모집 공고</span>
					<ul>
						<li><a href="#">채용 공고</a></li>
						<li><a href="#">대외 활동</a></li>
					</ul></li>
				<li><span class="opener">취준진담</span>
					<ul>
						<li><a href="#">블라블라</a></li>
						<li><a href="#">블라인드</a></li>
						<li><a href="#">언틸 투모로우</a></li>
					</ul></li>
				<li><a href="#">멘토 멘티</a></li>
				<li><a href="#">Q & A</a></li>
				<li><span class="opener">꿀팁 후기</span>
					<ul>
						<li><a href="#">면접 후기</a></li>
						<li><a href="#">합격 후기</a></li>
					</ul></li>
			</ul>
		</nav>

		<br />
		<br /><br /><br /><br />
		<!-- Footer -->
			<header class="major">
				<h2>더 궁금하신 점이 있으신가요?</h2>
			</header>
			<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare
				velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed
				aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus
				aliquam.</p>
			<ul class="contact">
				<li class="icon solid fa-envelope"><a href="#">support@job-ja8a.com</a></li>
				<li class="icon solid fa-phone">(000) 000-0000</li>
				<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
					Nashville, TN 00000-0000
				<li class="icon solid fa-link"><a href="${pageContext.request.contextPath}/resources/uplaodFiles/서비스소개.pdf" download="서비스소개.pdf">서비스 소개</a> &nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/resources/uplaodFiles/이용약관.pdf" download="이용약관.pdf">이용약관</a></li>
			</ul>

		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	</div>
</div>