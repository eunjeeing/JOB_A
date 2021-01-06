<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>
<style>
* {
	font-family: 'Do Hyeon', sans-serif !important;
}
.navbar-nav .nav-link {
    padding: 1rem;
}
</style>
</head>

<aside class="sidebar-left border-right bg-white shadow"
			id="leftSidebar" data-simplebar>
			<a href="#"
				class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3"
				data-toggle="toggle"> <i class="fe fe-x"><span
					class="sr-only"></span></i>
			</a>
			<nav class="vertnav navbar navbar-light">
				<!-- nav bar -->
				<div class="w-100 mb-4 d-flex">
					<a class="navbar-brand mx-auto mt-2 flex-fill text-center"
						href="${pageContext.request.contextPath}"
						style="font-weight: bold;"
						>JOB_A
                <g>
                  <polygon class="st0"
								points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0"
								points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0"
								points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
					</a>
				</div>
				<div class="w-100 mb-4 d-flex" style="display: flex; align-items: center;flex-direction: column">
					<div>
				 		<img
						src="${pageContext.request.contextPath}/resources/admin/images/admin.png"
						alt="..." class="avatar-img rounded-circle"
						style="width: 60px; height : 60px; overflow: hidden; margin-bottom: 7px;">
					</div>
					<div>
						<a href="" style="text-decoration: none; font-size: 20px;">
							${member.memId}
						</a><!-- 개인정보 수정페이지로 이동 -->
					</div>
				</div>
				<br />
			
				
				<ul class="navbar-nav flex-fill w-100 mb-2">
				
					<li class="nav-item w-100"><a class="nav-link"
						href="${pageContext.request.contextPath}/adminIndex.do"> 
						<i class="fe fe-home fe-16"></i> <span
							class="ml-3 item-text">HOME</span>
					</a></li>
					
					<!-- 회원 관리 -->
					<li class="nav-item dropdown"><a href="#member-elements"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle nav-link"> <i class="fe fe-smile fe-16"></i>
							<span class="ml-3 item-text">MEMBER</span>
					</a>
						<ul class="collapse list-unstyled pl-4 w-100" id="member-elements">
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Admin Register</span>
							</a></li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Admin List</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Member List</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Member Grade</span></a>
							</li>
						</ul></li>
					<!-- 공지사항 -->
					<li class="nav-item dropdown"><a href="#notice"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle nav-link"> <i
							class="fe fe-file-text fe-16"></i> <span class="ml-3 item-text">NOTICE</span>
					</a>
						<ul class="collapse list-unstyled pl-4 w-100" id="notice">
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Notice List</span></a></li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Write Notice</span></a></li>
						</ul></li>
						
					<!-- 게시판 관리 -->
					<li class="nav-item dropdown"><a href="#board"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle nav-link"> <i class="fe fe-grid fe-16"></i>
							<span class="ml-3 item-text">BOARD</span>
					</a>
						<ul class="collapse list-unstyled pl-4 w-100" id="board">
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Board List</span></a></li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Mentoring</span></a></li>
						</ul></li>
									
					<!-- 신고 관리 -->
					<li class="nav-item dropdown"><a href="#report"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle nav-link"> <i
							class="fe fe-alert-triangle fe-16"></i> <span class="ml-3 item-text">REPORT</span>
					</a>
						<ul class="collapse list-unstyled pl-4 w-100" id="report">
							<li class="nav-item"><a class="nav-link pl-3"
								href="#"><span class="ml-1 item-text">Board</span></a></li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#"><span class="ml-1 item-text">Comment</span></a>
							</li>
							
						</ul></li>
						
					<!-- 통계 관리 -->
					<li class="nav-item dropdown"><a href="#static"
						data-toggle="collapse" aria-expanded="false"
						class="dropdown-toggle nav-link"> <i
							class="fe fe-bar-chart-2 fe-16"></i> <span class="ml-3 item-text">STATICS</span>
					</a>
						<ul class="collapse list-unstyled pl-4 w-100" id="static">
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">User Static</span></a></li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Board Static</span></a>
							</li>
							<li class="nav-item"><a class="nav-link pl-3"
								href="#">
								<span class="ml-1 item-text">Report Static</span></a>
							</li>
							
						</ul></li>
				</ul>
				
				</ul>

				<!-- <p class="text-muted nav-heading mt-4 mb-1">
					<span>Documentation</span>
				</p>
				<ul class="navbar-nav flex-fill w-100 mb-2">
					<li class="nav-item w-100"><a class="nav-link"
						href="../docs/index.html"> <i class="fe fe-help-circle fe-16"></i>
							<span class="ml-3 item-text">Getting Start</span>
					</a></li>
				</ul> -->
				<!-- <div class="btn-box w-100 mt-4 mb-1">
					<a
						href="https://themeforest.net/item/tinydash-bootstrap-html-admin-dashboard-template/27511269"
						target="_blank" class="btn mb-2 btn-primary btn-lg btn-block">
						<i class="fe fe-shopping-cart fe-12 mx-2"></i><span class="small">Buy
							now</span>
					</a>
				</div> -->
			</nav>
		</aside>