<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 페이지 </title>
<style>

		body{
			background-color: rgba(232, 112, 112, 0.85);

		}
		form{
			width:450px;
			height:200px;
			margin-left: auto;
			margin-right: auto;
			margin-bottom: auto;
			margin-top: 10rem;
			background-color: white;
			
		}

		table{
			border-spacing: 5px 10px;
			float: center;
			padding-top: 1rem;
		}

		table td{
			height: auto;
			size: 30px;
		}

		table td input {
			height: 25px;
			border: 1px solid lightgray;
			border-radius: 5px;
		}

		.table_th{
			text-align: left;
			width: 120px;
		}

		table select{
			height: 30px;
			border: 1px solid lightgray;
			border-radius: 5px;
		}

		input{
			width: 235px;
		}

		input[type=submit]{
			height: 25px;
			border-radius: 5px;
			border: 1px solid lightgray;
			background-color: rgba(232, 112, 112, 0.85);
			color: white;
		}

		
</style>
</head>
<body>
	<c:import url="../user/common/header.jsp"/>  
	<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
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
				<input type="submit" class="btn btn-outline-success" value="Login"></input>	
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" class="btn btn-outline-success" onclick="goJoin()" value="Join"></input>
			</td>
		</tr>
	</table>
</form>
			<c:import url="../user/common/sideBar.jsp"/> 
	
	<script>
		function goJoin() {
			location.href ="${pageContext.request.contextPath}/join.do";
		}
		</script>
</body>
</html>