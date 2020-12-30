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
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title> 로그인 페이지 </title>
<style>
	#loginForm{
		
		margin-top : 100px;
		margin-left : 300px;
 		width : 450px;
		height : 300px;
	}

	#list_2{
	
	display : flex;
	height : 1200px;
	
	}
	
	
	.btn-outline-success{
	
		width : 100%;
		
	} 
	
		
</style>
</head>
<body>
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div id="list_1">
					<c:import url="../user/common/header.jsp"/>  
					<div id="list_2">
						<c:import url="../user/common/sideBar.jsp"/> 
									
				
				<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post" id="loginForm">
				<table align="center">
					<tr>
						<td>
							<input type="text" class="form-control" placeholder="ID" name="memId" required/>			
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" class="form-control" name="memPw" placeholder="password" required/>
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
	</div>			
	<script>
		function goJoin() {
			location.href ="${pageContext.request.contextPath}/join.do";
		}
	</script>
</body>
</html>