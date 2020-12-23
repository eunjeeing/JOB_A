<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>
</head>
<body>
<section>
	<div id="container">
		<!-- <c:import 헤더> -->
			<div id="join-container">
				<form name="memberJoinForm" action="memberJoin.do" method="post" onsubmit="return fn_enroll_validate();" >
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<div id="userId-container">
									<input type="text" class="form-contrl" name="userId" id="userId_" required>
									<!-- 아이디 중복검사 -->
									<span class="guide ok"> 사용 가능 </span>
									<span class="guide error"> 사용 불가 </span>
									<span class="guide invalid"> 4글자 미만</span>
									<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0" />
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" class="from-control" name="password" id="password_" required/>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" class="form-control" id="password2" required/>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" class="form-control" name="nickname" id="nickname_" required/>
							</td>
						</tr>
					</table>
				</form>
			</div>
	</div>
</section>
</body>
</html>