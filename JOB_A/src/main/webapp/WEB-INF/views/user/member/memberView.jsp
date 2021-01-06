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
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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


<title>회원정보 수정 페이지</title>
<style>

	/* 회원가입 폼 사이드바 옆으로 배열*/
	#list_2 {
		display: flex;
		height: 1800px;
	}
	/* 폼 배치 조절 */
	.memberEnrollForm {
		padding-top: 100px;
		padding-left: 280px;

	}
	
	/* 회원가입 버튼 중간배열 */
	.memberEnrollForm input[type=submit]{
		margin-left : 150px;
	}

	/* 필수입력 * color */
	.star {
		color: rgba(232, 112, 112, 0.85);
	}
	
	/* 선호지역 드롭바*/
	#sido1, #sido2, #sido3, #sigugun1, #sigugun2, #sigugun3{
		width : 280.67px;
		border : solid 1px rgba(210, 215, 217, 0.75);
		border-radius : 4px;
		margin-top: 10px;
	}

	/*중복닉네임체크관련*/
	td#memNick-container{position:relative;}
	td#memNick-container span.guide {display:none;font-size: 12px;position:absolute; top:10px; right:20px; padding-top:13px; padding-right:5px;}
	td#memNick-container span.ok{color:green;}
	td#memNick-container span.error, span.invalid{color:red;}
	
	/* 이메일 api*/
	#mail_check_input_box_false{
	    background-color:#ebebe4;
	}

	#mail_check_input_box_true{
	    background-color:white;
	}

	.domain_select{
		border : solid 1px rgba(210, 215, 217, 0.75);
		border-radius : 4px;
		width : 280.67px;
	}
	
	#memBirth{
		border : solid 1px rgba(210, 215, 217, 0.75);
		border-radius : 4px;
		width : 280.67px;
	}
	
	input[type=submit]{
		margin-left : -150px;
	}
