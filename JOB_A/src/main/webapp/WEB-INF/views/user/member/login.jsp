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

<title>로그인 페이지</title>
<style>

	#loginForm {
	
		width: 440px;
		margin: 0 auto;
		
		margin-top: 250px;
		height: 300px;
	}
	
	#list_2 {
		display: flex;
		height: 100%;
	}
	
	.btn-outline-success {
		width: 100%;
	}
</style>
</head>
<body>		

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<c:import url="../common/header.jsp" />

				<div id="list_1">
					<div id="list_2">

						<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post" id="loginForm">
							<table align="center">
								<tr>
									<td>
										<input type="text" id="mem_focus" class="form-control" placeholder="ID" name="memId" required />
									</td>
								</tr>
								<tr>
									<td>
										<input type="password" class="form-control" name="memPw" placeholder="password" required />
									</td>
								</tr>
								<tr>
									<td>
										<input type="submit" class="btn-outline-success" value="Login"></input>
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" class="btn-outline-success" onclick="goJoin()" value="Join"></input>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>

		<c:import url="../common/sideBar.jsp" />

	</div>
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<%-- 			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script> --%>
			
			<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		function goJoin() {
			location.href = "${pageContext.request.contextPath}/join.do";
		}

		$(function(){
			$("#mem_focus").focus();
			})
	</script>

</body>
</html>