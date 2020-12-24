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
		<c:import url="../common/header.jsp"
			<div id="join-container">
				<form name="memberJoinForm" action="memberJoin.do" method="post" onsubmit="return fn_enroll_validate();" >
					<table>
						<tr>
							<h1 class="info" >기본정보</h1>
						</tr>
						<tr>
							<th>아이디 *</th>
							<td>
								<input type="text" size="20" class="form-contrl" name="userId" id="userId" required>
							</td>
							<td>
								<!-- 아이디 중복검사 -->
								&nbsp; <button type="button" class="btn btn-default" id="idCheck">중복확인</button>			
							</td>
						</tr>
						<tr>
							<th>비밀번호 *</th>
							<td>
								<input type="password" size="20" class="form-control" name="password" id="password1" required/>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인 * </th>
							<td>
								<input type="password" size="20" class="form-control" id="password2" required/>
							</td>
						</tr>
						<tr>
							<th>닉네임 * </th>
							<td>
								<input type="text" size="20" class="form-control" name="nickname" id="nickname_" required/>
								<!-- 닉네임 중복 검사 코멘트 추가 -->
								<span class="dupCheck ok">사용 가능</span>
								<span class="dupCheck error">사용 불가</span>
								<span>10글자 미만</span>
								<input type="hidden" name="nicknameCheck" id="nicknameCheck" value="0"/>
							</td>
						</tr>
						<tr>
							<th>이메일 * </th>
							<td>
								<input type="email" size="20" class="form-comtrol" name="email" id="email" required/>
							</td>
							<td>
								<p> @</p>
							</td>
							<td>
								<select name="domain" size="20" id="domain" class="domain_select" >
									<option value="none" >- 선택 -</option>
									<option value="self" >- 직접입력 -</option>
									<option value="naver.com" >naver.com</option>
									<option value="gmail.com" >gmail.com</option>
									<option value="hanmail.net" >hanmail.net</option>
									<option value="nate.com" >nate.com</option>
								</select>
							</td>
							<td>
								<!-- 이메일인증API -->
								&nbsp; <button type="button" class="btn btn-default confirm-code" name="confirmCode" id="confirmCode">인증코드 발송</button> <br>			
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" size="20" name="confirmCodeCheck" id="confirmCodeCheck" />
							</td>
							<td>
								&nbsp; <button type="button" class="btn btn-default confirmCode-Check" name="confirmCodeCheck" id="confirmCodeCheck">인증확인</button>
							</td>
						</tr>
						<tr>
							<th>생년월일 *</th>
							<td id="bir_yy" class="box">
								<!-- <input type="date" size="20" id="date" name="date" /> -->
								<!-- BIRTH_YY -->
                                <input type="text" size="20" id="yy" class="int" maxlength="4" placeholder="년(4자)">
							</td>
							<td id="bir_mm" class="box">
								<select name="birth_mm" id="mm" class="int">
								    <option>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
								</select>
							</td>
							<td id="bir_DD" class="box">
								 <input type="text" size="20" id="dd" class="int" maxlength="2" placeholder="일">
							</td>
					</tr>
					<tr>
						<h1>추가정보</h1>
					</tr>
					<tr>
						<th>관심직종 *</th>
						<td>
							<input type="checkbox" name="jobCheck" id="jobCheck" value="IT" /> IT·인터넷
							<input type="checkbox" name="jobCheck" id="jobCheck" value="dental"/> 의료
							<input type="checkbox" name="jobCheck" id="jobCheck" value="management"/> 경영·사무 <br>
							<input type="checkbox" name="jobCheck" id="jobCheck" value="service"/> 서비스 
							<input type="checkbox" name="jobCheck" id="jobCheck" value="design"/> 디자인 
						</td>
					</tr>
					<tr>
						<th>선호지역</th>
						<td>
							<!-- 이거 어떻게 다 일일히 적지?.... API있나... -->
							<select name="location" size="20" id="location_" class="prefoerLocation" >
								<option value="서울특별시" placeholder="서울특별시">서울특별시</option>
							</select>
							<select name="location" size="20" id="location_" class="prefoerLocation" >
								<option value="구" placeholder="강남구">강남구</option>
							</select>
						</td>
					</tr>
					<tr> 
						<td>
							<select name="location" size="20" id="location_" class="prefoerLocation" >
								<option value="경기도" placeholder="경기도 성남시" >경기도 성남시</option>
							</select>
							<select name="location" size="20" id="location_" class="prefoerLocation" >	
								<option value="구" placeholder="분당구" >분당구</option>
							</select>
						</td>
					</tr>
						<br />
					<tr>
						<td>
							<select name="location" size="20" id="location_" class="prefoerLocation" >	
								<option value="서울특별시" placeholder="서울특별시" >서울특별시</option>
							</select>
							<select name="location" size="20" id="location_" class="prefoerLocation" >	
								<option value="구" placeholder="송파구">송파구</option>
							</select>
						</td>
					</tr>
					<tr>
						<h1>약관동의</h1>
					</tr>
					<tr>
						<td>
							
						</td>
					</tr>
					</table>
				</form>
			</div>
			<c:import url="../common/footer.jsp"
	</div>
</section>
</body>
</html>