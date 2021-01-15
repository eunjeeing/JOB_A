<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	.sideUl li {
		font-size: 18px;
	}
</style>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
--%>
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
  
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2 style="font-size: 30px;">JOB-A</h2>
			</header>
			<ul class="sideUl">
				<li><a href="${pageContext.request.contextPath}/notice.bo">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/board2/selectJobList.do">채용 공고</a></li>
				<li><a href="${pageContext.request.contextPath}/calendar.do">채용 달력</a></li>
				<li><span class="opener">취준진담</span>
					<ul>
						<li><a href="${pageContext.request.contextPath}/board2/blahList.do">블라블라</a></li>						
						<li><a href="${pageContext.request.contextPath}/board2/selectBlindList.do">블라인드</a></li>
						<li><a href="${pageContext.request.contextPath}/tomorrowList.bo">언틸 투모로우</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/board2/selectQnAList.do">레벨 업</a></li>
				<li><a href=javascript:void(0);" onclick="chat();">실시간 채팅</a></li>
				<li><a href="${pageContext.request.contextPath}/mentoList.bo">멘토 멘티</a></li>
				<li><span class="opener">꿀팁 후기</span>
					<ul>
						<li><a href="${pageContext.request.contextPath}/interviewList.bo">면접 후기</a></li>
						<li><a href="${pageContext.request.contextPath}/acceptList.bo">합격 후기</a></li>
					</ul>
				</li>
			
			</ul>
			<hr style="border-bottom: solid 2px rgba(210, 215, 217, 0.75)"/>
		</nav>

		<br />
		<br /><br />
		<!-- Footer -->
			<header class="major">
				<h2>더 궁금하신 점이 있으신가요?</h2>
			</header>
			<ul class="contact">
				<li class="icon solid fa-envelope"><a href="#">support@job-ja8a.com</a></li>
				<li class="icon solid fa-phone">(000) 000-0000</li>
				<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
					Nashville, TN 00000-0000
				<li class="icon solid fa-link"><a href="${pageContext.request.contextPath}/resources/uplaodFiles/common/서비스소개.pdf" download="서비스소개.pdf">서비스 소개</a> &nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/resources/uplaodFiles/common/이용약관.pdf" download="이용약관.pdf">이용약관</a></li>
			</ul>

		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>
		<!-- Scripts -->
<%-- 	<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script> --%>
		<%-- <script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script> --%>
		<%-- <script src="${pageContext.request.contextPath}/resources/js/util.js"></script> --%>
		<%-- <script src="${pageContext.request.contextPath}/resources/js/main.js"></script> --%>
		<script>
	      // Menu.
	      var $menu = $('#menu'),
	         $menu_openers = $menu.children('ul').find('.opener');
	
	      // Openers.
	         $menu_openers.each(function() {
	
	            var $this = $(this);
	
	            $this.on('click', function(event) {
	
	               // Prevent default.
	                  event.preventDefault();
	
	               // Toggle.
	                  $menu_openers.not($this).removeClass('active');
	                  $this.toggleClass('active');
	
	               // Trigger resize (sidebar lock).
	                  $window.triggerHandler('resize.sidebar-lock');
	
	            });
	
	         });

		function chat() {
			var id = '${member.memId}';
	        if (id == '') {
	            alert("로그인 후 이용해 주세요");
	            return false;
	        } else {
	            location.href = "${pageContext.request.contextPath}/chat/chatList";
	        }
	    }
         
        </script>
	</div>
</div>