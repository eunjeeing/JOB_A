<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/admin/images/favicon.ico" />

<style>
* {
	font-family: 'Do Hyeon', sans-serif !important;
}
</style>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item nav-profile"><a href="#" class="nav-link">
				<div class="nav-profile-image">
					<img
						src="${pageContext.request.contextPath}/resources/admin/images/faces/face1.jpg"
						alt="profile"> <span class="login-status online"></span>
					<!--change to offline or busy as needed-->
				</div>
				<div class="nav-profile-text d-flex flex-column">
					<span class="font-weight-bold mb-2">관리자 아이디</span> <span
						class="text-secondary text-small">관리자 닉네임</span>
				</div> <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="index.html"> <span
				class="menu-title">Home</span> <i class="mdi mdi-home menu-icon"></i>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<span class="menu-title">Member</span> <i class="menu-arrow"></i> <i
				class="mdi mdi-crosshairs-gps menu-icon"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/ui-features/buttons.jsp">Buttons</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/ui-features/typography.jsp">Typography</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/samplePage/icons/mdi.html">
				<span class="menu-title">Icons</span> <i
				class="mdi mdi-contacts menu-icon"></i>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/samplePage/forms/basic_elements.html">
				<span class="menu-title">Forms</span> <i
				class="mdi mdi-format-list-bulleted menu-icon"></i>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/samplePage/charts/chartjs.html">
				<span class="menu-title">Charts</span> <i
				class="mdi mdi-chart-bar menu-icon"></i>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/admin/samplePage/tables/basic-table.html">
				<span class="menu-title">Tables</span> <i
				class="mdi mdi-table-large menu-icon"></i>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#general-pages" aria-expanded="false"
			aria-controls="general-pages"> <span class="menu-title">Sample
					Pages</span> <i class="menu-arrow"></i> <i
				class="mdi mdi-medical-bag menu-icon"></i>
		</a>
			<div class="collapse" id="general-pages">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/samples/blank-page.jsp">
							Blank Page </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/samples/login.jsp">
							Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/samples/register.jsp">
							Register </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/samples/error-404.jsp">
							404 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/samplePage/samples/error-500.jsp">
							500 </a></li>
				</ul>
			</div></li>
		<li class="nav-item sidebar-actions"><span class="nav-link">
				<div class="border-bottom">
					<h6 class="font-weight-normal mb-3">Projects</h6>
				</div>
				<button class="btn btn-block btn-lg btn-gradient-primary mt-4">+
					Add a project</button>
				<div class="mt-4">
					<div class="border-bottom">
						<p class="text-secondary">Categories</p>
					</div>
					<ul class="gradient-bullet-list mt-4">
						<li>Free</li>
						<li>Pro</li>
					</ul>
				</div>
		</span></li>
	</ul>
</nav>