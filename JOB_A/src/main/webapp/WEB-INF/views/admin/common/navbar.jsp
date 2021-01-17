<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>
<!-- Simple bar CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/simplebar.css">
<!-- Icons CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/dropzone.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/uppy.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.steps.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/app-light.css"
	id="lightTheme">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/app-dark.css"
	id="darkTheme" disabled>

</head>

<nav class="topnav navbar navbar-light">
        <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
          <i class="fe fe-menu navbar-toggler-icon"></i>
        </button>

        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="dark">
              <i class="fe fe-sun fe-16"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="${pageContext.request.contextPath}/member/memberLogout.do" id="logout">
              <i class="fe fe-log-out fe-16"></i>
            </a>
          </li>

          <!-- <li class="nav-item nav-notif">
            <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-notif">
              <span class="fe fe-bell fe-16"></span>
              <span class="dot dot-md bg-success"></span>
            </a>
          </li> -->
          <div style="padding-top: 15px; padding-left: 10px;">
          	<a href="" style="text-decoration: none; ">
          		${member.memNick}&nbsp;님 월급루팡은 안돼요~
          	</a>
          </div>
        </ul>
      </nav>