</style>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<div id="container">
					<div id="join-container">
						<c:import url="../common/header.jsp" />
						<div id="list_2">


							<form class="memberEnrollForm" id="memberEnrollForm" action="memberEnroll.do" method="post" onsubmit="return validate();">
								<!-- 기본정보 테이블 -->
								<input type="hidden" class="check_email" value="false" /> <!-- 이메일 인증 여부 -->
								<input type="hidden" class="email" name="memEmail" value="" />	<!-- 컨트롤러로 보낼 이메일 -->
								<input type="hidden" class="check_Id" value="false" /> <!-- 아이디 중복 체크 여부 -->
								<input type="hidden" class="check_info" value="false" /> <!-- 약관 체크 여부 -->
								
								<table>
									<tr>
										<h2 class="info">기본정보</h2>
									</tr>
									<tr>
										<th class="table_th">아이디 <span class="star">*</span> </th>
										<td>
											<input type="text" size="30" class="userInputId" name="memId" id="memId_" required value="${member.memId}" readonly="readonly"></td>
										<td>
											
										</td>
									</tr>
									
									<tr>
										<th class="table_th">비밀번호 <span class="star">*</span> </th>
										<td>
											<input type="password" size="30" class="form-control" name="memPw" id="password1" placeholder="영문 대소문자 + 숫자 6~18" required />
										</td>
									</tr>
									<tr>
										<th class="table_th">비밀번호 확인 <span class="star">*</span> </th>
										<td>
											<input type="password" size="30" class="form-control" name="memPwCheck" id="password2" placeholder="영문 대소문자 + 숫자 6~18" required />
										</td>
										<td>										
											<div class="passwordCheck"></div>
										</td>
									</tr>
									<tr>
										<th class="table_th">닉네임 <span class="star">*</span></th>
										<td id="memNick-container">
											<input type="text" size="30" class="form-control" name="memNick" id="nickname_" placeholder="10글자 미만" required />
											<!-- 닉네임 중복 검사 코멘트 추가 -->
											<span class="guide ok">사용 가능</span>
				            				<span class="guide error">사용 불가</span>
				            				<span class="guide invalid">10글자 미만</span>
				            				<input type="hidden" name="nickNameDuplicateCheck" id="nickNameDuplicateCheck" value="0"/>
										</td>
									</tr>
									
									<tr>
										<th class="table_th">이메일 <span class="star">*</span> </th>
										<td>
											<input type="text" width="150px" class="mail_input" id="memEmail" required /> &nbsp;@&nbsp;
											<br />
											<select name="domain" size="1" id="domain" class="domain_select" >
												<option value="none" >&nbsp;&nbsp;&nbsp;- 선택 -</option>
												<option value="self" >- 직접입력 -</option>
												<option value="naver.com" >naver.com</option>
												<option value="gmail.com" >gmail.com</option>
												<option value="hanmail.net" >hanmail.net</option>
												<option value="nate.com" >nate.com</option>
											</select> 
											
										</td>
										<td>
											&nbsp;
											<button type="button" class="mail_check_button" id="confirmCode">인증코드 발송</button> <br>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<input type="text" size="30"  class="mail_check_input_box" id="mail_check_input_box_false" disabled="disabled" />
										</td>
										<td>&nbsp;
											<button type="button" class="confirm_code" name="confirmCodeCheck" id="confirmCodeCheck">인증확인</button>
										</td>

									</tr>
									<tr>
										<th class="table_th">생년월일 <span class="star">*</span></th>
										<td>
											<input type="date" size="30" id="memBirth" name="memBirth" /> 
											<!-- BIRTH_YY --> 
											<!-- <input type="text" size="5" id="yy" class="int" min="1900" max="2021" maxlength="4" placeholder="년(4자)">&nbsp;년
								
													<select size="1" name="birth_mm" id="mm" class="int"> 
													    <option>&nbsp;--</option>
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
													</select> 월
		
								 				<input type="text" size="2.5" id="dd" class="int" min="1" max="31" maxlength="2"> 일 -->
										</td>
									</tr>
								</table>
								
								<br> <br>
								<!-- 추가정보 테이블 -->
								<table>
									<tr>
										<h2 class="info">추가정보</h2>
									</tr>
									<tr>
										<th class="table_th">관심직종 <span class="star">*</span></th>
										<td>
											<input type="checkbox" name="category_No" id="job1" class="jobCheck" value="1" /> 
											<label class="form-check-label" for="job1">경영·사무</label> 
											
											<input type="checkbox" name="category_No" id="job2" class="jobCheck" value="2" /> 
											<label class="form-check-label" for="job2">마케팅·광고·홍보</label>

											<input type="checkbox" name="category_No" id="job3" class="jobCheck" value="3" /> 
											<label class="form-check-label" for="job3">IT·미디어</label><br> 
											
											<input type="checkbox" name="category_No" id="job4" class="jobCheck" value="4" /> 
											<label class="form-check-label" for="job4">영업</label>

											<input type="checkbox" name="category_No" id="job5" class="jobCheck" value="5" /> 
											<label class="form-check-label" for="job5">서비스</label>
											
											<input type="checkbox" name="category_No" id="job6" class="jobCheck" value="6" /> 
											<label class="form-check-label" for="job5">연구개발</label>
											
											<input type="checkbox" name="category_No" id="job7" class="jobCheck" value="7" /> 
											<label class="form-check-label" for="job5">의료</label><br>
											
											<input type="checkbox" name="category_No" id="job8" class="jobCheck" value="8" /> 
											<label class="form-check-label" for="job5">건설</label>
											
											<input type="checkbox" name="category_No" id="job9" class="jobCheck" value="9" /> 
											<label class="form-check-label" for="job5">교육</label>
											
											<input type="checkbox" name="category_No" id="job10" class="jobCheck" value="10" /> 
											<label class="form-check-label" for="job5">생산·제조</label>
											
											<input type="checkbox" name="category_No" id="job11" class="jobCheck" value="11" /> 
											<label class="form-check-label" for="job5">무역·유통</label>
											
										</td>
									</tr>
									
									<tr>
										<th class="table_th">선호지역</th>
										<td>
											<select name="memArea" size="1"  class="location_sido" id="sido1">
												<option value="" > &nbsp;&nbsp;--------------- 시/도 ---------------</option>
											</select> 
											<br />
											<select name="memArea" size="1"  class="location_sigu" id="sigugun1">
												<option value="" >&nbsp;&nbsp;---------------- 구 ----------------</option>
											</select>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<select name="memArea" size="1" class="location_sido" id="sido2">
												<option value="" > &nbsp;&nbsp;--------------- 시/도 ---------------</option>
											</select> 
											<br />
											<select name="memArea" size="1" class="location_sigu" id="sigugun2">
												<option value="" >&nbsp;&nbsp;---------------- 구 ----------------</option>
											</select>
										</td>
									</tr>
									<br />
									<tr>
										<th></th>
										<td>
											<select name="memArea" size="1" class="location_sido" id="sido3">
												<option value="" > &nbsp;&nbsp;--------------- 시/도 ---------------</option>
											</select> 
											<br />
											<select name="memArea" size="1" class="location_sigu" id="sigugun3">
												<option value="" >&nbsp;&nbsp;---------------- 구 ----------------</option>
										</select></td>
									</tr>
								</table>
								<br> 
									<input type="button" class="updateSuccess" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="회원탈퇴">&nbsp;
									<input type="reset" class="updateSuccess" value="취소">&nbsp;
									<input type="submit" class="updateSuccess" onclick="location.href='${pageContext.request.contextPath}/member/memberUpdated.do'" value="수정" >
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="../common/sideBar.jsp" />
		
	</div>
</body>