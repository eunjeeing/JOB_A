<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 페이지 </title>
<style>

</style>
</head>
<body>
	 <h1 align="center">로그인 페이지</h1>
	<table align="center" style="background : lightgreen; height : 200px; width : 200px;">
		<tr>
			<td>
				<input type="text" placeholder="아이디"/>			
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" placeholder="비번"/>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button">로그인</button>
				<button type="button" onclick="goJoin()">회원가입</button>
			</td>
		</tr>
	</table>
</body>
</html>